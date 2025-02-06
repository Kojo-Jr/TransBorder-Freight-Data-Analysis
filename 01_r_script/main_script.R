
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

# Filling the  NA values of each column
# Check unique values of each column
unique(data$USASTATE)
unique(data$DEPE)
unique(data$MEXSTATE)
unique(data$CANPROV)
unique(data$DF)


# fill of the USASTATE NA's based on the DEPE codes
# create a vector
depe_mapping <- c(
  "01XX" = "ME", "0101" = "ME", "0102" = "ME", "0103" = "ME", "0104" = "ME", "0105" = "ME",
  "0106" = "ME", "0107" = "ME", "0108" = "ME", "0109" = "ME", "0110" = "ME", "0111" = "ME",
  "0112" = "ME", "0115" = "ME", "0118" = "ME", "0121" = "ME", "0127" = "ME", "0131" = "NH",
  "0132" = "ME", "0182" = "NH", "0152" = "ME", "0181" = "ME",
  "02XX" = "VT", "0201" = "VT", "0203" = "VT", "0206" = "VT", "0207" = "VT",
  "0209" = "VT", "0211" = "VT", "0212" = "VT",
  "04XX" = "MA", "0401" = "MA", "0402" = "MA", "0403" = "MA", "0404" = "MA", "0405" = "MA",
  "0406" = "MA", "0407" = "MA", "0408" = "MA", "0409" = "MA", "0410" = "CT", "0411" = "CT",
  "0412" = "CT", "0413" = "MA", "0417" = "MA",
  "05XX" = "RI", "0501" = "RI", "0502" = "RI", "0503" = "RI",
  "07XX" = "NY", "0701" = "NY", "0704" = "NY", "0706" = "NY", "0708" = "NY",
  "0712" = "NY", "0714" = "NY", "0715" = "NY",
  "09XX" = "NY", "0901" = "NY", "0903" = "NY", "0904" = "NY", "0905" = "NY",
  "0906" = "NY", "0971" = "NY", "0972" = "NY", "0981" = "NY",
  "10XX" = "NY", "1001" = "NY", "1002" = "NY", "1003" = "NJ", "1012" = "NY",
  "11XX" = "PA", "1101" = "PA", "1102" = "PA", "1103" = "DE", "1104" = "PA",
  "1105" = "NJ", "1106" = "PA", "1107" = "NJ", "1109" = "PA", "1113" = "NJ",
  "1119" = "PA", "1181" = "PA", "1182" = "NJ", "1183" = "NJ", "1195" = "PA",
  "13XX" = "MD", "1301" = "MD", "1302" = "MD", "1303" = "MD", "1304" = "MD", "1305" = "MD",
  "14XX" = "VA", "1401" = "VA", "1402" = "VA", "1404" = "VA", "1408" = "VA",
  "1409" = "VA", "1410" = "VA", "1412" = "VA",
  "15XX" = "NC", "1501" = "NC", "1502" = "NC", "1503" = "NC", "1506" = "NC",
  "1511" = "NC", "1512" = "NC",
  "16XX" = "SC", "1601" = "SC", "1602" = "SC", "1603" = "SC", "1604" = "SC", "1681" = "SC",
  "17XX" = "GA", "1701" = "GA", "1703" = "GA", "1704" = "GA",
  "18XX" = "GA", "1801" = "FL", "1803" = "FL", "1805" = "FL", "1807" = "FL", "1808" = "FL",
  "1809" = "FL", "1814" = "FL", "1816" = "FL", "1818" = "FL", "1819" = "FL",
  "1821" = "FL", "1822" = "FL", "1883" = "FL", "1884" = "FL", "1885" = "FL",
  "1886" = "FL", "1887" = "FL",
  "19XX" = "AL", "1901" = "AL", "1903" = "AS", "1904" = "LA", "1910" = "LA",
  "2006" = "TN", "2007" = "TN",
  "23XX" = "TX", "2301" = "TX", "2302" = "TX", "2303" = "TX", "2304" = "TX",
  "2305" = "TX", "2307" = "TX", "2310" = "TX",
  "24XX" = "TX", "2402" = "TX", "2403" = "TX", "2404" = "TX", "2406" = "NM",
  "2407" = "NM", "2408" = "NM", "2481" = "NM",
  "25XX" = "CA", "2501" = "CA", "2502" = "CA", "2503" = "CA", "2504" = "CA",
  "2505" = "CA", "2506" = "CA", "2507" = "CA",
  "26XX" = "AZ", "2601" = "AZ", "2602" = "AZ", "2603" = "AZ", "2604" = "AZ",
  "2605" = "AZ", "2606" = "AZ", "2608" = "AZ", "2609" = "AZ",
  "27XX" = "CA", "2704" = "CA", "2720" = "CA",
  "30XX" = "WA", "31XX" = "WA", "32XX" = "OR", "33XX" = "MT", "34XX" = "ND",
  "35XX" = "MN", "36XX" = "WI", "37XX" = "MI", "38XX" = "MI", "39XX" = "OH",
  "41XX" = "IL", "45XX" = "KY", "49XX" = "LA", "51XX" = "NM", "52XX" = "TX",
  "53XX" = "WA", "54XX" = "OR", "55XX" = "TX", "59XX" = "CA",
  "60XX" = "HI", "80XX" = "AK"
)

# Replace NA values in USASTATE based on DEPE mapping
data$USASTATE[is.na(data$USASTATE)] <- depe_mapping[data$DEPE[is.na(data$USASTATE)]]


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


# Data visualisation

# Data visualisation based on transportation mode (DISAGMOT)
mode_description <- c(
  "1"  = "Vessel",
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



# data visualisation of freight value over time for each year
# Run the analysis for years
years <- c(2020, 2021, 2022, 2023, 2024)

analyse_yearly_data <- function(data, year) {
  # filter data for the given year and aggregate by month
  monthly_summary <- data %>% 
    filter(YEAR == year) %>% 
    group_by(MONTH) %>% 
    summarise(Total_Value = sum(VALUE, na.rm = T)) %>% 
    mutate(
      Monthly_label = factor(MONTH, levels = 1:12, labels = month.name)
    ) %>% 
    arrange(MONTH)
  
  # print monthly summary
  monthly_summary
  
  # plot the data 
  ggplot(monthly_summary, aes(
    x = Monthly_label, y = Total_Value
  )) + 
    geom_line(color = "blue", linewidth = 1.2) +
    geom_point(color = "red", size = 3) +
    scale_y_continuous(
      # round the y axis to millions
      labels = scales::label_number(scale = 1e-6, suffix = "M", accuracy = 0.01)
    ) +
    labs(
      title = paste("Monthly Freight Value in", year),
      x = "Month",
      y = "Total Freight Value (USD)"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
}

# using the for loop 
for(year in years) {
  print(paste("Processing data for year:", year))
  print(analyse_yearly_data(data, year))
}




# data visualisation on ShipWt by US States
for(year in years) {
  # filter data for the current year
  yearly_data <- data %>%  filter(YEAR == year)
  
  # summarize the total freight (SHIPWT) by state 
  state_freight_summary <- yearly_data %>% 
    group_by(USASTATE) %>% 
    summarise(Total_ShipWt = sum(SHIPWT, na.rm = T)) %>% 
    arrange(desc(Total_ShipWt)) # sort by total freight
}
