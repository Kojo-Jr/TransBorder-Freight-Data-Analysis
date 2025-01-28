
# load libraries
library(janitor)
library(dplyr)
library(ggplot2)
library(scales)
library(reshape2)

# load the data
data_2024 <- read.csv('./00_raw_data/2024.csv')
data_2023 <- read.csv('./00_raw_data/2023.csv')
data_2022 <- read.csv('./00_raw_data/2022.csv')
data_2021 <- read.csv('./00_raw_data/2021.csv')
data_2020 <- read.csv('./00_raw_data/2020.csv')


# Data cleaning
# remove the source column
data_2024 <- data_2024[ , -1]
data_2023 <- data_2023[ , -1]
data_2022 <- data_2022[ , -1]
data_2021 <- data_2021[ , -1]
data_2020 <- data_2020[ , -1]


# Clean the column names for each dataset
# data_2024 <- clean_names(data_2024)
# data_2023 <- clean_names(data_2023)
# data_2022 <- clean_names(data_2022)
# data_2021 <- clean_names(data_2021)
# data_2020 <- clean_names(data_2020)

# Check column names of each dataset
colnames(data_2020)
colnames(data_2021)
colnames(data_2022)
colnames(data_2023)
colnames(data_2024)


# Check for missing values
colSums(is.na(data_2020) | data_2020 == "")
colSums(is.na(data_2021) | data_2021 == "")
colSums(is.na(data_2022) | data_2022 == "")
colSums(is.na(data_2023) | data_2023 == "")
colSums(is.na(data_2024) | data_2024 == "")

# replace all empty cells with  NA
#data$MEXSTATE <- ifelse(is.na(data$MEXSTATE), "", data$MEXSTATE)
#data$DF <- ifelse(is.na(data$DF), "", data$DF)
data_2020$USASTATE[data_2020$USASTATE == ""] <- NA
data_2020$MEXSTATE[data_2020$MEXSTATE == ""] <- NA
data_2020$DEPE[data_2020$DEPE == ""] <- NA
data_2020$DF[data_2020$DF == ""] <- NA
data_2020$CANPROV[data_2020$CANPROV == ""] <- NA

data_2021$USASTATE[data_2021$USASTATE == ""] <- NA
data_2021$MEXSTATE[data_2021$MEXSTATE == ""] <- NA
data_2021$DEPE[data_2021$DEPE == ""] <- NA
data_2021$DF[data_2021$DF == ""] <- NA
data_2021$CANPROV[data_2021$CANPROV == ""] <- NA

data_2022$USASTATE[data_2022$USASTATE == ""] <- NA
data_2022$MEXSTATE[data_2022$MEXSTATE == ""] <- NA
data_2022$DEPE[data_2022$DEPE == ""] <- NA
data_2022$DF[data_2022$DF == ""] <- NA
data_2022$CANPROV[data_2022$CANPROV == ""] <- NA

data_2023$USASTATE[data_2023$USASTATE == ""] <- NA
data_2023$MEXSTATE[data_2023$MEXSTATE == ""] <- NA
data_2023$DEPE[data_2023$DEPE == ""] <- NA
data_2023$DF[data_2023$DF == ""] <- NA
data_2023$CANPROV[data_2023$CANPROV == ""] <- NA

data_2024$USASTATE[data_2024$USASTATE == ""] <- NA
data_2024$MEXSTATE[data_2024$MEXSTATE == ""] <- NA
data_2024$DEPE[data_2024$DEPE == ""] <- NA
data_2024$DF[data_2024$DF == ""] <- NA
data_2024$CANPROV[data_2024$CANPROV == ""] <- NA

# Check to see empty cells are replaced
rowSums(is.na(data_2021) | data_2020 == "") > 0
rowSums(is.na(data_2021) | data_2021 == "") > 0
rowSums(is.na(data_2021) | data_2022 == "") > 0
rowSums(is.na(data_2021) | data_2023 == "") > 0
rowSums(is.na(data_2021) | data_2024 == "") > 0

# rowSums(is.na(data_2021) | data_2021 == "") == ncol(data_2021)


# View structure of the data 
str(data_2020)
str(data_2021)
str(data_2022)
str(data_2023)
str(data_2024)

# convert disagmot, country, df, month, year to factors
data_2020[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data_2020[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

data_2021[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data_2021[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

data_2022[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data_2022[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

data_2023[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data_2023[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

data_2024[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data_2024[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

# View the structure
str(data_2020)
str(data_2021)
str(data_2022)
str(data_2023)
str(data_2024)

# combine the data using bindrows fronm dplyr
data <- bind_rows(data_2020, data_2021, data_2022, data_2023, data_2024)


# Data Analysis

# Summary statistics aggregated across the entire dataset
# To avoid scientific notation
options(scipen = 999)

# summary statistics from year 2020 to 2024
summary_statistics <- data %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = TRUE),
    Total_ShipWt = sum(SHIPWT, na.rm = TRUE),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = TRUE),
    Avg_Value = mean(VALUE, na.rm = TRUE),
    Avg_ShipWt = mean(SHIPWT, na.rm = TRUE),
    Avg_Freight_Charges = mean(FREIGHT_CHARGES, na.rm = TRUE)
  )

print("Summary statistics:")
print(summary_statistics)


# Grouping data by YEAR and calculating yearly statistics
yearly_statistics <- data %>%
  group_by(YEAR) %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = TRUE),
    Total_ShipWt = sum(SHIPWT, na.rm = TRUE),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = TRUE),
    Avg_Value = mean(VALUE, na.rm = TRUE),
    Avg_ShipWt = mean(SHIPWT, na.rm = TRUE),
    Avg_Freight_Charges = mean(FREIGHT_CHARGES, na.rm = TRUE)
  ) %>%
  # Round the numbers to 3 decimals
  mutate(
    Total_Value = round(Total_Value / 1e9, 3),  # Convert to billions and round
    Total_ShipWt = round(Total_ShipWt / 1e9, 3),  # Convert to billions and round
    Total_Freight_Charges = round(Total_Freight_Charges / 1e6, 3),  # Convert to millions and round
    Avg_Value = round(Avg_Value, 3),
    Avg_ShipWt = round(Avg_ShipWt, 3),
    Avg_Freight_Charges = round(Avg_Freight_Charges, 3)
  ) %>%
  # Add units for clarity
  mutate(
    Total_Value = paste(Total_Value, "B", sep = ""),
    Total_ShipWt = paste(Total_ShipWt, "B", sep = ""),
    Total_Freight_Charges = paste(Total_Freight_Charges, "M", sep = ""),
    Avg_Value = paste(Avg_Value, "M", sep = ""),
    Avg_ShipWt = paste(Avg_ShipWt, "M", sep = ""),
    Avg_Freight_Charges = paste(Avg_Freight_Charges, "M", sep = "")
  )

# Print yearly statistics
print(yearly_statistics)


# Visualize the data
# freight value by each year
# Function to process and visualize data for a specific year
analyse_yearly_data <- function(data, year) {
  # Filter data for the given year and aggregate by month
   monthly_summary <- data %>%
    filter(YEAR == as.character(year)) %>%
    group_by(MONTH) %>%
    summarise(Total_Value = sum(VALUE, na.rm = TRUE)) %>%
    mutate(
      Month_Label = factor(MONTH, levels = 1:12, labels = month.name)
    ) %>%
    arrange(MONTH)
  # Print summary
  print(monthly_summary)
  
  # Plot the data with line connecting dots and formatted Y-axis
  ggplot(monthly_summary, aes(x = Month_Label, y = Total_Value)) +
    geom_line(color = "blue", linewidth = 1.2) +  # Line connecting the dots
    geom_point(color = "darkred", size = 3) +  # Red dots
    scale_y_continuous(labels = scales::label_number(scale = 1e-6, suffix = "M", accuracy = 0.01)) +  # Round Y-axis to millions
    labs(
      title = paste("Monthly Freight Value in", year),
      x = "Month",
      y = "Total Freight Value (USD)"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# Run the analysis for each year
years <- c(2020, 2021, 2022, 2023, 2024)
for (year in years) {
  print(paste("Processing data for year:", year))
  print(analyse_yearly_data(data, year))
}



# distribution of data
# distribution freight weight
# ggplot(data, aes(x = SHIPWT / 1e3)) +
#  geom_histogram(binwidth = 50, fill = "blue", color = "white") +
#   labs(
#    title = "Distribution of Freight Weight",
#    x = "Weight (in thousands)",
#    y = "Frequency"
#  ) +
#  theme_minimal()



# Analyze data based on transportation mode (DISAGMOT).
# Freight Value by Mode Across Years
# mapp the transportation mode codes to their descriptions
mode_description <- c(
  "1" = "Vessel",
  "3" = "Air",
  "4" = "Mail (U.S. Postal Service)",
  "5" = "Truck",
  "6" = "Rail",
  "7" = "Pipeline",
  "8" = "Other",
  "9" = "Foreign Trade Zones (FTZs)"
)

# Plotting the Freight Value by Mode Across Years
transportation_mode <- ggplot(data, aes(x = YEAR, y = VALUE / 1e6, fill = factor(DISAGMOT))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Freight Value by Transportation Mode and Year",
    x = "Year",
    y = "Value (in millions)"
  ) +
  theme_minimal() +
  scale_fill_manual(
    values = RColorBrewer::brewer.pal(8, "Set2"),  # Choosing a color palette with enough colors
    labels = mode_description,                    # Custom labels for transportation modes
    name = "Transportation Mode"
  )

print(transportation_mode)



# Ship weight by US States
# Loop through each year to create summaries and plots
for (year in years) {
  # Filter data for the current year
  yearly_data <- data %>% filter(YEAR == as.character(year))
  
  # Summarize the total freight weight (SHIPWT) by state
  state_freight_summary <- yearly_data %>%
    group_by(USASTATE) %>%
    summarise(Total_ShipWt = sum(SHIPWT, na.rm = TRUE)) %>%
    arrange(desc(Total_ShipWt))  # Sort by total freight weight
  
  # Limit to top 10 states for better readability
  state_freight_summary <- head(state_freight_summary, 10) %>% 
    filter(!is.na(USASTATE) & USASTATE != "")
    
  
  # Create a bar plot of the freight weight by US state for the current year
  plot <- ggplot(state_freight_summary, aes(x = reorder(USASTATE, Total_ShipWt), y = Total_ShipWt / 1e3)) +
    geom_col(fill = "steelblue") +   # Bar color
    coord_flip() +                   # Flip the bars horizontally
    labs(
      title = paste("Total Ship Weight by US State (", year, ")", sep = ""),
      x = "State",
      y = "Weight (in thousands of kilograms)"
    ) +
    theme_minimal() +                # Simple clean theme
    theme(
      axis.text.x = element_text(size = 10),  # Adjust text size for better legibility
      axis.text.y = element_text(size = 10),  # Adjust y-axis text size
      plot.margin = margin(10, 50, 10, 10)    # Increase the space around the plot to avoid cutting off labels
    )
  
  # Print the plot for the current year
  print(plot)
}




# Freight Charges vs Shipment charges
# Mapping of transportation mode codes to descriptions
mode_description <- c(
  "1" = "Vessel",
  "3" = "Air",
  "4" = "Mail (U.S. Postal Service)",
  "5" = "Truck",
  "6" = "Rail",
  "7" = "Pipeline",
  "8" = "Other",
  "9" = "Foreign Trade Zones (FTZs)"
)

# Loop through each year to create bar plots of aggregated data
for (year in years) {
  # Filter the data for the current year
  yearly_data <- data %>% filter(YEAR == as.character(year))
  
  # Aggregate data by DISAGMOT (Transportation Mode)
  aggregated_data <- yearly_data %>%
    group_by(DISAGMOT) %>%
    summarise(
      Total_ShipWt = sum(SHIPWT, na.rm = TRUE),
      Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = TRUE)
    ) %>%
    mutate(
      Mode = factor(DISAGMOT, levels = names(mode_description), labels = mode_description)  # Map codes to descriptions
    )
  
  # Create a bar plot comparing Freight Charges and Shipment Weight for the current year
  plot <- ggplot(aggregated_data, aes(x = Mode)) +
    geom_bar(aes(y = Total_ShipWt / 1e3, fill = "Shipment Weight"), stat = "identity", position = "dodge") +
    geom_bar(aes(y = Total_Freight_Charges / 1e3, fill = "Freight Charges"), stat = "identity", position = "dodge") +
    labs(
      title = paste("Freight Charges vs Shipment Weight by Transportation Mode (", year, ")", sep = ""),
      x = "Transportation Mode",
      y = "Amount (in USD)"
    ) +
    scale_fill_manual(values = c("Shipment Weight" = "steelblue", "Freight Charges" = "darkorange")) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability
  
  # Print the plot for the current year
  print(plot)
}




# Freight Value by Country
# List of years to process
years <- c(2020, 2021, 2022, 2023, 2024)

# Create a mapping of country codes to country names
country_names <- c(
  "1220" = "Canada",
  "2010" = "Mexico"
)

# Loop through each year to create summaries and plots
for (year in years) {
  # Filter the data for the current year
  yearly_data <- data %>% filter(YEAR == as.character(year))
  
  # Summarize the total Freight Value (VALUE) by Country
  country_summary <- yearly_data %>%
    group_by(COUNTRY) %>%
    summarise(Total_Value = sum(VALUE, na.rm = TRUE)) %>%
    mutate(Country_Name = country_names[as.character(COUNTRY)])  # Map codes to names
  
  # Create a bar plot of Freight Value by Country for the current year
  plot <- ggplot(country_summary, aes(x = reorder(Country_Name, Total_Value), y = Total_Value / 1e6)) +
    geom_bar(stat = "identity", fill = "darkgreen") +   # Create the bars
    coord_flip() +                                      # Flip the bars horizontally
    labs(
      title = paste("Total Freight Value by Country (", year, ")", sep = ""),
      x = "Country",
      y = "Value (in millions)"
    ) +
    theme_minimal()                                     # Clean theme
  
  # Print the plot for the current year
  print(plot)
}




# correlation and statistical analysis

# Correlation Between Value, Weight, and Freight Charges
# List of years to process
years <- c(2020, 2021, 2022, 2023, 2024)
# Loop through each year to calculate and print the correlation matrix
for (year in years) {
  # Filter the data for the current year
  yearly_data <- data %>% filter(YEAR == as.character(year))
  
  # Calculate the correlation matrix for VALUE, SHIPWT, and FREIGHT_CHARGES
  correlation_matrix <- yearly_data %>%
    select(VALUE, SHIPWT, FREIGHT_CHARGES) %>%
    cor(use = "complete.obs")
  
  # Print the correlation matrix for the current year
  print(paste("Correlation Matrix for Year:", year))
  print(correlation_matrix)
}


# Visualise the correlation
# List of years
years <- c(2020, 2021, 2022, 2023, 2024)

# Initialise an empty data frame for storing correlation data
correlation_data <- data.frame()

# Loop through each year to calculate correlations
for (year in years) {
  yearly_data <- data %>% filter(YEAR == as.character(year))
  corr_matrix <- yearly_data %>%
    select(VALUE, SHIPWT, FREIGHT_CHARGES) %>%
    cor(use = "complete.obs")
  
  # Convert the correlation matrix to a long format
  melted_corr <- melt(corr_matrix)
  melted_corr$Year <- year
  
  # Append to the correlation_data data frame
  correlation_data <- rbind(correlation_data, melted_corr)
}

# Round the correlation values to 2 decimal places
correlation_data$value <- round(correlation_data$value, 2)

# Plot heatmap with labels
ggplot(correlation_data, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), colour = "black", size = 3) +  # to add text labels
  facet_wrap(~ Year) +
  scale_fill_gradient2(
    low = "blue", mid = "white", high = "red",
    midpoint = 0, limits = c(-1, 1),
    name = "Correlation"
  ) +
  labs(
    title = "Correlation Heatmaps (2020–2024) with Values",
    x = "Variable", y = "Variable"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(size = 12),  #facet title size
    axis.text.x = element_text(angle = 45, hjust = 1)  # to Rotate x-axis labels
  )



# High Freight Charges
# Identify shipments with unusually high freight charges for their weight.
# List of years to process
# years <- c(2020, 2021, 2022, 2023, 2024)

# Loop through each year to identify high freight charges for each year
# for (year in years) {
  # Filter the data for the current year
#  yearly_data <- data %>% filter(YEAR == as.character(year))
  
  # Identify shipments with unusually high freight charges for their weight in the current year
#  high_charges <- yearly_data %>%
 #   filter(FREIGHT_CHARGES / SHIPWT > quantile(FREIGHT_CHARGES / SHIPWT, 0.95, na.rm = TRUE))
  
  # Print the result for the current year
 # print(paste("High Freight Charges for Year:", year))
#  print(high_charges)
#}


# Yearly trend Analysis
# Freight Value by Year
yearly_trends <- data %>%
  group_by(YEAR) %>%
  summarise(Total_Value = sum(VALUE, na.rm = TRUE))

ggplot(yearly_trends, aes(x = as.factor(YEAR), y = Total_Value / 1e6)) +
  geom_line(group = 1, color = "blue") +
  labs(
    title = "Yearly Freight Value Trends",
    x = "Year",
    y = "Value (in millions)"
  ) +
  theme_minimal()




# Trade Values for MEXSTATE AND CANPROV And USASTATE(USA)
# Prepare data for MEXSTATE (Mexico) and CANPROV (Canada) and US STATE (USA)
mexico_trade <- data %>%
  filter(!is.na(MEXSTATE) & MEXSTATE != "") %>%  # Select rows with MEXSTATE (Mexico trade)
  group_by(TRDTYPE, MEXSTATE) %>%
  summarise(Total_Value = sum(VALUE, na.rm = TRUE)) %>%
  mutate(Country = "Mexico")

canada_trade <- data %>%
  filter(!is.na(CANPROV) & CANPROV != "") %>%  # Select rows with CANPROV (Canada trade)
  group_by(TRDTYPE, CANPROV) %>%
  summarise(Total_Value = sum(VALUE, na.rm = TRUE)) %>%
  mutate(Country = "Canada")

us_trade <- data %>% 
  filter(!is.na(USASTATE) & USASTATE != "") %>% 
  group_by(TRDTYPE, USASTATE) %>% 
  summarise(Total_Value = sum(VALUE, na.rm = TRUE)) %>% 
  mutate(Country = "USA")

# Combine both datasets
# trade_data <- bind_rows(
#  mexico_trade %>% rename(Region = MEXSTATE),
#  canada_trade %>% rename(Region = CANPROV)
#)

# Visualise the trade values
# ggplot(trade_data, aes(x = Region, y = Total_Value, fill = factor(TRDTYPE, labels = c("Export", "Import")))) +
#  geom_bar(stat = "identity", position = "dodge") +
#  facet_wrap(~ Country, scales = "free") +
#  labs(
#    title = "Trade Values for Mexico (MEXSTATE) and Canada (CANPROV) Over The Past Four Years",
#    x = "Region (State/Province)",
#    y = "Total Trade Value (in dollars)",
#   fill = "Trade Type"
#  ) +
# theme_minimal() +
#  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Visualise trade values of import and export amongst CANPROV
ggplot(canada_trade, aes(x=CANPROV, y =Total_Value, fill = factor(TRDTYPE, labels = c("Export", "Import")))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Trade Values for Canada (CANPROV) Over The Past Four Years",
    x = "CANPROV",
    y = "Total Trade Value (in dollars)",
    fill = "Trade Type"
  ) + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle= 45, hjust = 1))

# Visual the trade values of import and export amongst USASTATES
ggplot(us_trade, aes(x=USASTATE, y = Total_Value, fill = factor(TRDTYPE, labels = c("Export", "Import")))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs (
    title = "Trade Values for US States Over The Past Four Years",
    x = "USASTATE",
    y = "Total Trade Value (dollars)",
    fill = "Trade Type"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45, hjust = 1))


