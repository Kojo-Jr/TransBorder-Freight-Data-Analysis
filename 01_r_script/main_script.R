
# load libraries 
library(janitor)
library(dplyr)
library(ggplot2)
library(scales)
library(reshape2)

# data cleaning

# 2020
# merge the ytd csv files located in the last month of 2020 folder
# the ytd csv consist of data from the month jan to september
spt20dty_1 <- read.csv("00_raw_data/year_2020/September2020/dot1_ytd_0920.csv")
spt20dty_2 <- read.csv("00_raw_data/year_2020/September2020/dot2_ytd_0920.csv")
spt20dty_3 <- read.csv("00_raw_data/year_2020/September2020/dot3_ytd_0920.csv")

# check missing columns
colnames(spt20dty_1)
colnames(spt20dty_2)
colnames(spt20dty_3)

# add missing columns
spt20dty_1 <- spt20dty_1 %>% 
  mutate(COMMODITY2 = NA)

spt20dty_2 <- spt20dty_2 %>% 
  mutate(DEPE = NA)

spt20dty_3 <- spt20dty_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind the data frame rows to form data_2020
data_2020 <- bind_rows(spt20dty_1, spt20dty_2, spt20dty_3)

# check for duplicates
data_2020 <- data_2020 %>% distinct()




# 2021
# load, merge the ytd csv files located in the last month of 2021 folder
# the ytd csv consist of data from the month jan to december

ytd21_1 <- read.csv("00_raw_data/year_2021/December2021/dot1_ytd_1221.csv")
ytd21_2 <- read.csv("00_raw_data/year_2021/December2021/dot2_ytd_1221.csv")
ytd21_3 <- read.csv("00_raw_data/year_2021/December2021/dot3_ytd_1221.csv")


# check for columns
colnames(ytd21_1)
colnames(ytd21_2)
colnames(ytd21_3)


# add missing columns
ytd21_1 <- ytd21_1 %>% 
  mutate(COMMODITY2 = NA)

ytd21_2 <- ytd21_2 %>% 
  mutate(DEPE = NA)

ytd21_3 <- ytd21_3 %>%
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
data_2021 <- bind_rows(ytd21_1, ytd21_2, ytd21_3)


# 2022
# load, merge the ytd csv files located in the last month of 2022 folder
# the ytd csv consist of data from the month jan to december
ytd22_1 <- read.csv("00_raw_data/year_2022/December2022/dot1_ytd_1222.csv")
ytd22_2 <- read.csv("00_raw_data/year_2022/December2022/dot2_ytd_1222.csv")
ytd22_3 <- read.csv("00_raw_data/year_2022/December2022/dot3_ytd_1222.csv")


# check for column names
colnames(ytd22_1)
colnames(ytd22_2)
colnames(ytd22_3)


# add missing columns
ytd22_1 <- ytd22_1 %>% 
  mutate(COMMODITY2 = NA)

ytd22_2 <- ytd22_2 %>% 
  mutate(DEPE = NA)

ytd22_3 <- ytd22_3 %>%
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
data_2022 <- bind_rows(ytd22_1, ytd22_2, ytd22_3)




# 2023
# merge data in each month for September, October, November, December 2023
# since the data for these months has no ytd csv files
# loading september data
septdata23_1 <- read.csv("./00_raw_data/year_2023/sept2023/dot1_0923.csv")
septdata23_2 <- read.csv("./00_raw_data/year_2023/sept2023/dot2_0923.csv")
septdata23_3 <- read.csv("./00_raw_data/year_2023/sept2023/dot3_0923.csv")

# check column names
colnames(septdata23_1)
colnames(septdata23_2)
colnames(septdata23_3)

# Add missing columns to each data frame
septdata23_1 <- septdata23_1 %>% 
  mutate(COMMODITY2 = NA, DEPE = DEPE, USASTATE = USASTATE)

septdata23_2 <- septdata23_2 %>%  
  mutate(DEPE = NA)

septdata23_3 <- septdata23_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# Bind data rows together
september_2023 <- bind_rows(septdata23_1, septdata23_2, septdata23_3)


# loading data for october
octdata23_1 <- read.csv("./00_raw_data/year_2023/Oct2023/dot1_1023.csv")
octdata23_2 <- read.csv("./00_raw_data/year_2023/Oct2023/dot2_1023.csv")
octdata23_3 <- read.csv("./00_raw_data/year_2023/Oct2023/dot3_1023.csv")

# check column names
colnames(octdata23_1)
colnames(octdata23_2)
colnames(octdata23_3)


# Add missing columns to each data frame
octdata23_1 <- octdata23_1 %>% 
  mutate(COMMODITY2 = NA)

octdata23_2 <- octdata23_2 %>%  
  mutate(DEPE = NA)

octdata23_3 <- octdata23_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind data rows together
october_2023 <- bind_rows(octdata23_1, octdata23_2, octdata23_3)


# loading data for november
novdata23_1 <- read.csv("./00_raw_data/year_2023/Nov2023/dot1_1123.csv")
novdata23_2 <- read.csv("./00_raw_data/year_2023/Nov2023/dot2_1123.csv")
novdata23_3 <- read.csv("./00_raw_data/year_2023/Nov2023/dot3_1123.csv")

# check colnames
colnames(novdata23_1)
colnames(novdata23_2)
colnames(novdata23_3)

# Add missing columns to each data frame
novdata23_1 <- novdata23_1 %>% 
  mutate(COMMODITY2 = NA)

novdata23_2 <- novdata23_2 %>%  
  mutate(DEPE = NA)

novdata23_3 <- novdata23_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind data frames for november
november_2023 <- bind_rows(novdata23_1, novdata23_2, novdata23_3)


# loading data for december
decdata23_1 <- read.csv("./00_raw_data/year_2023/December2023/dot1_1223.csv")
decdata23_2 <- read.csv("./00_raw_data/year_2023/December2023/dot2_1223.csv")
decdata23_3 <- read.csv("./00_raw_data/year_2023/December2023/dot3_1223.csv")

# check colnames
colnames(decdata23_1)
colnames(decdata23_2)
colnames(decdata23_3)


# Add missing columns to each data frame
decdata23_1 <- decdata23_1 %>% 
  mutate(COMMODITY2 = NA)

decdata23_2 <- decdata23_2 %>%  
  mutate(DEPE = NA)

decdata23_3 <- decdata23_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind data rows for december
december_2023 <- bind_rows(decdata23_1, decdata23_2, decdata23_3)



# merge september to december data set
sept_to_dec_23 <- bind_rows(september_2023, october_2023, november_2023, 
                            december_2023)

# check colnames of date to year from jan to august 2023
jan_to_aug_23_1 <- read.csv("./00_raw_data/year_2023/Aug2023/dot1_ytd_0823.csv")
jan_to_aug_23_2 <- read.csv("00_raw_data/year_2023/Aug2023/dot2_ytd_0823.csv")
jan_to_aug_23_3 <- read.csv("./00_raw_data/year_2023/Aug2023/dot3_ytd_0823.csv")


# check colnames 
colnames(jan_to_aug_23_1)
colnames(jan_to_aug_23_2)
colnames(jan_to_aug_23_3)

# Add missing columns
jan_to_aug_23_1 <- jan_to_aug_23_1 %>% 
  mutate(COMMODITY2 = NA)

jan_to_aug_23_2 <- jan_to_aug_23_2 %>% 
  mutate(DEPE = NA)

jan_to_aug_23_3 <- jan_to_aug_23_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows to form a dataframe
jan_to_aug_23 <- bind_rows(jan_to_aug_23_1, jan_to_aug_23_2, jan_to_aug_23_3)

# bind the two data rows
data_2023 <- bind_rows(jan_to_aug_23, sept_to_dec_23)




# for 2024
# Merging data sets in each month of year 2024
# The data sets in this year's monthly folders has no year to date csv

# For January
jandata24_1 <- read.csv("./00_raw_data/year_2024/Jan2024/dot1_0124.csv")
jandata24_2 <- read.csv("./00_raw_data/year_2024/Jan2024/dot2_0124.csv")
jandata24_3 <- read.csv("./00_raw_data/year_2024/Jan2024/dot3_0124.csv")

# check colnames
colnames(jandata24_1)
colnames(jandata24_2)
colnames(jandata24_3)

# Add missing columns to data set
jandata24_1 <- jandata24_1 %>% 
mutate(COMMODITY2 = NA )

jandata24_2 <- jandata24_2 %>% 
  mutate(DEPE = NA)

jandata24_3 <- jandata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind data rows
january_2024 <- bind_rows(jandata24_1, jandata24_2, jandata24_3)



# For February
febdata24_1 <- read.csv("./00_raw_data/year_2024/Feb2024/dot1_0224.csv")
febdata24_2 <- read.csv("./00_raw_data/year_2024/Feb2024/dot2_0224.csv")
febdata24_3 <- read.csv("./00_raw_data/year_2024/Feb2024/dot3_0224.csv")

# Check colnames 
colnames(febdata24_1)
colnames(febdata24_2)
colnames(febdata24_3)

# Add missing columns to data set
febdata24_1 <- febdata24_1 %>% 
  mutate(COMMODITY2 = NA )

febdata24_2 <- febdata24_2 %>% 
  mutate(DEPE = NA)

febdata24_3 <- febdata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind data rows
february_2024 <- bind_rows(febdata24_1, febdata24_2, febdata24_3)


# for March
mardata24_1 <- read.csv("./00_raw_data/year_2024/March2024/dot1_0324.csv")
mardata24_2 <- read.csv("./00_raw_data/year_2024/March2024/dot2_0324.csv")

# check column names
colnames(mardata24_1)
colnames(mardata24_2)

# Add missing columns
mardata24_1 <- mardata24_1 %>% 
  mutate(COMMODITY2 = NA )

mardata24_2 <- mardata24_2 %>% 
  mutate(DEPE = NA)

# bind rows
march_2024 <- bind_rows(mardata24_1, mardata24_2)


# for April
aprdata24_1 <- read.csv("./00_raw_data/year_2024/April2024/dot1_0424.csv")
aprdata24_2 <- read.csv("./00_raw_data/year_2024/April2024/dot2_0424.csv")
aprdata24_3 <- read.csv("./00_raw_data/year_2024/April2024/dot3_0424.csv")

# check colnames
colnames(aprdata24_1)
colnames(aprdata24_2)
colnames(aprdata24_3)

# add missing columns
aprdata24_1 <- aprdata24_1 %>% 
  mutate(COMMODITY2 = NA)

aprdata24_2 <- aprdata24_2 %>% 
  mutate(DEPE = NA)

aprdata24_3 <- aprdata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows 
april_2024 <- bind_rows(aprdata24_1, aprdata24_2, aprdata24_3)


# for may 2024
maydata24_1 <- read.csv("./00_raw_data/year_2024/May2024/dot1_0524.csv")
maydata24_2 <- read.csv("./00_raw_data/year_2024/May2024/dot2_0524.csv")
maydata24_3 <- read.csv("./00_raw_data/year_2024/May2024/dot3_0524.csv")

# check for column names
colnames(maydata24_1)
colnames(maydata24_2)
colnames(maydata24_3)

# add missing columns
maydata24_1 <- maydata24_1 %>% 
  mutate(COMMODITY2 = NA)

maydata24_2 <- maydata24_2 %>% 
  mutate(DEPE = NA)

maydata24_3 <- maydata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind the data frames
may_2024 <- bind_rows(maydata24_1, maydata24_2, maydata24_3)


# for June 2024
junedata24_1 <- read.csv("./00_raw_data/year_2024/June2024/dot1_0624.csv")
junedata24_2 <- read.csv("./00_raw_data/year_2024/June2024/dot2_0624.csv")
junedata24_3 <- read.csv("./00_raw_data/year_2024/June2024/dot3_0624.csv")

# checking columns
colnames(junedata24_1)
colnames(junedata24_2)
colnames(junedata24_3)

# add missing columns
junedata24_1 <- junedata24_1 %>% 
  mutate(COMMODITY2 = NA)

junedata24_2 <- junedata24_2 %>% 
  mutate(DEPE = NA)

junedata24_3 <- junedata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
june_2024 <- bind_rows(junedata24_1, junedata24_2, junedata24_3)


# for july 
judata24_1 <- read.csv("./00_raw_data/year_2024/July2024/dot1_0724.csv")
judata24_2 <- read.csv("./00_raw_data/year_2024/July2024/dot2_0724.csv")
judata24_3 <- read.csv("./00_raw_data/year_2024/July2024/dot3_0724.csv")

# check columns
colnames(judata24_1)
colnames(judata24_2)
colnames(judata24_3)

# add missing columns
judata24_1 <- judata24_1 %>% 
  mutate(COMMODITY2 = NA)

judata24_2 <- judata24_2 %>% 
  mutate(DEPE = NA)

judata24_3 <- judata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
july_2024 <- bind_rows(judata24_1, judata24_2, judata24_3)


# for august
augustdata24_1 <- read.csv("./00_raw_data/year_2024/August2024/dot1_0824.csv")
augustdata24_2 <- read.csv("./00_raw_data/year_2024/August2024/dot2_0824.csv")
augustdata24_3 <- read.csv("./00_raw_data/year_2024/August2024/dot3_0824.csv")

# check for colnames
colnames(augustdata24_1)
colnames(augustdata24_2)
colnames(augustdata24_3)

# add missing columns 
augustdata24_1 <- augustdata24_1 %>% 
  mutate(COMMODITY2 = NA)

augustdata24_2 <- augustdata24_2 %>% 
  mutate(DEPE = NA)

augustdata24_3 <- augustdata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
august_2024 <- bind_rows(augustdata24_1, augustdata24_2, augustdata24_3)


# for september 
septdata24_1 <- read.csv("./00_raw_data/year_2024/september2024/dot1_0924.csv")
septdata24_2 <- read.csv("./00_raw_data/year_2024/september2024/dot2_0924.csv")
septdata24_3 <- read.csv("./00_raw_data/year_2024/september2024/dot3_0924.csv")

# check for columns
colnames(septdata24_1)
colnames(septdata24_2)
colnames(septdata24_3)

# add missing columns
septdata24_1 <- septdata24_1 %>% 
  mutate(COMMODITY2 = NA)

septdata24_2 <- septdata24_2 %>% 
  mutate(DEPE = NA)

septdata24_3 <- septdata24_3 %>% 
  mutate(MEXSTATE = NA, USASTATE = NA, CANPROV = NA)

# bind rows
september_2024 <- bind_rows(septdata24_1, septdata24_2, septdata24_3)

# bind data frames to form 2024 data set
data_2024 <- bind_rows(january_2024, february_2024, march_2024, april_2024,
                       may_2024, june_2024, july_2024, august_2024, september_2024,
                       )

# check columns of data 2020, data 2021, data 2022 & data 2023
colnames(data_2020)
colnames(data_2021)
colnames(data_2022)
colnames(data_2023)
colnames(data_2024)

# combine data frames 
data <- bind_rows(data_2020, data_2021, data_2022, data_2023, data_2024)

# checked for duplicates
sum(duplicated(data))

# check for NA's or empty cells
colSums(is.na(data) | data == "")

# replace empty cells with NA's
data[data == ""] <- NA

# check if empty cells are replaced
colnames(data)[apply(data, 2, anyNA)]

# View structure of the data
str(data)

# convert TRDTYPE, DISAGMOT, Country, DF, Month, Year
data[c('TRDTYPE', 'DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')] <- lapply(
  data[c('TRDTYPE', 'DISAGMOT', 'COUNTRY', 'DF', 'MONTH', 'YEAR')], as.character
)






# ANALYSIS

# summary statistics aggregated across the entire data set

options(scipen = 999) # set to avoid scientific notation 

summary_statistics <- data %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = T),
    Total_ShipWt = sum(SHIPWT, na.rm = T),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = T),
    Avg_Value = mean(VALUE, na.rm = T),
    Avg_ShipWt = mean(SHIPWT, na.rm = T),
    Avg_Freight_Charges = mean(FREIGHT_CHARGES, na.rm = T)
  )

summary_statistics
format(summary_statistics, scientific = F, big.mark = ",")


# Grouping data by YEAR and calculating yearly statistics
yearly_statistics <- data %>% 
  group_by(YEAR) %>%
  summarise(
    Total_Value = sum(VALUE, na.rm = T),
    Total_ShipWt = sum(SHIPWT, na.rm = T),
    Total_Freight_Charges = sum(FREIGHT_CHARGES, na.rm = T),
    Avg_Value = mean(VALUE, na.rm = T),
    Avg_ShipWt = mean(SHIPWT, na.rm = T),
    Avg_Freight_Charges = mean(FREIGHT_CHARGES, na.rm = T)
  ) %>%
  # round the numbers to  3 decimals
  mutate(
    Total_Value = round(Total_Value /1e9, 3), # convert to billions and round
    Total_ShipWt = round(Total_ShipWt /1e9, 3), # convert to billions and round
    Total_Freight_Charges = round(Total_Freight_Charges /1e6), # convert to millions and round
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
    Avg_ShipWt = paste(Avg_ShipWt, "kg", sep = ""),
    Avg_Freight_Charges = paste(Avg_Freight_Charges, "M", sep = "")
  )

# print yearly statistics
yearly_statistics


# Data visualization

# Data visualization based on transportation mode (DISAGMOT)
mode_description <- c(
  "1" = "Vessel",
  "3" = "Air",
  "4" = "Mail (U.S. Post Service)",
  "5" = "Truck",
  "6" = "Rail",
  "7" = "Pipeline",
  "8" = "Other",
  "9" = "Foreign Trade Zones (FTZs)"
)

# plotting the freight value by mode across the years
transportation_mode <- ggplot(data, aes(
  x = YEAR, y = VALUE / 1e6,
  fill = factor(DISAGMOT)
)) + geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Top Modes of Transportation by Freight Value",
    x = "Year",
    y = "Value (in millions)"
  ) + 
  theme_minimal() +
  scale_fill_manual(
    values = RColorBrewer::brewer.pal(8, "Set2"),  # Choosing a color palette with enough colors
    labels = mode_description,                    # Custom labels for transportation modes
    name = "Transportation Mode"
  )

# print transportation mode
transportation_mode



