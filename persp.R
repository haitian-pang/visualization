  require(grDevices) 
  require(shape)
  x <- seq(0,1,0.1)
  y <- x
  z = matrix(result,ncol=length(x))
  persp(x, y, z, theta = 20, phi = 20,
        expand = 0.5, col = drapecol(z),
        r=180,
        ltheta = 120,
        shade = 0.75, 
        ticktype = "detailed",
        xlab = "X", ylab = "Y", zlab = "Z" ,
        #border=30
  ) 
