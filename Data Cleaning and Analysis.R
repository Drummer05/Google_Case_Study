#-----------------DOWNLOAD AND LOAD LIBRARIES-----------------------------
#Install libraries 
install.packages("tidyverse") #calculations
install.packages("lubridate") #dates 
install.packages("hms") #time
install.packages("data.table") #exporting data frame


#load libraries 
library(tidyverse) #calculations
library(lubridate) #dates 
library(hms) #time
library(data.table) #exporting data frame


setwd("C:/Users/csilverio/Desktop/Cyclist data")
getwd()


#load original .csv files, a years worth of data from January 2022 to December 2022
Jan_2022 <- read_csv("202201-divvy-tripdata.csv") 
Feb_2022 <- read_csv("202202-divvy-tripdata.csv") 
Mar_2022 <- read_csv("202203-divvy-tripdata.csv")
Apr_2022 <- read_csv("202204-divvy-tripdata.csv")
May_2022 <- read_csv("202205-divvy-tripdata.csv") 
Jun_2022 <- read_csv("202206-divvy-tripdata.csv") 
Jul_2022 <- read_csv("202207-divvy-tripdata.csv")
Aug_2022 <- read_csv("202208-divvy-tripdata.csv") 
sep_2022 <- read_csv("202209-divvy-publictripdata.csv") 
Oct_2022 <- read_csv("202210-divvy-tripdata.csv")
Nov_2022 <- read_csv("202211-divvy-tripdata.csv") 
Dec_2022 <- read_csv("202212-divvy-tripdata.csv")

# List of all your dataset file names
file_names <- c(
  "202201-divvy-tripdata.csv",
  "202202-divvy-tripdata.csv",
  "202203-divvy-tripdata.csv",
  "202204-divvy-tripdata.csv",
  "202205-divvy-tripdata.csv",
  "202206-divvy-tripdata.csv",
  "202207-divvy-tripdata.csv",
  "202208-divvy-tripdata.csv",
  "202209-divvy-publictripdata.csv",
  "202210-divvy-tripdata.csv",
  "202211-divvy-tripdata.csv",
  "202212-divvy-tripdata.csv"
)

# Read and merge the datasets into one year view
one_year_view <- lapply(file_names, function(file) {
  read_csv(file)
}) %>% 
  bind_rows()


head(one_year_view)

#remove individual month data frames to clear up space in the environment 
remove(Jan_2022, Feb_2022, Mar_2022, Apr_2022, May_2022, Jun_2022, Jul_2022, Aug_2022, sep_2022, Oct_2022, Nov_2022, Dec_2022)

#create new data frame to contain new columns
cyclistic_data <- one_year_view


#calculate ride length by subtracting ended_at time from started_at time and converted it to minutes
cyclistic_data$ride_length <- difftime(one_year_view$ended_at, one_year_view$started_at, units = "mins")
cyclistic_data$ride_length <- round(cyclistic_data$ride_length, digits = 1)

# Extract date and time components
cyclistic_data <- cyclistic_data %>%
  mutate(
    date = as.Date(started_at),
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE),
    month_num = month(started_at),
    month = month(started_at, label = TRUE, abbr = FALSE),
    day = day(started_at),
    year = year(started_at),
    time = hms(format(started_at, "%H:%M:%S")),
    hour = hour(time)
  )

# Assign seasons
cyclistic_data <- cyclistic_data %>%
  mutate(
    season = case_when(
      month_num %in% 3:5 ~ "Spring",
      month_num %in% 6:8 ~ "Summer",
      month_num %in% 9:11 ~ "Fall",
      TRUE ~ "Winter"
    )
  )

# Assign time of day
cyclistic_data <- cyclistic_data %>%
  mutate(
    time_of_day = case_when(
      hour %in% 0:5 ~ "Night",
      hour %in% 6:11 ~ "Morning",
      hour %in% 12:17 ~ "Afternoon",
      TRUE ~ "Evening"
    )
  )


cyclistic_data <- cyclistic_data %>%
  # Remove rows with NA values
  na.omit() %>%
  # Remove duplicate rows
  distinct() %>%
  # Remove rows where ride_length is 0 or negative
  filter(ride_length > 0) %>%
  # Remove columns not needed
  select(-c(ride_id, start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng))

#view the clean data 
View(cyclistic_data)

########################### ANALYSIS #################################

# Function to print counts
print_counts <- function(data, ...) {
  data %>%
    group_by(...) %>%
    count() %>%
    print(n = n())
}

# Function to calculate average ride length
avg_ride_length <- function(data, ...) {
  data %>%
    group_by(...) %>%
    summarise(avg_ride_length = mean(ride_length, na.rm = TRUE)) %>%
    print(n = n())
}

# Total Rides
cat("Total Rides:", nrow(cyclistic_data), "\n")

# Member Type
print_counts(cyclistic_data, member_casual)

# Type of Bike
print_counts(cyclistic_data, member_casual, rideable_type)
print_counts(cyclistic_data, rideable_type)

# Hour
print_counts(cyclistic_data, member_casual, hour)
print_counts(cyclistic_data, hour)

# Time of Day
times_of_day <- c("Morning", "Afternoon", "Evening", "Night")
for (time in times_of_day) {
  cat(paste("Time of Day -", time, "\n"))
  print_counts(cyclistic_data, member_casual, time_of_day = time)
  print_counts(cyclistic_data, time_of_day = time)
}

# All Times of Day
print_counts(cyclistic_data, member_casual, time_of_day)
print_counts(cyclistic_data, time_of_day)

# Day of the Week
print_counts(cyclistic_data, member_casual, day_of_week)
print_counts(cyclistic_data, day_of_week)

# Day of the Month
print_counts(cyclistic_data, member_casual, day)
print_counts(cyclistic_data, day)

# Month
print_counts(cyclistic_data, member_casual, month)
print_counts(cyclistic_data, month)

# Season
seasons <- c("Spring", "Summer", "Fall", "Winter")
for (season in seasons) {
  cat(paste("Season -", season, "\n"))
  print_counts(cyclistic_data, member_casual, season = season)
  print_counts(cyclistic_data, season = season)
}

# All Seasons
print_counts(cyclistic_data, member_casual, season)
print_counts(cyclistic_data, season)

# Average Ride Length
cat("Average Ride Length:", mean(cyclistic_data$ride_length, na.rm = TRUE), "\n")

# Average Ride Length by Member Type
avg_ride_length(cyclistic_data, member_casual)

# Average Ride Length by Member Type and Type of Bike
avg_ride_length(cyclistic_data, member_casual, rideable_type)

# Average Ride Length by Type of Bike
avg_ride_length(cyclistic_data, rideable_type)

# Average Ride Length by Hour and Member Type
avg_ride_length(cyclistic_data, hour, member_casual)
avg_ride_length(cyclistic_data, hour)

# Average Ride Length by Time of Day and Member Type
for (time in times_of_day) {
  avg_ride_length(cyclistic_data, member_casual, time_of_day = time)
  avg_ride_length(cyclistic_data, time_of_day = time)
}

# Average Ride Length by Day of the Week and Member Type
avg_ride_length(cyclistic_data, member_casual, day_of_week)
avg_ride_length(cyclistic_data, day_of_week)

# Average Ride Length by Day of the Month and Member Type
avg_ride_length(cyclistic_data, day, member_casual)
avg_ride_length(cyclistic_data, day)

# Average Ride Length by Month and Member Type
avg_ride_length(cyclistic_data, month, member_casual)
avg_ride_length(cyclistic_data, month)

# Average Ride Length by Season and Member Type
for (season in seasons) {
  avg_ride_length(cyclistic_data, member_casual, season = season)
  avg_ride_length(cyclistic_data, season = season)
}

# Average Ride Length for All Seasons
avg_ride_length(cyclistic_data, season, member_casual)
avg_ride_length(cyclistic_data, season)

#download the new data as a .csv file for tableau dashboard
fwrite(cyclistic_data,"cyclistic_data.csv")
