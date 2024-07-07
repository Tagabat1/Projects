plot(sp500_adj,
     main = "S&P 500 Daily Index Adjusted Closing Values",
     xlab = "Date",
     ylab = "Index Price",
     col = "red")
plot.zoo(sp500_adj,
         main = "S&P 500 Daily Index Adjusted Closing Values",
         xlab = "Date",
         ylab = "Index Price",
         col = "blue")
ggplot(sp500_adj, aes(index(sp500_adj), sp500_adj)) +
  geom_rect(aes(xmin = as.Date("2007-06-01"), xmax = as.Date("2009-05-31"),
                ymin = 0, ymax = max(sp500_adj)), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2020-01-31"), xmax = as.Date("2020-12-31"),
                ymin = 0, ymax = max(sp500_adj)), fill = "pink", alpha = 0.1) +
  geom_rect(aes(xmin = as.Date("2022-02-24"), xmax = as.Date("2023-02-24"),
                ymin = 0, ymax = max(sp500_adj)), fill = "pink", alpha = 0.1) +
  geom_line(color = "black") +
  ggtitle(label = "S&P 500 Daily Index Value in Points",
          subtitle = "Adjusted Closing Price") +
  labs(x = "Date",
       y = "Index Value in Points",
       caption = "Data Source: Yahoo!Finance") +
  annotate("text", x = as.Date("2008-06-01"), y = 500,
           label = "Global Financial Crisis", col = "black", size = 2) +
  annotate("text", x = as.Date("2020-08-01"), y = 2000,
           label = "Covid-19", col = "black", size = 2) +
  annotate("text", x = as.Date("2022-07-24"), y = 2500,
           label = "War in Ukraine",col = "black", size = 2) +
  scale_x_date(breaks = date_breaks("1 year"),
               labels = date_format("%Y")) +
  scale_y_continuous(breaks = seq(0, max(sp500_adj), by = 250),
                     minor_breaks = waiver()) +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 10, angle = 90))
