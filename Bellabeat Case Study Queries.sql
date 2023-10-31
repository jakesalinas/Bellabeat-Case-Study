-- Showing the entire daily activity table and what columns it has.
SELECT *
FROM daily_activity


-- Showing the number of users from the daily activity table
SELECT COUNT(DISTINCT Id) as User_count
FROM daily_activity

--# User_count = 33

-- Showing the number of entries of the course of 2 months and 33 users
SELECT COUNT(*) as total_count
FROM daily_activity


-- Showing the overlap between the daily activity table and calories table
SELECT COUNT(*) as User_overlap
FROM daily_activity
LEFT JOIN daily_calories ON 
	daily_activity.Id = daily_calories.Id AND
	daily_activity.ActivityDate = daily_calories.ActivityDay AND
	daily_activity.Calories = daily_calories.Calories

--# User_overlap = 940

-- Showing the overlap between the daily activity table and steps table
SELECT COUNT(*) as User_overlap
FROM daily_activity
LEFT JOIN daily_steps ON 
	daily_activity.Id = daily_steps.Id AND
	daily_activity.ActivityDate = daily_steps.ActivityDay AND 
	daily_activity.TotalSteps = daily_steps.StepTotal

--# User_overlap = 940

-- Showing the overlap between the daily activity table and the intensities table
SELECT COUNT(*) as User_overlap
FROM daily_activity
LEFT JOIN daily_intensities ON 
	daily_activity.Id = daily_intensities.Id AND
	daily_activity.ActivityDate = daily_intensities.ActivityDay AND
	daily_activity.LightActiveDistance = daily_intensities.LightActiveDistance AND 
	daily_activity.LightlyActiveMinutes = daily_intensities.LightlyActiveMinutes AND 
	daily_activity.SedentaryActiveDistance = daily_intensities.SedentaryActiveDistance AND 
	daily_activity.SedentaryMinutes = daily_intensities.SedentaryMinutes AND 
	daily_activity.ModeratelyActiveDistance = daily_intensities.ModeratelyActiveDistance AND 
	daily_activity.FairlyActiveMinutes = daily_intensities.FairlyActiveMinutes AND 
	daily_activity.VeryActiveDistance = daily_intensities.VeryActiveDistance AND 
	daily_activity.VeryActiveMinutes = daily_intensities.VeryActiveMinutes  

--# User_overlap = 940

-- Because the daily activity table contains all the data from the daily calories, steps, and intensities table we will only use the daily activity table. 

-- Shows the user count for the sleep table. 
SELECT COUNT(DISTINCT Id) AS User_count
FROM daily_sleep 

--# User_count = 24

--We also do not have an equal number of users from the daily sleep table so we will not be using this in the analysis either. 

-- Shows the user count for the weight table.
SELECT COUNT(DISTINCT Id) AS User_count
FROM weightLogInfo_merged$ 

--# User_count = 8

-- Because of the insignifigant number of users in the weight table we will not be using that in our analysis.

-- We will check to see if there are a consistent amount of users within the hourly calories table.
SELECT COUNT(DISTINCT Id) AS User_count 
FROM hourlyCalories

--# User_count = 33

-- We will check to see if there are a consistent amount of users within the hourly intensities table. 
SELECT COUNT(DISTINCT Id) AS User_count
FROM hourlyIntensities 

--# User_count = 33

-- We will check to see if there are a consistent amount of users from the hourly steps table.
SELECT COUNT(DISTINCT Id) AS User_count
FROM hourlySteps

--# User_count = 33

--Convert the hourly activity hour from the hourly calories table to DATETIME format. 
UPDATE hourlyCalories 
SET ActivityHour = CAST(ActivityHour AS DATETIME) 

--Group calories burned by Id and each hour of the day
SELECT *
FROM hourlyCalories
ORDER BY Id, DATEPART(hour, ActivityHour)



-- We will update the data type for the Activity Date column from a string to a DATE.
UPDATE daily_activity
SET ActivityDate = CAST(ActivityDate AS DATE)
GO 

-- Update the data type for the Activity Hour column from the hourly steps table to DATETIME format
UPDATE hourlySteps
SET ActivityHour = CAST(ActivityHour AS DATETIME) 


-- Shows the user distribution by activity type
CREATE VIEW Minutes_avg AS 
SELECT
	AVG(SedentaryMinutes) AS Sedentary_avg,
	AVG(LightlyActiveMinutes) AS Lightly_avg,
	AVG(FairlyActiveMinutes) AS Fairly_avg,
	AVG(VeryActiveMinutes) AS Very_avg
FROM daily_activity

CREATE VIEW Minutes_avg_user AS 
SELECT 
	Id,
	AVG(SedentaryMinutes) AS Sedentary_avg,
	AVG(LightlyActiveMinutes) AS Lightly_avg,
	AVG(FairlyActiveMinutes) AS Fairly_avg,
	AVG(VeryActiveMinutes) AS Very_avg
FROM daily_activity
GROUP BY Id 

CREATE VIEW avg_diff AS 
SELECT 
	Id,
	AVG(SedentaryMinutes) - 991.2106 AS Sedentary_diff,
	AVG(LightlyActiveMinutes) - 192.8127 AS Lightly_diff,
	AVG(FairlyActiveMinutes) - 13.5648 AS Fairly_diff,
	AVG(VeryActiveMinutes) - 21.6489 AS Very_diff
FROM daily_activity
GROUP BY Id 

-- Shows the average calories burned by hour.
CREATE VIEW CaloriesByHour AS
SELECT 
	DATEPART(HOUR, ActivityHour) AS hours, 
	AVG(calories) AS avgCalories
FROM hourlyCalories
GROUP BY DATEPART(HOUR, ActivityHour) 
--ORDER BY hours 


-- Shows the average number of steps by hour
CREATE VIEW StepsByHour AS 
SELECT 
	DATEPART(HOUR, ActivityHour) AS hours,
	AVG(StepTotal) AS avgSteps
FROM hourlySteps
GROUP BY DATEPART(HOUR, ActivityHour)
--ORDER BY hours


-- Showing the averages for the sleep table
CREATE VIEW Sleep_User_Type AS
SELECT 
	daily_sleep.Id,
	AVG(TotalMinutesAsleep) AS AvgMinAsleep,
	AVG(TotalTimeInBed) AS AvgTimeInBed,
	User_type
FROM daily_sleep 
 JOIN daily_activity ON daily_activity.Id = daily_sleep.Id
 JOIN UserType ON UserType.Id = daily_sleep.Id
GROUP BY daily_sleep.Id, User_type
ORDER BY Id 
	


