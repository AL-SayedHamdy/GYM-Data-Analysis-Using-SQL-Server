/*
In this SQL query, I want to see if the data we will see if the data we have to get some information out of it,
or maybe we can have some cleaning if we need to and do some analysis, let's do it step by step.
*/

SELECT *
FROM GymAnalaysis..gym_membership;

-- Now let's get the average of customers' ages
SELECT CAST(AVG(Age) AS INT) AS average_customers_age
FROM GymAnalaysis..gym_membership;

-- Here we can see the minimum and maximum of customers' ages.
SELECT MIN(Age) AS Minimum_customers_age, MAX(AGE) AS maximum_customers_age
FROM GymAnalaysis..gym_membership;

-- I'm checking whether the 'NULL' values make sense or if we need to fix something in the data.
SELECT first_name, fav_group_lesson, attend_group_lesson
FROM GymAnalaysis..gym_membership
WHERE attend_group_lesson = 0;

SELECT first_name, name_personal_trainer, personal_training
FROM GymAnalaysis..gym_membership
WHERE personal_training = 0;
/*
Now after we see we did notice that the 'NULL' values do make sense in the data and they need to be there.
*/

--Here we can see what gender is more subscribed in the GYM.
SELECT gender, COUNT(*) AS total_count, COUNT(*) * 100.0/ 4000 AS total_percentage
FROM GymAnalaysis..gym_membership
GROUP BY gender;

/*
Here we will try to fix the DATE column, so we can see the clear date, like I said,
we will try to clean the data if we need to.
I commented on this section so not every time we run the query it will edit the same column.
*/
--ALTER TABLE GymAnalaysis..gym_membership
--ADD birthday_new DATE
--UPDATE GymAnalaysis..gym_membership
--SET birthday_new = CAST(birthday AS DATE);

-- Let's check what abonnement type is more and let's compare between the 'Standard' and 'Premium'.
SELECT abonoment_type, COUNT(*) AS total_abonoment_count, COUNT(*) * 100.0/ 4000 AS abonoment_type_percentage
FROM GymAnalaysis..gym_membership
GROUP BY abonoment_type
ORDER BY total_abonoment_count DESC;

---------------------------------------------------------------------
/*
Here we need to change the data type of the time to have it clear,
so I created a new column to clean the time in, check in time, check out time.
*/
--ALTER TABLE GymAnalaysis..gym_membership
--ADD avg_time_check_in_new VARCHAR(8);
--UPDATE GymAnalaysis..gym_membership
--SET avg_time_check_in_new = CONVERT(VARCHAR(8), avg_time_check_in_new, 108);

--ALTER TABLE GymAnalaysis..gym_membership
--ADD avg_time_check_in_new TIME(0);
--UPDATE GymAnalaysis..gym_membership
--SET avg_time_check_in_new = CAST(avg_time_check_in AS TIME(0))

--ALTER TABLE GymAnalaysis..gym_membership
--ADD avg_time_check_out_new TIME(0);
--UPDATE GymAnalaysis..gym_membership
--SET avg_time_check_out_new = CAST(avg_time_check_out AS TIME(0))
/*
Here we subtracted the time of check out with the chick in to get the duration the customer stayed in the GYM
*/
--ALTER TABLE GymAnalaysis..gym_membership
--ADD duration TIME(0);
--UPDATE GymAnalaysis..gym_membership
--SET duration = CONVERT(TIME(0), DATEADD(SECOND, DATEDIFF(SECOND, avg_time_check_in_new, avg_time_check_out_new), 0), 108)

---------------------------------------------------------------------

-- Now look at this column, we fixed times and dates in this data.
SELECT 
    avg_time_check_in_new,
    avg_time_check_out_new,
    duration
FROM GymAnalaysis..gym_membership;

-- Here we see how many subscribers with personal training or group lessons.
SELECT abonoment_type, personal_training, attend_group_lesson, COUNT(*) AS the_count
FROM GymAnalaysis..gym_membership
WHERE attend_group_lesson = 1 OR personal_training = 1
GROUP BY abonoment_type, personal_training, attend_group_lesson
ORDER BY abonoment_type;

-- Here we see there are 259 group lessons.
SELECT DISTINCT fav_group_lesson
FROM GymAnalaysis..gym_membership
ORDER BY fav_group_lesson;

-- We can see that the most favourite group is 'XCore' and the most unpopular group is 'Pilates, XCore, Spinning'
SELECT fav_group_lesson, COUNT(*) AS number_of_subscribers
FROM GymAnalaysis..gym_membership
WHERE fav_group_lesson IS NOT NULL
GROUP BY fav_group_lesson
ORDER BY number_of_subscribers DESC;