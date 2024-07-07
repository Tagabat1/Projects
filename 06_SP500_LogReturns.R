sp500_return_daily_c <- diff(log(sp500_adj),lag=1)
sum(is.na(sp500_return_daily_c))
sp500_return_daily_c <- na.omit(sp500_return_daily_c)
sum(is.na(sp500_return_daily_c))
str(sp500_return_daily_c)
sp500_return_df <- data.frame(sp500_return_daily_c)
sp500_return_df <- sp500_return_df %>%
  rename(GSPC.daily.return=GSPC.Adjusted)
sp500_return_daily_c <- as.xts(sp500_return_df, index(sp500_return_daily_c))
