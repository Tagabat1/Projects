lmt_index <- ds
lmt_adj_tsibble <- lmt_adj %>%
  as_tibble() %>%
  mutate(Date = lmt_index) %>%
  pivot_longer(LMT.Adjusted,
               names_to = "Asset",
               values_to = "Adjusted.Closing.Price") %>%
  distinct() %>%
  as_tsibble(key = Asset,
             index = Date,
             regular=TRUE) %>%
  fill_gaps()
lmt_arima_fit <- lmt_adj_tsibble %>%
  model(arima = ARIMA(Adjusted.Closing.Price ~ pdq(0,1,0)))
lmt_adjo_tsibble <- lmt_arima_fit %>%
  interpolate(lmt_adj_tsibble)
lmt_arima_fit %>%
  forecast(h="1 year") %>%
  autoplot(lmt_adj_tsibble) +
  ggtitle(label = "LMT Daily Index Value in points",
          subtitle = "1 year forecast with ARIMA(0,1,0)") +
  labs(x=NULL,
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_x_date(breaks = date_breaks("1 year"),
               labels = date_format("%Y")) +
  scale_y_continuous(breaks = seq(0, 475, by = 50),
                     minor_breaks = waiver()) +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(size=10, angle=90))