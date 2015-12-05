library(rJava)
library(Rwordseg)
library(wordcloud)
wfreqcloud <- function(text)
{
  stopword <- read.csv("nonsense.txt",header=F,encoding = "UTF-8",stringsAsFactors = F)$V1
  #移除数字
  numberRemoved <- sapply(text, function(x){gsub("[0-9０１２３４５６７８９]","",x)})
  #中文分词
  segmented <- segmentCN(numberRemoved)
  word <- unlist(segmented)
  #去单字和无关词汇
  word<-word[which(nchar(word)>1 & !word%in%stopword)]
  wordtable<-as.data.frame(table(word))
  #降序排列
  od <- order(wordtable$Freq,decreasing=T)
  wordtable$word = wordtable$word[od]
  wordtable$Freq = wordtable$Freq[od]
  write.csv(wordtable,paste('freq_test.txt',sep = ''),fileEncoding="UTF-8",row.names=F)
  #画图并保存成图片
  png(paste('cloud_test.png',sep = ''), width=6, height=4, units="in", res=400) 
  wordcloud(wordtable$word[1:60],wordtable$Freq[1:60],max.words =100,random.order = F, colors=brewer.pal(8, "Dark2"))#col = rainbow(length(wordfreq[1:60])),
  dev.off()
}
