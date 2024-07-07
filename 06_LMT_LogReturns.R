lmt_return_daily_c <- diff(log(lmt_adj),lag=1)
sum(is.na(lmt_return_daily_c))
lmt_return_daily_c <- na.omit(lmt_return_daily_c)
sum(is.na(lmt_return_daily_c))
str(lmt_return_daily_c)
lmt_return_df <- data.frame(lmt_return_daily_c)
lmt_return_df <- lmt_return_df %>%
  rename(LMT.daily.return=LMT.Adjusted)
lmt_return_daily_c <- as.xts(lmt_return_df, index(lmt_return_daily_c))
lmt_return_daily_c <- as.xts(lmt_return_df, index(lmt_return_daily_c))
par(las=1, lty=1, mai=c(1,1,1,1))
plot(lmt_return_daily_c, type="l", main="LMT - Daily Logarithmic Returns",
     xlab="Date", ylab="Daily Returns", col="black")
ggplot(lmt_return_daily_c,
       aes(index(lmt_return_daily_c), lmt_return_daily_c)) +
  geom_rect(aes(xmin = as.Date("2007-06-01"), xmax = as.Date("2009-05-31"),
                ymin = -.16, ymax = .16), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2020-01-31"), xmax = as.Date("2020-12-31"),
                ymin = -.16, ymax = .16), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2022-02-24"), xmax = as.Date("2023-02-24"),
                ymin = -.16, ymax = .16), fill = "pink", alpha = 0.1) +
  geom_line(color="blue") +
  annotate("text", x = as.Date("2008-06-01"), y = 0,
           label = "Global Financial Crisis", col = "white", size = 2)+
  annotate("text", x = as.Date("2020-08-01"), y = 0,
           label = "Covid-19", col = "white", size = 2)+
  annotate("text", x = as.Date("2022-07-24"), y = 0,
           label = "War",col = "white", size = 2)+
  ggtitle(label="LMT - Daily Logarithmic Returns",
          subtitle = "Volatility Clusters are Clearly Visible") +
  labs(x="Date", y="Index Returns", caption="Data Source: Yahoo!Finance")+
  scale_x_date(breaks=date_breaks("1 year"), labels=date_format("%Y")) +
  scale_y_continuous(breaks=seq(-.27, +.25, by=.02),
                     minor_breaks = waiver()) +
  theme_minimal() +
  theme(axis.text.x = element_text(size=10, angle=90))