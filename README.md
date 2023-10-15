# Cyclistic Bike-Sharing Analysis 🚲

## Table of Contents
- [Project Overview](#project-overview)
- [Business Task](#business-task)
- [Data Sources](#data-sources)
- [Data Cleaning & Manipulation](#data-cleaning--manipulation)
- [R Programming Analysis](#r-programming-analysis)
- [Analysis Summary](#analysis-summary)
- [Key Findings](#key-findings)
- [Recommendations](#recommendations)
- [Tableau Dashboard](#tableau-dashboard)

## Project Overview
This project delves into the bike-sharing patterns of Cyclistic, a prominent bike-sharing company in Chicago. Leveraging the R programming language, I derived insights accentuating the unique behaviors of Cyclistic's annual subscribers and casual riders. The end goal? Designing effective marketing strategies that convert occasional riders into dedicated annual subscribers.

## Business Task
Identify and understand the disparities in usage patterns between annual members and casual riders. By uncovering these nuances, Cyclistic is poised to design marketing campaigns that resonate with casual riders, nudging them towards annual memberships.

## Data Sources
The core dataset stems from Cyclistic's ride-sharing archives. It provides an exhaustive look at rides undertaken by both annual members and casual riders. This dataset chronicles details like bike type, ride timings, day of the week, day of the month, month, season, and the ride's duration.

## Data Cleaning & Manipulation
Data wrangling was executed using R. Key stages included:
- Eradicating duplicate entries.
- Managing missing values through either imputation or omission.
- Transitioning time-centric fields into standardized date-time formats.

## R Programming Analysis
While SQL was an initial consideration, file size constraints led to the adoption of R for its efficiency and performance. The entire data analysis process in R is encapsulated in the [Data Cleaning and Analysis](<Data Cleaning and Analysis.R>) file. For a quick overview:
- Libraries used include: `tidyverse`, `lubridate`, `hms`, `data.table`.
- Monthly data files were ingested into R and stored in distinct data frames.
- A unified annual view was constructed by binding the 12 monthly datasets.
- Key operations involved data merging, column creation, and a series of data transformations and aggregations.

> For an in-depth view of the R code and further analysis details, [click here](<Your_GitHub_Link_Here>).

## Analysis Summary
Distinct patterns emerged when comparing annual members with casual riders:
- **Member Type**: Casual riders represent around 43% of the total rides, whereas members contribute 57%.
- **Bike Preference**: Classic bikes are universally favored. However, casual riders exhibit a pronounced preference for electric bikes.
- **Time-based Patterns**: Casual riders predominantly use the service during weekends and afternoons, possibly for leisure. In contrast, members demonstrate consistency throughout the week, hinting at routine commutes.
- **Ride Duration**: Casual rides tend to be lengthier, aligning with leisurely or exploratory rides. Members typically have concise, consistent durations, suggestive of fixed commutes or habitual routes.

## Key Findings
- Casual riders lean towards leisurely rides, especially on weekends and afternoons.
- Members showcase consistent usage, potentially for daily commuting purposes.
- While classic bikes are universally popular, casual riders show a tilt towards electric variants.
- Afternoons, especially around 5 PM, observe the highest ride traffic.
- Saturdays are the preferred day for most rides, more so for casual users.
- July stands out as the most active month, with summer being the peak season.

## Recommendations
1. **Tailored Promotions**: Roll out afternoon and weekend-centric promotions to allure casual riders. Spotlight membership advantages, particularly for prolonged leisure rides.
2. **Enhance Bike Availability**: Prioritize the availability of both classic and electric bikes during high-demand periods to elevate user experience.
3. **Member Benefits**: Showcase exclusive member benefits such as preferential pricing, fast-track bike access, or member-only routes to persuade casual riders towards annual memberships.

## Tableau Dashboard
For a dynamic visualization of the analysis and insights, visit the Tableau dashboard [here](<Your_Tableau_Link_Here>).
