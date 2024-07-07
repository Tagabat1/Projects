lmt_ma100 <- rollapply(lmt_adj, FUN="mean", width=100, align="right")
lmt_ma500 <- rollapply(lmt_adj, FUN="mean", width=500, align="right")
str(lmt_ma100)

lmt_with_ma <- cbind(lmt_adj,lmt_ma100, lmt_ma500)

ggplot(lmt_with_ma, aes(x=index(lmt_with_ma))) +
  geom_line(aes(y=lmt_adj, color='lmtvalues')) +
  geom_line(aes(y=lmt_ma100, color='lmtma100')) +
  geom_line(aes(y=lmt_ma500, color='lmtma500')) +
  ggtitle(label="LMT Stock Value in Points",
          subtitle = "Adjusted Closing Price and Moving Averages") +
  labs(x = NULL,
       y = NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_x_date(breaks=date_breaks("1 year"),
               labels=date_format("%Y")) +
  scale_y_continuous(breaks=seq(0,500,by=50),
                     minor_breaks = waiver()) +
  scale_color_manual(name = NULL,
                     values =c('lmtvalues'='black',
                               'lmtma100'='red',
                               'lmtma500'='blue'),
                     labels = c('100-day moving average',
                                '500-day moving average',
                                'Adjusted LMT Stock Values')) +
  theme_tq() +
  theme(axis.text.x = element_text(size=10, angle=90))