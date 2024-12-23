# Gym Membership Data Analysis

This repository contains SQL queries designed to analyze gym membership data and gain valuable insights. The queries cover data exploration, cleaning, and analysis to understand customer demographics, preferences, and usage patterns.

## Data Exploration

* **Initial Data View:** Retrieves all columns from the `gym_membership` table for an initial overview of the data.
* **Customer Age Analysis:** 
    * Calculates the average customer age.
    * Determines the minimum and maximum ages of customers.
* **Null Value Check:** 
    * Identifies and investigates potential issues with null values in the `attend_group_lesson` and `personal_training` columns.
* **Gender Distribution:** Calculates the percentage of male and female members.

## Data Cleaning

* **Birthday Column Formatting:** Converts the `birthday` column to the `DATE` data type for consistent date handling.
* **Time Column Formatting:** 
    * Converts `avg_time_check_in` and `avg_time_check_out` to the `TIME` data type for accurate time calculations.
    * Calculates the `duration` of gym visits based on check-in and check-out times.

## Analysis

* **Subscriptions with Training:** 
    * Analyzes the relationship between subscription types (`abonoment_type`) and the utilization of personal training and group lessons.
* **Group Lesson Popularity:** 
    * Identifies the most and least popular group lessons based on member preferences.

## Usage

1. **Prerequisites:** Ensure you have access to the `GymAnalaysis` database and the `gym_membership` table.
2. **Execution:** Execute the SQL queries in a suitable environment (e.g., SQL Server Management Studio, MySQL Workbench).
3. **Interpretation:** Analyze the results to gain insights into customer behavior and gym usage patterns.

**Note:**

* Commented sections for data cleaning operations are included to prevent accidental modifications during repeated script execution.
* This analysis provides a foundation for further exploration and data-driven decision-making related to gym operations and member engagement.

This README provides a comprehensive and professional overview of the SQL queries and their purpose, making it easy for others to understand and utilize the code.
