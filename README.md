# Cyclistic Bike-Sharing Analysis 🚲

Welcome to the Cyclistic Bike-Sharing Analysis project! This venture was part of the Google Data Analytics Capstone Project, Track 1, Case Study 1. Here, we will navigate through the background, the entire process of data cleaning, analysis, visualization, and finally, the conclusions and recommendations derived from the data.

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Business Task](#business-task)
- [Data Preparation](#data-preparation)
- [Data Processing](#data-processing)
- [Analysis](#analysis)
- [Analysis Summary](#analysis-summary)
- [Key Findings](#key-findings)
- [Tableau Dashboard](#sharing-insights)
- [Recommendations](#recommendations)

## Introduction

This analysis revolves around Cyclistic, a leading bike-sharing company situated in Chicago. The primary objective of this study is to discern the biking patterns of Cyclistic's casual riders and annual subscribers, and subsequently, craft marketing strategies that could potentially convert these casual riders into dedicated annual subscribers.

## Project Overview

In the heart of Chicago, Cyclistic stands out as a premier bike-sharing entity. Using the R programming language, this project extracts pivotal insights that highlight the distinct biking behaviors of casual riders and annual subscribers of Cyclistic.

## Business Task

During a pivotal meeting between data analysts and stakeholders, the core problem was defined and crystallized. Three central questions emerged to guide the future marketing strategy:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why might casual riders opt for Cyclistic annual memberships?
3. How can Cyclistic leverage digital media to convert casual riders into members?

This analysis focuses on addressing the first question, aiming to understand the differential biking patterns of annual members and casual riders. The insights derived will arm Cyclistic with the knowledge to tailor marketing campaigns that resonate deeply with casual riders, enticing them towards annual memberships.

## Data Preparation

The bedrock of this analysis is the dataset derived from Cyclistic's bike-sharing archives, a treasure trove detailing the rides of both annual members and casual riders. This dataset encompasses a wealth of information, including the bike model, timing of rides, day-specific data, and ride durations.

- **Data Source**: The dataset, aptly named "Cyclistic_Data", is securely stored on GitHub.
- **Data Structure**: Comprising 12 individual csv files, this dataset provides a detailed travel record spanning from January to December 2022.
- **Data Integrity and Credibility**: Being a first-party dataset curated by Cyclistic, the data boasts high credibility and a minimal bias. Moreover, the data adheres to the ROCCC principles, being reliable, original, comprehensive, current, and cited.
- **Privacy and Licensing**: Although the data is open-source and generously provided by the company, it remains under Cyclistic's license. Importantly, no personal rider information is disclosed, ensuring utmost privacy.

## Data Processing

To streamline analysis, the 12 individual CSV files were amalgamated into a singular file, post which the data was subjected to rigorous cleaning. Utilizing R, the following data processing steps were meticulously executed:

- Purging duplicates.
- Addressing missing values by  elimination.
- Pruning unnecessary columns.
- Standardizing date-time formats.

For more information, The entire data cleaning process in R is encapsulated in the [Data Cleaning and Analysis](<Data Cleaning and Analysis.R>) file.

## Analysis

While SQL was an initial contender, the vastness of the dataset necessitated the use of R for its unmatched efficiency. The comprehensive R analysis, encapsulated in the [Data Cleaning and Analysis](<Data Cleaning and Analysis.R>) file, involved several libraries, the amalgamation of monthly datasets, and a plethora of data transformations and aggregations.

## Analysis Summary

A comparative study between annual members and casual riders unveiled distinct patterns:

- **Member Type**: Casual riders represent a significant 43% of total rides, whereas members contribute a slightly higher 57%.
- **Bike Preference**: The classic bike reigns supreme, with a notable preference for electric bikes among casual riders.
- **Riding Patterns**: Casual riders predominantly opt for weekend and afternoon rides, hinting at leisurely usage. In contrast, members showcase daily consistency, indicative of routine commutes.
- **Ride Duration**: Casual rides tend to be more extended, resonating with leisurely or explorative rides. Members, on the other hand, usually have shorter, regular durations, reflective of consistent routes or commutes.

## Key Findings

- Casual riders display a penchant for leisurely rides, especially during weekends and afternoons.
- Annual members exhibit daily consistency, probably for routine commutes.
- Classic bikes are universally favored, but casual riders display a distinct tilt towards electric bikes.
- Afternoon rides, especially around 5 PM, peak in popularity.
- Saturdays witness the highest influx of riders, with casual riders taking the lead.
- July emerges as the busiest month, with summer being the preferred season.

## Sharing Insights ( Tableau Dashboard)

Dive into an engaging, interactive visualization of the analysis on the Tableau dashboard [here](https://public.tableau.com/app/profile/carlos.silveio/viz/PedalPatternsDivingIntoCyclisticsAnalytics/PedalPatternsDivingIntoCyclysticsAnalytics).

## Recommendations

- **Tailored Promotions**: Roll out afternoon and weekend-centric promotions to captivate casual riders. Emphasize the myriad benefits of memberships, especially for extended leisure rides.
- **Enhance Bike Availability**: During peak demand periods, ensure the ready availability of both classic and electric bikes to enhance user satisfaction.
- **Exclusive Member Perks**: Spotlight exclusive member perks such as preferential pricing, swift bike access, or members-only routes to entice casual riders into annual memberships.

---

Thank you for diving deep into this analysis. Your feedback and insights are highly valued. Together, let's cycle towards a data-driven future! 🚲
