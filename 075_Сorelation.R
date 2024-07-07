cov(lmt_adj, sp500_adj) / (sd(lmt_adj) * sd(sp500_adj))
cor(lmt_adj, sp500_adj)
library(rmgarch)
spec = dccspec(uspec = multispec(replicate
              (2, ugarchspec(mean.model = list
              (armaOrder = c(1, 1)), variance.model = list
              (garchOrder = c(1, 1))))))
fit = dccfit(spec, data = data.frame(lmt_adj, sp500_adj))
rho = rcor(fit)
mean(rho[1, 2, ])
sd(rho[1, 2, ])

