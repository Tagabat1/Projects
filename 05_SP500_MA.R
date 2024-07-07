sp500_ma100 <- rollapply(sp500_adj, FUN="mean", width=100, align="right")
sp500_ma500 <- rollapply(sp500_adj, FUN="mean", width=500, align="right")
str(sp500_ma100)

sp500_with_ma <- cbind(sp500_adj,sp500_ma100,sp500_ma500)

ggplot(sp500_with_ma, aes(x=index(sp500_with_ma))) +
  geom_line(aes(y=sp500_adj, color='lmtvalues')) +
  geom_line(aes(y=sp500_ma100, color='lmtma100')) +
  geom_line(aes(y=sp500_ma500, color='lmtma500')) +
  ggtitle(label="S&P 500 Daily Index Value in Points",
          subtitle = "Adjusted Closing Price and Moving Averages") +
  labs(x = NULL,
       y = NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_x_date(breaks=date_breaks("1 year"),
               labels=date_format("%Y")) +
  scale_y_continuous(breaks=seq(0,5000,by=500),
                     minor_breaks = waiver()) +
  scale_color_manual(name = NULL,
                     values =c('lmtvalues'='black',
                               'lmtma100'='red',
                               'lmtma500'='blue'),
                     labels = c('Adjusted LMT Stock Values',
                                '100-day moving average',
                                '500-day moving average')) +
  theme_tq() +
  theme(axis.text.x = element_text(size=10, angle=90))