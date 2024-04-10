install.packages("RSQLite")

#Load necessary libraries
library(RSQLite)
library(ggplot2)
library(tidyr)
library(dplyr) 

# Adjusted path for the database
con <- dbConnect(RSQLite::SQLite(), "/Users/mellogwayo/Desktop/Household Financial Health Analytics Platform/database/variables for analysis.db")

# Assuming 'data' is the correct table name within your SQLite database
df <- dbReadTable(con, "data")

# Close the connection
dbDisconnect(con)

# Original variables CSV file path updated
write.csv(df, "/Users/mellogwayo/Desktop/Household Financial Health Analytics Platform/data/processed/variables.csv", row.names = FALSE)

# Path updated for loading the data from the CSV file into a DataFrame
data <- read.csv("/Users/mellogwayo/Desktop/Household Financial Health Analytics Platform/data/processed/transformed_variables.csv")

# View the first few rows of the data to confirm it's loaded correctly
head(data)

# Visuals made for initial exploration
## Categorical variable plot
ggplot(data, aes(x = jkl_country)) + 
  geom_bar() + 
  labs(title = "Distribution of Sample Members by Country", x = "Country", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## Create the bar chart for members by region
ggplot(data, aes(x = jkl_gor_dv)) +
  geom_bar() +
  labs(
    title = "Distribution of Members by Region",
    x = "Region",
    y = "Count"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## Bar chart for employment status
ggplot(data, aes(x = "", fill = jkl_jbstat)) + 
  geom_bar(width = 1) + 
  coord_polar(theta = "y") + 
  labs(title = "Employment Status Distribution", x = NULL, y = NULL, fill = "Employment Status") +
  theme_void() +
  theme(legend.title = element_text(size = 12), legend.text = element_text(size = 10))

## Housing tenure - Bar plot
ggplot(data, aes(x = jkl_tenure_dv)) + 
  geom_bar(fill = "steelblue") + 
  labs(title = "Housing Tenure of Respondents", x = "Housing Tenure", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## Reshape and plotting income distributions as before
long_data <- data %>%
  pivot_longer(cols = c(jkl_fihhmnnet1_dv, jkl_fimnnet_dv), names_to = "variable", values_to = "value")

variable_labels <- c(
  jkl_fihhmnnet1_dv = "Net Household Monthly Income",
  jkl_fimnnet_dv = "Own Total Estimated Net Monthly Income"
)

ggplot(long_data, aes(x = value)) + 
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  facet_wrap(~ variable, scales = "free", labeller = labeller(variable = variable_labels)) +
  labs(title = "Income Distributions", x = "Net Income", y = "Frequency") +
  theme_minimal()

# Data Exploration and Feature Engineering

##NUMERICAL VARIABLES 
### A vector of numeric variable names from your list
numeric_variables <- c("jkl_fimnnet_dv", "jkl_fihhmnnet1_dv")

### Initialize an empty list to store summary statistics
summary_statistics_list <- list()

### Loop over each numeric variable to calculate summary statistics and histograms

for (var in numeric_variables) {
  # Calculate summary statistics for the current variable
  summary_statistics <- data %>%
    summarise(
      Mean = mean(.data[[var]], na.rm = TRUE),
      Median = median(.data[[var]], na.rm = TRUE),
      StdDev = sd(.data[[var]], na.rm = TRUE),
      Min = min(.data[[var]], na.rm = TRUE),
      Max = max(.data[[var]], na.rm = TRUE)
    )
  
  # Print summary statistics
  print(paste("Summary statistics for", var))
  print(summary_statistics)
  
  # Add summary statistics to the list
  summary_statistics_list[[var]] <- summary_statistics
  
  # Create histogram for the current variable using tidy evaluation
  hist_plot <- ggplot(data, aes(x = !!sym(var))) +
    geom_histogram(binwidth = 100, fill = 'blue') +
    labs(title = paste('Histogram of', var), x = var, y = 'Count')
  
  # Print histogram
  print(hist_plot)
}


### Calculating correlation
correlation_matrix <- data %>%
  select(all_of(numeric_variables)) %>% 
  cor(use = "complete.obs")

print(correlation_matrix)

## CATEGORICAL VARIABLES 
# Defining the categorical variables
categorical_variables <- c("jkl_country", "jkl_gor_dv", "jkl_urban_dv", "jkl_sex_dv",
                           "jkl_mastat_dv", "jkl_jbstat", "jkl_ethn_dv", "bornuk_dv",
                           "jkl_jbsoc00_cc", "jkl_jbnssec8_dv", "jkl_jbnssec5_dv",
                           "jkl_jbnssec3_dv", "jkl_health", "jkl_nkids_dv", "jkl_hhtype_dv",
                           "jkl_tenure_dv")

# NOTE TO MEL: Remember that you need to review each chart and frequency table to ensure they make sense

# Convert each categorical variable to a factor first
data_factors <- data %>%
  mutate(across(all_of(categorical_variables), factor))

# Generate frequency tables and bar charts after conversion
for(var in categorical_variables) {
  cat("\nFrequency table for", var, ":\n")
  frequency_counts <- table(data_factors[[var]])
  print(frequency_counts)
  
  proportions <- prop.table(frequency_counts)
  cat("\nProportions for", var, ":\n")
  print(proportions)
  
  bar_plot <- ggplot(data_factors, aes(x = !!sym(var))) +
    geom_bar() +
    labs(title = paste("Distribution of", var), x = var, y = "Count") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  print(bar_plot)
}

### For a quick overview of multiple categorical variables, you can use summary()
cat_vars_summary <- summary(data_factors)
print(cat_vars_summary)

# Note to Mel: Need to adjust this to fit domain knowledge and data set relevance 

# Step 1: Identify a key variable of interest, e.g., employment status
key_variable <- "jkl_jbstat" 

# Step 2: Select a set of variables to pair with the key variable based on the criteria above
variables_to_pair <- c("jkl_country", "jkl_urban_dv", "jkl_sex_dv", "jkl_ethn_dv")

# Step 3: Create visualizations for each pair
for (var in variables_to_pair) {
  # Generate the count table for the current pair
  count_table <- table(data_factors[[key_variable]], data_factors[[var]])
  
  # Convert the count table to a proportion table, normalized by the key variable
  prop_table <- prop.table(count_table, 1)  # Normalization across rows
  prop_df <- as.data.frame(prop_table)
  
  # Adjust column names for clarity
  names(prop_df) <- c("KeyVariable", "PairedVariable", "Proportion")
  
  # Use 'ggplot2' to create a normalized stacked bar chart
  ggplot(prop_df, aes(x = KeyVariable, y = Proportion, fill = PairedVariable)) +
    geom_bar(stat = "identity", position = "fill") +
    labs(title = paste("Proportion of", var, "within", key_variable),
         x = key_variable, y = "Proportion") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

