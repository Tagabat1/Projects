lmt_ohlc_xts <- getSymbols("LMT", 
                           src = "yahoo",
                           from = "1985-01-01",
                           to = "2023-03-15",
                           missing = "remove",
                           auto.assign = FALSE)
str(lmt_ohlc_xts)
head(lmt_ohlc_xts, 5)
tail(lmt_ohlc_xts, 5)
lmt_adj <- Ad(lmt_ohlc_xts)
sum(is.na(lmt_adj))
lmt_ohls_zoo <- fortify.zoo(lmt_ohlc_xts)
write.csv(lmt_ohls_zoo, "lmt_ohlc_zoo.csv")
getwd()
