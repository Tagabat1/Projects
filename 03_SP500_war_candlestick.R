ggplot(sp500_ohlc_xts, aes(index(sp500_ohlc_xts), GSPC.Adjusted)) +
  geom_candlestick(aes(open = GSPC.Open,
                       high = GSPC.High,
                       low = GSPC.Low,
                       close = GSPC.Adjusted),
                   colour_up = "darkgreen",
                   colour_down = "darkred",
                   fill_up = "darkgreen", 
                   fill_down = "darkred") +
  ggtitle(label = "S&P 500 Daily Index Value in Points when War in Ukraine Started",
          subtitle = "OHLC Data as a candlestick chart") +
  labs(x=NULL,
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  coord_x_date(xlim = c("2022-06-13", "2022-09-25"),
               ylim = c(3600, 4300)) +
  scale_x_date(breaks=date_breaks("1 week"),
               labels=date_format("%Y-%m-%d")) +
  theme_minimal() +
  theme(axis.text.x = element_text(size=10, angle=90))
