loan_industry2 <- data.frame(loan_industry[105:1040,])
colnames(loan_industry2) <- c("年", "產業別", "企業產業貸款總家數", "企業產業貸款總金額_仟元", "企業產業貸款平均金額_仟元")
require(stringr)
loan_industry2$年 <- str_replace(string = loan_industry2$年, pattern = "\\d{2}$", replacement = "")

new_loan_industry <- aggregate(企業產業貸款總金額_仟元~年+產業別, loan_industry2, sum)

require(ggplot2)
require(useful)
ggplot(new_loan_industry, aes(年, 企業產業貸款總金額_仟元, color=產業別, group=產業別, linetype=產業別)) +
      geom_line(aes(color=產業別), size=1.5) + 
      scale_y_continuous(label=multiple_format(extra=dollar, multiple="M")) + 
      theme(legend.text = element_text(size = 14, face = "bold"))

datatots <- new_loan_industry$企業產業貸款總金額_仟元[new_loan_industry$產業別 == "12金融保險業"]

loan_industry_ts <- ts(datatots, start = min(new_loan_industry$年), end = max(new_loan_industry$年))

plot(loan_industry_ts, 
     main = "金融保險業貸款金額2013-2018變化趨勢圖",
     ylab = "企業貸款總金額(仟元)", 
     xlab = "年")

Finacf <- acf(loan_industry_ts)
Finpacf <- pacf(loan_industry_ts, title = "金融保險業貸款金額PACF圖")
plot(Finacf, main = "金融保險業貸款金額ACF圖")
plot(Finpacf, main = "金融保險業貸款金額PACF圖")

require(forecast)
loan_industry_ts_best <- auto.arima(x=loan_industry_ts)
Finacf_res <- acf(loan_industry_ts_best$residuals)
Finpacf_res <- pacf(loan_industry_ts_best$residuals)
plot(Finacf_res, main = "金融保險業貸款金額的最佳模型殘差ACF圖")
plot(Finpacf_res, main = "金融保險業貸款金額的最佳模型殘差PACF圖")

predict(loan_industry_ts_best, n.ahead = 5, se.fit = TRUE)
theForecast <- forecast(object = loan_industry_ts_best, h = 5)
plot(theForecast, 
       main = "金融保險業未來可能的貸款金額", 
       xlab = "年", 
       ylab = "貸款金額(仟元)"
     )