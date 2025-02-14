# Trans-border Freight Data Analysis

This project analyses transportation data from the **Bureau of Transportation Statistics (BTS)** to uncover insights into cross-border freight's efficiency, safety and environmental impacts across road, rail, air and water modes.

## Objectives
- **Freight Patterns**: Identify freight volume trends, routing and transport modes.
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
5. Modelling: Applying analytical and machine learning techniques (where applicable).
6. Evaluation: Interpreting results and validating insights.
7. Deployment: Communicating findings and actionable strategies to stakeholders.

## Tools
- **RStudio**:Data Cleaning, Data analysis and visualisation.
- **Git**: Version control.

## Outcomes
- Insights into freight trends and inefficiencies.
- Strategies for sustainability, safety and system performance improvement.
- Data visualisations for effective communication.

