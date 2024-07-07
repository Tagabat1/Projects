ds <- as.Date(index(lmt_adj),
              format="%Y-%m-%d",
              index=seq(1:length(lmt_adj)))
lmt_values <- data.frame(lmt_adj$LMT.Adjusted) %>%
  rename(y=LMT.Adjusted)
lmt_df <- data.frame(cbind(ds, lmt_values))
library(prophet)
lmt_prophet <- prophet(lmt_df, daily.seasonality=TRUE)
lmt_future <- make_future_dataframe(lmt_prophet, periods = 250)
lmt_forecast <- predict(lmt_prophet, lmt_future)

plot(lmt_prophet, lmt_forecast) +
  ggtitle(label="LMT Index Values (Actual and Forecast)",
          subtitle = "Prophet Forecast 250 days") +
  labs(x="Time",
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_y_continuous(breaks=seq(0,max(lmt_adj),by=50),
                     minor_breaks = waiver()) +
  theme_minimal() +
  theme(axis.text.x = element_text(size=10, angle=90))
