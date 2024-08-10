# HOUSEHOLD FINANCIAL HEALTH ANALYTICS PLATFORM

## Description

The Household Financial Health Analytics Platform is an advanced analytical tool designed to provide insights into the financial health of UK households, leveraging data from the Understanding Society: Calendar Year Dataset, 2020. This comprehensive platform aims to analyze and visualize the socioeconomic and demographic information that shapes household financial stability, assisting organizations in policy-making and financial planning.

## Dataset Information

The foundational data source is the Understanding Society: Calendar Year Dataset, 2020, a robust dataset facilitating cross-sectional analysis of household financial behavior in the UK during 2020. The dataset integrates data from multiple waves, encompassing social behavior, income, property, housing, and more, providing a rich ground for statistical modeling and quantitative analysis.

## Objectives

- To provide a thorough analysis of household financial health trends.
- To generate visualizations that clarify household financial health variables.
- To derive insights that can guide financial and policy decision-making.

## Scope

- The project utilizes the Understanding Society: Calendar Year Dataset, 2020.
- It focuses on understanding key factors influencing household financial health.
- The insights gained will be used for financial product development and policy guidance.

## Success Criteria

- Establishment of an analytics platform.
- Creation of clear visualizations of critical variables.
- Generation of actionable insights from data analysis.

## Key Features

- **Comprehensive Analysis**: A deep dive into the variables affecting household financial health, such as income, employment, and education.
- **Predictive Modelling**: Forecasting financial outcomes for households using machine learning.
- **Customizable Dashboards**: For visualizing trends and insights specific to organizational needs.
- **Actionable Recommendations**: Evidence-based insights to guide decision-making.

## Benefits

- **Enhanced Decision-Making**: Data-driven insights for strategic planning.
- **Improved Targeting**: Identifying and assisting vulnerable populations.
- **Tailored Solutions**: Developing customized financial products and services.
- **Innovation Opportunities**: Identifying trends for product development.
- **Regulatory Compliance**: Ensuring ethical standards in data use.

## Files and Usage

- **Data Files**: Located in the `data/raw` directory, original data files (`jkl_indresp.tab.csv` and `kl_hhresp.tab.csv`) serve as the foundation for analysis.
- **Data Dictionaries**: Found in `data/dictionaries`, RTF data dictionaries (`jkl_indresp_ukda_data_dictionary.rtf` & `jkl_hhresp_ukda_data_dictionary.rtf`) have been processed into CSV format (`hhresp_data_dictionary.csv` & `indresp_data_dictionary.csv`) for ease of use.
- **Processed Data**: Located in the data/processed` directory, this includes cleaned datasets ('variables.csv' and 'transformed_variables.csv') and geographical files ('RGN_DEC_2021_EN_BGC.*') used for spatial analysis.
- **R Scripts**: Contained in the 'scripts/R' directory, including scripts for data processing ('Cleaning data dictionaries.R'), creating a GitHub repository ('create_github_repo.R'), exploratory data analysis ('Exploratory_Data_Analysis.Rmd' and the corresponding HTML report), and building the Shiny application ('Household_Financial_Health_Analytics_App.R').
- **Python Scripts**: The `TransformCategoricalCodes_to_Labels.ipynb` notebook in `scripts/Python` is for transforming and cleaning datasets.
- **SQL Script**: The `extracting_variables_for_HFHAP.sql` script is located in the `database` directory and describes the process used to extract relevant variables for analysis.
- **Database**: The `variables for analysis.db` in the `database` directory contains the structured dataset for analysis.
- **Project Files**: Includes the RStudio project file and DB Browser for SQLite project file (`variables for analysis.sqbpro`) in the `project_files` directory to manage and interact with the database efficiently.

## Citation

1. University of Essex, Institute for Social and Economic Research. (2022). Understanding Society: Calendar Year Dataset, 2020. [data collection]. UK Data Service. SN: 8988, DOI: [http://doi.org/10.5255/UKDA-SN-8988-1](http://doi.org/10.5255/UKDA-SN-8988-1).

2. Office for National Statistics. (2023). Regions (December 2021) EN BGC. [Dataset]. Available at: [https://geoportal.statistics.gov.uk/datasets/ons::regions-december-2021-en-bgc-1/about](https://geoportal.statistics.gov.uk/datasets/ons::regions-december-2021-en-bgc-1/about). Contains both Ordnance Survey and ONS Intellectual Property Rights.

---

For more information, please contact the project maintainer at mellogwayo@gmail.com.
