ggplot(lmt_ohlc_xts, aes(index(lmt_ohlc_xts), LMT.Adjusted)) +
  geom_candlestick(aes(open = LMT.Open,
                       high = LMT.High,
                       low = LMT.Low,
                       close = LMT.Adjusted),
                   colour_up = "darkgreen",
                   colour_down = "darkred",
                   fill_up = "darkgreen", 
                   fill_down = "darkred") +
  ggtitle(label = "LMT Stock Daily Value in Points when War in Ukraine Started",
          subtitle = "OHLC Data as a candlestick chart") +
  labs(x=NULL,
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  coord_x_date(xlim = c("2022-09-01", "2022-11-11"),
               ylim = c(375, 500)) +
  scale_x_date(breaks=date_breaks("1 week"),
               labels=date_format("%Y-%m-%d")) +
  theme_minimal() +
  theme(axis.text.x = element_text(size=10, angle=90))
