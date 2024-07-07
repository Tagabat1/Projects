ggplot(lmt_adj, aes(index(lmt_adj), lmt_adj)) +
  geom_rect(aes(xmin = as.Date("2007-06-01"), xmax = as.Date("2009-05-31"),
                ymin = 0, ymax = max(lmt_adj)), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2020-01-31"), xmax = as.Date("2020-12-31"),
                ymin = 0, ymax = max(lmt_adj)), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2022-02-24"), xmax = as.Date("2023-02-24"),
                ymin = 0, ymax = max(lmt_adj)), fill = "pink", alpha = 0.1) +
  geom_line(color = "black") +
  geom_line(aes(y=sp500_adj/max(sp500_adj)*max(lmt_adj)), color="red") + # Scale the sp500_adj line
  scale_y_continuous(sec.axis=sec_axis(~.*max(sp500_adj)/max(lmt_adj),
                                       breaks=seq(0,max(sp500_adj),750))) + # Add a secondary y-axis
  ggtitle(label = "LMT Stock & S&P 500 Index Daily Value in Points",
          subtitle = "Adjusted Closing Price") +
  labs(x = "Date",
       y = "Stock Value in Points",
       caption = "Data Source: Yahoo!Finance") +
  annotate("text", x = as.Date("2008-06-01"), y = 200,
           label = "Global Financial Crisis", col = "black", size = 2) +
  annotate("text", x = as.Date("2020-08-01"), y = 200,
           label = "Covid-19", col = "black", size = 2) +
  annotate("text", x = as.Date("2022-07-24"), y = 250,
           label = "War in Ukraine",col = "black", size = 2) +
  scale_x_date(breaks=date_breaks("1 year"),
               labels=date_format("%Y")) +
  theme_minimal() +
  theme(axis.text.x=element_text(size=10, angle=90))
