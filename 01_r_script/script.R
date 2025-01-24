
# load libraries
library(janitor)
library(dplyr)

# load the data
data_2024 <- read.csv('./00_raw_data/2024.csv')
data_2023 <- read.csv('./00_raw_data/2023.csv')
data_2022 <- read.csv('./00_raw_data/2021.csv')
data_2021 <- read.csv('./00_raw_data/2021.csv')
data_2020 <- read.csv('./00_raw_data/2020.csv')


# Data cleaning
data_2024 <- data_2024[ , -1]
data_2023 <- data_2023[ , -1]
data_2022 <- data_2022[ , -1]
data_2021 <- data_2021[ , -1]
data_2020 <- data_2020[ , -1]

# Check column names of each dataset
colnames(data_2020)
colnames(data_2021)
colnames(data_2022)
colnames(data_2023)
colnames(data_2024)

# Clean the column names for each dataset
# data_2024 <- clean_names(data_2024)
# data_2023 <- clean_names(data_2023)
# data_2022 <- clean_names(data_2022)
# data_2021 <- clean_names(data_2021)
# data_2020 <- clean_names(data_2020)

# combine the data using bindrows fronm dplyr
data <- bind_rows(data_2020, data_2021, data_2022, data_2023, data_2024)

# Check for missing values
colSums(is.na(data))

# replace all empty cells with  NA
#data$MEXSTATE <- ifelse(is.na(data$MEXSTATE), "", data$MEXSTATE)
#data$DF <- ifelse(is.na(data$DF), "", data$DF)
data$MEXSTATE[data$MEXSTATE == ""] <- NA
data$DF[data$DF == ""] <- NA
data$CANPROV[data$CANPROV == ""] <- NA

# structure of the data 
str(data)

# convert disagmot, country, df, month, year to factors
data[c('DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data[c('DISAGMOT','COUNTRY', 'DF', 'MONTH', 'YEAR')], as.factor)

# View the structure
str(data)


# Data Analysis
# Summary statistics
# To avoid scientific notation
options(scipen = 999)

summary_statistics <- data %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = TRUE),
    Total_ShipWt = sum(SHIPWT, na.rm = TRUE),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = TRUE),
    Avg_Value = mean(VALUE, na.rm = TRUE),
    Avg_ShipWt = mean(SHIPWT, na.rm = TRUE),
    Avg_Freight_Charges = mean(FREIGHT_CHARGES, na.rm = TRUE)
  )

print(summary_statistics)

# Visualize the data
library(ggplot2)
library(scales)

# data by value by year
ggplot(data, aes(x = YEAR, y = VALUE / 1e6, fill = YEAR)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = number(VALUE / 1e6, scale = 1, accuracy = 0.01)), vjust = -0.5) + 
  labs(
    title = "Total Freight Value by Year",
    x = "Year",
    y = "Value (in millions)"
  ) +
  scale_y_continuous(labels = label_number(accuracy = 0.01)) +
  theme_minimal()


# distribution of data
ggplot(data, aes(x = SHIPWT / 1e3)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "white") +
  labs(
    title = "Distribution of Freight Weight",
    x = "Weight (in thousands)",
    y = "Frequency"
  ) +
  theme_minimal()

# distribution freight weight
ggplot(data, aes(x = SHIPWT / 1e3)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "white") +
  labs(
    title = "Distribution of Freight Weight",
    x = "Weight (in thousands)",
    y = "Frequency"
  ) +
  theme_minimal()

# Analyze data based on transportation mode (DISAGMOT).
transport_mode_summary <- data %>%
  group_by(DISAGMOT) %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = TRUE),
    Total_ShipWt = sum(SHIPWT, na.rm = TRUE),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = TRUE)
  ) %>%
  arrange(desc(Total_Value))

print(transport_mode_summary)

# Freight Value by Mode Across Years
ggplot(data, aes(x = YEAR, y = VALUE / 1e6, fill = DISAGMOT)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Freight Value by Transportation Mode and Year",
    x = "Year",
    y = "Value (in millions)"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

# Freight weight by US States
state_freight_summary <- data %>%
  group_by(USASTATE) %>%
  summarise(Total_ShipWt = sum(SHIPWT, na.rm = TRUE)) %>%
  arrange(desc(Total_ShipWt))

ggplot(state_freight_summary, aes(x = reorder(USASTATE, Total_ShipWt), y = Total_ShipWt / 1e3)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Total Freight Weight by US State",
    x = "State",
    y = "Weight (in thousands)"
  ) +
  theme_minimal()


# Freight Charges vs Shipment charges
ggplot(data, aes(x = SHIPWT, y = FREIGHT_CHARGES, color = DISAGMOT)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  labs(
    title = "Freight Charges vs Shipment Weight",
    x = "Shipment Weight (log scale)",
    y = "Freight Charges (log scale)"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Dark2")


# Freight Value by Country
country_summary <- data %>%
  group_by(COUNTRY) %>%
  summarise(Total_Value = sum(VALUE, na.rm = TRUE))

ggplot(country_summary, aes(x = reorder(COUNTRY, Total_Value), y = Total_Value / 1e6)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Total Freight Value by Country",
    x = "Country",
    y = "Value (in millions)"
  ) +
  theme_minimal()


# correlation and statistical analysis

# Correlation Between Value, Weight, and Freight Charges
correlation_matrix <- data %>%
  select(VALUE, SHIPWT, FREIGHT_CHARGES) %>%
  cor(use = "complete.obs")

print(correlation_matrix)

# High Freight Charges
# Identify shipments with unusually high freight charges for their weight.
high_charges <- data %>%
  filter(FREIGHT_CHARGES / SHIPWT > quantile(FREIGHT_CHARGES / SHIPWT, 0.95, na.rm = TRUE))

print(high_charges)

# Monthly trend analysis
# Freight Value by Month

monthly_trends <- data %>%
  group_by(MONTH) %>%
  summarise(Total_Value = sum(VALUE, na.rm = TRUE))

ggplot(monthly_trends, aes(x = as.factor(MONTH), y = Total_Value / 1e6)) +
  geom_line(group = 1, color = "blue") +
  labs(
    title = "Monthly Freight Value Trends",
    x = "Month",
    y = "Value (in millions)"
  ) +
  theme_minimal()

# Yearly trend Analysis
# Freight Value by Month
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


