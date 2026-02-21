# Install required package
install.packages("rsconnect")

# Load the rsconnect package
library(rsconnect)

# Set up Shinyapps.io account
# Replace with your actual Shinyapps.io credentials
rsconnect::setAccountInfo(name='your_username', 
                          token='your_token', 
                          secret='your_secret')

# Set working directory to your app location
setwd("path/to/financial_health_app")

# Deploy the app to Shinyapps.io
rsconnect::deployApp()

# Output message to confirm deployment success
cat("Deployment complete! Visit your app at: https://your-username.shinyapps.io/financial_health_app/")