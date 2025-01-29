# TransBorderFreight Data Analysis

This project analyses transportation data from the **Bureau of Transportation Statistics (BTS)** to uncover insights into cross-border freight's efficiency, safety and environmental impacts across modes such as road, rail, air and water.

## Objectives
- **Freight Patterns**: Identify trends in freight volume, routing and modes of transport.
- **Operational Efficiency**: Detect inefficiencies and propose resource optimisation strategies.
- **Environmental Impact**: Assess emissions and fuel usage, recommending sustainability improvements.
- **Safety Analysis**: Evaluate incidents and suggest safety protocol enhancements.
- **Economic Effects**: Analyse the impact of trade patterns, policies and global disruptions.
- **Data-Driven Solutions**: Provide actionable recommendations for improving freight systems.

## Methodology
The analysis follows the **CRISP-DM** framework:
1. Business Understanding: Defining the project objectives and data-related goals.
2. Data Understanding: Exploring and assessing the quality of the data.
3. Data Preparation: To ensure the dataset was ready for analysis, a meticulous data preparation process was carried out as follows:
   - Monthly data files were organised into corresponding monthly folders.
   - These monthly files were merged into a single file for each year (2020 to 2024) using Excel. This step streamlined the data and allowed for efficient year-wise aggregation.
   - Each year's consolidated dataset was imported into RStudio for further cleaning and transformation.
   - The source column was removed as it contained redundant metadata resulting from the aggregation process in Excel.
   - Column names across all datasets were carefully checked to ensure uniformity, enabling seamless binding of data across years.
   - Empty cells in key columns, such as MEXSTATE and USASTATE, were identified and replaced with NA values to indicate missing data accurately.
   - The cleaned and consolidated datasets from each year were bound together using the library package dplyr into a single dataset, forming the basis for further analysis.
5. Modelling: Applying analytical and machine learning techniques (where applicable).
6. Evaluation: Interpreting results and validating insights.
7. Deployment: Communicating findings and actionable strategies to stakeholders.

## Tools
- **RStudio**: Data analysis and visualisation.
- **Git**: Version control.

## Outcomes
- Insights into freight trends and inefficiencies.
- Strategies for sustainability, safety and system performance improvement.
- Data visualisations for effective communication.

