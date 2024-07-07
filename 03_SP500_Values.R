sp500_ohlc_xts <- getSymbols("^GSPC", 
                           src = "yahoo",
                           from = "1985-01-01",
                           to = "2023-03-15",
                           missing = "remove",
                           auto.assign = FALSE)
str(sp500_ohlc_xts)
head(sp500_ohlc_xts, 5)
tail(sp500_ohlc_xts, 5)
sp500_adj <- Ad(sp500_ohlc_xts)
sum(is.na(sp500_adj))
sp500_ohls_zoo <- fortify.zoo(sp500_ohlc_xts)
write.csv(sp500_ohls_zoo, "sp500_ohlc_zoo.csv")
