hist(lmt_return_daily_c, main="Histogram of LMT - Daily Logarithmic Returns",
     breaks=100, freq=FALSE, xlab="Daily Return", plot=TRUE)
lmt_mu <- mean(lmt_return_daily_c)
lmt_volatility <- sd(lmt_return_daily_c)
normdist_lmt <- function (x){dnorm(x ,mean=lmt_mu, sd=lmt_volatility)}
curve(normdist_lmt, from=-0.1, to=+0.1, add=TRUE, col="red", lwd=2)
abline(v=lmt_mu, col="blue", lty=2, lwd=2)

fitted_student_t_lmt <- fit.st(lmt_return_daily_c)
t_parameters_lmt <- fitted_student_t_lmt$par.ests
nu <- t_parameters_lmt[1]
mu <- t_parameters_lmt[2]
sigma <- t_parameters_lmt[3]
student_t_lmt <- function(x) {dt((x-mu)/sigma, df=nu)/sigma}
ggplot(lmt_return_daily_c, aes(lmt_return_daily_c)) +
  geom_histogram(aes(y=stat(density)), binwidth=.002, fill = "grey") +
  stat_function(fun=normdist_lmt, aes(color='normal')) +
  stat_function(fun=student_t_lmt, aes(color='student')) +
  geom_vline(xintercept=lmt_mu, linetype="dashed", color="black") +
  geom_density(aes(color='kernel')) +
  ggtitle(label="Histogram of LMT Daily Returns and Fitted Densities",
          subtitle = "Continuous (Logarithmic) Returns") +
  labs(x="Daily Return in Decimal Notation",
       y=NULL,
       caption="Data Source: Yahoo!Finance") +
  scale_x_continuous(breaks=seq(-.27,.15,by=.01),
                     minor_breaks = waiver()) +
  scale_color_manual(name = 'Densities',
                     values =c('normal'='red',
                               'student'='blue',
                               'kernel'='green'),
                     labels = c('Kernel density',
                                'Fitted normal distribution',
                                'Fitted student-t distribution')) +
  theme_minimal() +
  theme(legend.position = c(.8,.8),
        legend.key = element_rect(color=NA, fill=NA),
        legend.box.background=element_blank(),
        axis.text.x = element_text(angle=90))

lmt_skew <- skewness(lmt_return_daily_c)
lmt_kurt <- kurtosis(lmt_return_daily_c)
print(lmt_skew)
print(lmt_kurt)
qqnorm(lmt_return_daily_c, main="LMT Daily Returns vs. Normal")
qqline(lmt_return_daily_c, distribution=qnorm, col="red")
