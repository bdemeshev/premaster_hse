
library(xtable)


x <- seq(from=0.05, to=2.8, by=0.05)
df <- data.frame(x=x,F=pnorm(x))


k <- 4
result <- NULL
for (i in 1:k) {
  part <- as.matrix(df[(nrow(df)/k*(i-1)+1):(nrow(df)/k*i), ])
  result <- cbind(result, part)
}


colnames(result) <- rep(c("$x$","$F(x)$"), k)

print(xtable(result, digits=3, align="rrr|rr|rr|rr"), 
      include.rownames=FALSE, 
      sanitize.colnames.function = identity)


