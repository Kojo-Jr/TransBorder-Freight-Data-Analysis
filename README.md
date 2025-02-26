# Transborder Freight Data Analysis
Transportation systems form the backbone of modern economies, facilitating the movement of goods, services and people across cities, states and nations. They are vital for commerce, tourism and daily living, directly impacting on economic productivity and societal well-being. As transportation networks grow in complexity, so do the challenges they face ranging from safety concerns to inefficiencies and sustainability issues.

The **Bureau of Transportation Statistics (BTS)**, a branch of the U.S. Department of Transportation, serves as a vital resource in tackling these challenges. It provides comprehensive and reliable data on multiple dimensions of transportation systems, including passenger travel, freight movement, safety incidents, infrastructure capacity and environmental impacts. This wealth of data enables policymakers, transportation agencies and businesses to make informed decisions to enhance transportation systems for the public good.

Despite significant advancements, challenges like safety, congestion, infrastructure stress, environmental impact and economic disruptions persist. The Bureau's data encompasses a range of transportation modes, including road, rail, air and water, and covers diverse metrics.

This project analyses transportation data from the **Bureau of Transportation Statistics (BTS)** to uncover insights into cross-border freight's efficiency, safety and environmental impacts across road, rail, air and water modes.

## CRISP DM Framework
The analysis followed the CRISP-DM methodology, which includes the following stages:

Business Understanding

a. Define the project objectives and business goals.

b. Identify key questions that need to be answered. 

Data Understanding 

a. Collect data from various sources.

b. Explore the data (e.g., summary statistics, missing values, patterns).

c. Identify potential issues like inconsistencies, duplicates and outliers

Data Preparation

a. Clean and preprocess the data.

b. Handle missing values and inconsistencies.

c. Transform data into the right format for analysis.


Analysis and Visualisation

a. Exploratory Data Analysis.

b. Confirmatory Data Analysis.

Recommendations

Deployment

a. Implement the model in a real-world environment.

b. Monitor its performance and make improvements if needed.

### 1. Business Understanding

The objectives were defined below, followed by the formulation of analytic questions to guide the modelling process.

Objectives
- **Freight Patterns**: Identify freight volume trends, routing and transport modes.
- **Operational Efficiency**: Detect inefficiencies and propose resource optimisation strategies.
- **Environmental Impact**: Assess emissions and fuel usage, recommending sustainability improvements.
- **Safety Analysis**: Evaluate incidents and suggest safety protocol enhancements.
- **Economic Effects**: Analyse the impact of trade patterns, policies and global disruptions.
- **Data-Driven Solutions**: Provide actionable recommendations for improving freight systems

Analytic Questions:

•How has the total freight value changed over the years from 2020 to 2024?

•What are the top modes of transportation by freight value from 2020 to 2024?

•What are the top modes of transportation by freight value in the US states?

•Which US state contributes the most to ship weight?

•What is the correlation between Freight Value, Shipment Weight and Freight Charges for each year from 2020 to 2024?

•How do import and export values compare across different states in the US?

•What is the variability in shipment weights for exports versus imports? Do exports or imports show more consistency or is one category more prone to outliers?

### 2. Data Understanding: 

The data set consisted of over 5 million records and 15 variables. 
Key variables included:

• Trdtype: Transaction Type

• Usastate, Mexstate, Canprov: Countries involved in Freight Movement

• Value: Value Of Goods In USD

• Shipwt: Shipment Weight

• Freight Charges: Associated Transportation Costs

• Month, Year

The dataset covered multiple years and regions, with data on road, rail, air sand water transport
modes.

Summary statistics across the dataset (2020 – 2024) revealed:

• In 2020, the average value of the goods was about 2.27 million dollars with an average shipping weight of 1.23 million kg. The average freight charge for shipping was 32.76 million.

• In 2021, the average value of the goods increased to 2.76 million dollars, while the average shipping weight was almost the same at 1.22 million kg. Freight charges also rose to 36.55 million.

• In 2022, the average value reached its peak at 3.20 million dollars, but the shipping weight slightly decreased to 1.21 million kg. Freight charges continued to increase to 42.52 million.

• In 2023, the average value dropped slightly to 3.18 million, with a further decrease in shipping weight to 1.20 million kg. The average freight charge went down slightly to 40.98 million.

### 3. Data Preparation

To ensure the dataset was ready for analysis, a meticulous data preparation process was carried out as follows:
   ### Monthly Data Organization & Aggregation
   - Data files for each month were stored in corresponding monthly folders.
   - For the years 2020, 2021, and 2022, each month contained a YTD (Year-to-Date) CSV file, which aggregated data from January up to that month.
   - The YTD files of the last months of each year were loaded into RStudio and column names were checked for consistency across months. Any missing columns were identified and addressed before merging 
     the files to generate a complete dataset for each year.
   - Duplicate entries were also checked and removed to maintain data integrity.
   - Column names across all datasets were carefully checked to ensure uniformity, enabling seamless binding of data across years.
   ### Handling 2023 Data
   - The YTD files was available for January to August 2023, providing cumulative data up to that period.
   - These monthly DOT files were loaded into RStudio, missing columns were addressed and they were merged to reconstruct the complete monthly dataset.
   - Once the September to December data was processed, it was merged with the January–August YTD dataset to form the full 2023 dataset.
   ### Handling 2024 Data
   - Unlike previous years, 2024 did not have YTD CSV files for each month.
   - Instead, each month contained separate DOT1, DOT2 and DOT3 CSV files.
   - These files were loaded into RStudio, column inconsistencies were resolved and they were merged to form a complete dataset for each month.
   - Finally, the monthly datasets were combined to create a unified 2024 dataset.
   ### Final Data Cleaning Steps
   - Column consistency was re-checked across all years to ensure a uniform structure for analysis.
   - Empty cells in key columns, such as MEXSTATE and USASTATE, were identified and replaced with NA values to indicate missing data accurately.
   - The cleaned and consolidated datasets from each year were bound together using the library package dplyr into a single dataset, forming the basis for further    analysis.
   
### 4 Analysis and Visualisation: 
Key Findings from the analytical questions:

#### How has the total freight value changed over the years from 2020 to 2024?

![Image](https://github.com/user-attachments/assets/2be768ff-f3a8-438d-a067-520e10b262a0)

Analysis of freight value trends (2020-2024):
From the chart, the freight value increased steadily from 2020 to 2022. The notable jump in 2021 and 2022 could reflect a post-2020 recovery in global trade, potentially spurred by the easing of pandemic restrictions. The freight value remained very similar between 2022 and 2023, indicating that the growth peaked around 2022–2023, with 2023 having the highest freight value. The decline in 2024 suggests that either the volume or value of shipments decreased. This drop might signal a market correction, changes in trade patterns or other external factors affecting freight services. This suggests consistent growth in freight activities or higher-value shipments over the years

Insights:
The significant year-on-year increase from 2020 to 2023 could indicate:
- Increased global trade and an expansion in freight services, especially after 2020 (potentially post-pandemic recovery)
- The decline in 2024 is noteworthy and may warrant further investigation to understand the underlying reasons such as economic shifts, changes in trade policy or other market dynamics.


### What are the top modes of transportation by freight value from 2020 to 2024??

The bar chart below shows the distribution of freight value (in millions of USD) by transportation
mode for each year. Each mode is represented by a distinct colour.

![Image](https://github.com/user-attachments/assets/a209cb8e-3f65-4627-a816-addce306b4a9)

Analysis:
Trucks and pipelines dominate freight value across most years, indicating their importance in domestic and regional transportation.
Air transportation, while less significant in terms of value, consistently contributes a notable portion of the freight value, highlighting its role in high-value shipments. Pipelines and vessels also contribute significantly, particularly for specific years where bulk commodities like oil or goods with high shipping requirements were involved.

#### What are the top modes of transportation by freight value in the US states?

![Image](https://github.com/user-attachments/assets/ac57f37d-6717-494f-836a-4dbcf6f6903e)

Analysis:
The bar chart above illustrates the distribution of freight value (in trillions of USD) by transportation mode over the past four years across the top 10 US states. Each transportation mode is color- coded, allowing for easy differentiation.

Notably, truck transportation overwhelmingly dominates the freight value. Texas is particularly prominent, with truck freight value exceeding 4.5 trillion USD, far surpassing the contributions of other states. California also shows significant activity, recording over 1 trillion USD in truck freight value. In contrast, other modes such as rail, air and pipeline consistently contribute less, with freight values remaining below 1 trillion USD across these states.

These observations indicate that truck transport is the critical driver of freight value in the US, especially in key states like Texas and California, while the contribution of other modes is relatively modest. This dominance suggests that the environmental impact of freight transportation is largely driven by truck-related emissions and fuel usage. Trucks generally have higher greenhouse gas emissions and
lower fuel efficiency compared to modes such as rail or pipeline.

### Environmental Impact Assessment:
Emissions & Fuel Usage:
Trucks typically relies on diesel, which emits significant levels of CO₂, NOₓ, and particulate matter. Given that truck freight value far exceeds that of other modes, it implies high fuel consumption and consequently, a larger carbon footprint

#### Sustainability Considerations:
Other modes such as rail, air and pipeline contribute much less to freight value (below 1 trillion USD) and these modes generally offer more efficient, lower-emission alternatives for bulk commodities. The heavy reliance on truck transport therefore suggests that there is considerable scope for sustainability improvements.


#### Which US state contributes the most to ship weight?

![Image](https://github.com/user-attachments/assets/fac53cc4-c9c6-446f-912a-f1bf1ee3804b) 

![Image](https://github.com/user-attachments/assets/45cfcecf-9752-4fbc-99f0-43e5fbf87538) 

![Image](https://github.com/user-attachments/assets/6fb3f6c0-5b59-48fc-99d8-281608fb389f)

![Image](https://github.com/user-attachments/assets/bb75eab8-689d-4daf-a7d1-3b0b1d4d8c7b)

Analysis:
The states with the highest freight weight include Texas followed by Illinois and Ohio. Texas led by a significant margin throughout the years from 2020 to 2024, reflecting its central role in freight logistics, possibly due to its major ports and highways.


#### What is the correlation between Freight Value, Shipment Weight and Freight Charges for each year from 2020 to 2024?

![Image](https://github.com/user-attachments/assets/fd11c555-3b09-42b2-b9c4-74d22aa05ba3)

Analysis from 2020:
Freight Value vs. Shipment Weight (0.40): A moderate positive correlation indicates that higher shipment weight is associated with an increase in freight value, though the relationship is not strong.

Freight Value vs. Freight Charges (0.45): A moderate positive correlation suggests that higher freight values tend to be associated with higher freight charges.

Shipment Weight vs. Freight Charges (0.86): A strong positive correlation implies that heavier shipments tend to incur higher freight charges.

Analysis from 2021:
Freight Value vs. Shipment Weight (0.54): A moderate positive correlation, slightly stronger than in 2020, shows an increasing association between shipment weight and freight value.

Freight Value vs. Freight Charges (0.57): A moderate positive correlation, also stronger than in 2020, highlights a growing relationship between freight value and freight charges.

Shipment Weight vs. Freight Charges (0.87): The strong positive correlation remains consistent, indicating a continued link between shipment weight and charges.

Analysis from 2022:
Freight Value vs. Shipment Weight (0.64): A stronger positive correlation reflects a significant relationship between the value of goods and 
their shipment weight this year.

Freight Value vs. Freight Charges (0.64): The correlation strengthens, showing a notable association
between freight value and charges.

Shipment Weight vs. Freight Charges (0.83): The strong positive correlation decreases slightly but
remains substantial.

Analysis for 2023:
Freight Value vs. Shipment Weight (0.56): A moderate positive correlation, lower than 2022, indicates the relationship between value and shipment weight weakened slightly.

Freight Value vs. Freight Charges (0.59): A consistent moderate positive correlation reflects a stable association between freight value and charges.

Shipment Weight vs. Freight Charges (0.89): The strong positive correlation indicates the relationship remains solid between shipment weight and charges

Analysis for 2024:
Freight Value vs. Shipment Weight (0.53): A moderate positive correlation, slightly lower than in 2023, suggests a declining association.

Freight Value vs. Freight Charges (0.57): The consistent correlation indicates that freight value and charges remain moderately linked.

Shipment Weight vs. Freight Charges (0.91): A very strong positive correlation indicates an almost linear relationship, suggesting that heavier shipments are nearly directly proportional to higher freight charges.

Overall Interpretation:
Shipment Weight and Freight Charges: Across all years, there is a consistently strong positive correlation (above 0.89), with the strongest in 2024 (0.91). This indicates that shipment weight is a critical determinant of freight charges.

Freight Value and Shipment Weight: The correlation is generally moderate, ranging from 0.40 in 2020 to a peak of 0.64 in 2022 and then slightly declining afterward. This suggests that heavier shipments tend to have higher values, but the relationship is not as strong or consistent as with freight charges.

Freight Value and Freight Charges: The correlation is moderate across all years, ranging from 0.45 to 0.64, indicating that while higher value shipments often result in higher charges, other factors also contribute.

Key Insights:
Shipment weight is the dominant factor influencing freight charges. While freight value contributes to determining charges, its impact is moderate compared to shipment weight. The year 2022 shows the strongest correlations across all variables, possibly indicating unusual or specific market conditions.

#### How do import and export values compare across different states in the US?

![Image](https://github.com/user-attachments/assets/510cbf07-0a1a-41e0-85fd-b55fd15c36a6)

Analysis: 
Based on the chart, the total trade value (combining both imports and exports) for these states ranges from 0 to approximately 3.7 trillion dollars, underscoring that the trade activities in these regions are significant on a global scale.

Texas stands out with a high import value while also leading in exports, positioning it as a major hub for both inbound and outbound goods. In contrast, California’s trade profile is characterized by a substantial import value that far exceeds its export figures.

Moreover, states like Miami, Illinois and Ohio exhibit trade activity that is almost exclusively import-oriented, with their total trade values remaining below 1 trillion dollars. These insights highlight the diverse trade dynamics across US states, providing a valuable perspective for policy makers and businesses aiming to enhance global trade competitiveness. 

Given the range of trade values from 0 to 3.7 trillion dollars, it’s clear that there is a substantial variation in trade activities among these states. Factors such as geographic location, industry focus and infrastructure play significant roles in determining each state’s trade value.


#### What is the variability in shipment weights for exports versus imports? Do exports or imports show more consistency or is one category more prone to outliers?

![Image](https://github.com/user-attachments/assets/a4c9473d-d55e-4af5-a5f3-2f14c85802ff)

The box plot comparing shipment weight for exports and imports reveals several key insights. First, the median shipment weight for imports is higher than that for exports, indicating that, on average, import shipments tend to be heavier. The export distribution, shown by a smaller box, suggests less variability and more consistency in shipment weight, whereas the import distribution is more spread out, pointing to greater variability among import shipments.

Both trade types exhibit outliers, individual points that fall outside the whiskers with exports displaying a greater number of outliers than imports. Moreover, the distribution of import shipment weights is positively skewed, meaning the data has a longer tail towards the higher weights, while the export distribution appears more symmetric.


## Confirmatory Data Analysis

Hypotheses:

•Null Hypothesis (H₀): Freight value has no effect on trade type.

•Alternative Hypothesis (H₁): Freight value affects trade type.

Variables:

•Dependent variable (y): Trade type

•Independent variable (x): Freight value

•Significance Level (α): 0.05

Analysis:
A logistic regression was performed with trade type as the dependent variable and freight value as the independent variable. The model produced the following coefficients:

Intercept: Estimate: -0.069606

Freight Value (VALUE): Estimate: 0.00000000414899 (approximately 4.15e-09)

Statistical significance: Both coefficients are statistically significant (p values are essentially 0, i.e. < 2e-16)

Interpretation:
Significance of VALUE: The freight value is a statistically significant predictor of trade type. Despite the very small coefficient (due to the scale of VALUE), the extremely low p-value indicates that the relationship is highly unlikely to be due to random chance.

Effect Size: Because VALUE is measured in dollars, its coefficient (approximately 4.15e-09 per dollar) might seem negligible at first glance. However, if changes are considered on a larger scale 10(e.g., per million dollars), the effect becomes more interpretative. For example, a one million dollar increase in freight value would increase the log-odds of the trade type by about 0.00415.

#### Conclusion:
Given that the freight value coefficient is statistically significant (p < 0.05), we reject the null hypothesis (H₀) and conclude that freight value does, affect trade type.



## Insights and Conclusions

The analysis of the transborder freight data from 2020 to 2024 reveals several important trends and insights. Freight value increased steadily from 2020 to 2023, with particularly significant jumps in 2021 and 2022, suggesting a robust post-pandemic recovery and growth in freight activities. However, 2024 witnessed a decline, indicating a possible market correction or changing trade dynamics.

In terms of transportation modes, truck transport emerged as the dominant contributor to freight value, especially in key states such as Texas and California. Other modes such as rail, air and pipeline contributed significantly less, which underscores the reliance on road transport in the current freight ecosystem.

In addition to the environmental impact assessment, the analysis underscored the critical importance of transportation safety in freight operations. Truck transport, which dominates the freight market, is particularly prone to safety incidents that can have far-reaching consequences.

#### Identified Safety Concerns:

• Driver Fatigue: Extended hours on the road without sufficient rest can lead to impaired judgement and increased accident risk.
• Inadequate Maintenance: Poorly maintained vehicles may be more susceptible to mechanical failures, leading to accidents.
• Suboptimal Routing Practices: Inefficient routing can result in longer travel times, increased expo-sure to hazardous conditions, and higher accident rates.

#### Broader Impacts

Public Safety: Accidents involving heavy freight vehicles pose significant risks to both drivers and the public.

Infrastructure Stress: Frequent accidents can damage critical infrastructure, leading to costly repairs and disruptions in service.

Furthermore, the correlation analysis demonstrated a strong, consistent relationship between shipment weight and freight charges, reinforcing that heavier shipments incur higher costs.

The imputation of missing values, which was carefully addressed by mapping related columns rather than using a one-size-fits-all method, preserved the integrity of our data and provided more reliable insights.

## Recommendations:

Based on these findings, the following recommendations are proposed:

I. The marked growth in freight value from 2020 to 2023 followed by a decline in 2024 suggests that continuous monitoring is essential. Stakeholders should implement regular reviews of freight performance metrics to anticipate market shifts and respond promptly.

II. Given the dominance of truck transport in freight value, it is advisable to enhance and modernise the trucking infrastructure, particularly in states with high freight activity such as Texas and California. Invest in cleaner technologies for truck fleets, including electric, hybrid or alternative-fuel vehicles, to reduce per-vehicle emissions.

III. Recommendations for reducing carbon foot printing includes:

•Encourage a shift from truck to more sustainable modes such as rail and pipeline, especially for long-haul and bulk commodity shipments.

•Introduce incentives, such as tax credits or subsidies, for companies that adopt low-carbon technologies and practices in freight transport.

•Collect and analyse detailed data on emissions, fuel usage, and other sustainability metrics to monitor progress and identify further opportunities for improvement.

IV. Improve driver training, adopt advanced vehicle safety technologies, enforce rigorous maintenance and consider multi-modal transport options to reduce the incidence and impact of safety-related events.

V. With a strong correlation between shipment weight and freight charges, there is scope to improve operational efficiency. Strategies to optimise shipment consolidation and routing may help reduce costs.

VI. The experience with missing values underscores the importance of understanding the context and source of incomplete data. Future data collection processes should aim to minimise missing entries, while ongoing data analysis should continue to use informed, context-
specific imputation methods to reduce bias.


## POWER BI DASHBOARD

![Image](https://github.com/user-attachments/assets/db40b27c-18ae-467f-bc37-ebbe83ad4422)

## Tools
- **RStudio**:Data Cleaning, Data analysis and visualisation.
- **Power BI**: Visualisation and Dashboarding.
- **Git**: Version control.

## Outcomes
- Insights into freight trends and inefficiencies.
- Strategies for sustainability, safety and system performance improvement.
- Data visualisations for effective communication.
