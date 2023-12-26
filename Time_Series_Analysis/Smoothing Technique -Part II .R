

# Load necessary libraries
library(forecast)

# Load the AirPassengers dataset
data("AirPassengers")

# Convert the data to a time series object
passengers_ts <- ts(AirPassengers, frequency = 12)

# ---------------------
# Simple Exponential Smoothing
# ---------------------
# SES is an additive model with constant level and no seasonality 
# The SES method provides a way of estimating 
# the level at the current time point

# Fit an SES model
air_ses <- ses( passengers_ts, h = 12)

print(summary(air_ses))

air_ses$model

# lessesr the AIC, or AICc or BIC, better is the model

air_ses$mean

air_ses$fitted

autoplot(air_ses)



# Plot the forecast
autoplot(ses_forecast)

#checkresiduals(air_ses)

######## Holt Winter 

AP.hw = HoltWinters(AirPassengers, seasonal = "mult")
plot(AP.hw)

hw_forecast <- forecast(AP.hw, h = 24)
print(hw_forecast)

# Plot the forecast
autoplot(hw_forecast)

