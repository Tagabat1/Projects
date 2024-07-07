ggplot(lmt_ohlc_xts, aes(x=index(lmt_ohlc_xts))) +
  geom_line(aes(y=LMT.Adjusted), color="black") +
  geom_bbands(aes(high=LMT.High,
                  low=LMT.Low,
                  close=LMT.Adjusted),
              ma_fun=EMA,
              n=100) +
  ggtitle(label="LMT Stock Daily Value in Points",
          subtitle = "Adjusted Closing Price and Bollinger Bands") +
  labs(x=NULL,
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_x_date(breaks=date_breaks("1 year"),
             labels=date_format("%Y")) +
  scale_y_continuous(breaks=seq(0,500,by=50),
                     minor_breaks = waiver()) +
  theme_tq() +
  theme(axis.text.x = element_text(size=10, angle=90))