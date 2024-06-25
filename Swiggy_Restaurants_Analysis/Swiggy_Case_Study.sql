-- =========================================  Swiggy Restaurants Data Analysis Case Study  ===============================================

-- Adding Surrogate Key since there is no column to use as a primary key
ALTER TABLE swiggy ADD sr_no INT AUTO_INCREMENT FIRST, ADD PRIMARY KEY (sr_no);

-- Renaming Column Name to Avoid Conflicts
ALTER TABLE swiggy CHANGE `Avg ratings` `Avg_ratings` DECIMAL(2,1) DEFAULT NULL;


-- // Q1. Which are the top 5 highest-rated restaurants in Mumbai?
SELECT Restaurant,Avg_ratings,Total_ratings 
FROM swiggy WHERE Total_ratings > (SELECT AVG(Total_ratings) FROM swiggy WHERE city = "Mumbai" ) -- Considering only restaurants having no. of rating more than avg Rating 
ORDER BY Avg_ratings DESC 
LIMIT 5;


-- // Q2. What is the most common type of food offered by restaurants?
SELECT Food_type, COUNT(*) as Count 
FROM swiggy 
GROUP BY Food_type 
ORDER BY Count DESC 
LIMIT 3;

-- // Q3. What is the average price of meals in restaurants located in Koramangala Area?
SELECT AVG(Price) AS Avg_price_Koramangala
FROM swiggy 
WHERE Area = "Koramangala";

-- // Q4.  How many restaurants have a delivery time of less than 30 minutes?
SELECT COUNT(*) 
FROM swiggy 
WHERE Delivery_time < 30;

-- // Q5. Total Number of Ratings per Area?
SELECT Area, SUM(Total_ratings) AS Rating_Count 
FROM swiggy 
GROUP BY Area 
ORDER BY Rating_Count DESC;

-- // Q6. Which is the most expensive restaurant in each City?
SELECT city, max(price) AS max_price 
FROM swiggy 
GROUP BY city 
ORDER BY max_price DESC;

-- // Q7. How many restaurants are there in each Area?
SELECT Area, COUNT(*) AS total_rest 
FROM swiggy 
GROUP BY Area 
ORDER BY Area,total_rest DESC;

-- // Q8. Which restaurants offer more than three types of food?
SELECT Restaurant, Food_type
FROM swiggy
WHERE LENGTH(Food_type) - LENGTH(REPLACE(Food_type, ',', '')) > 2;

-- // Q9. Which restaurants have Maximum Avg_Rating and Minimum Price in each City?
SELECT Restaurant,City, MAX(Avg_ratings) AS max_rating, MIN(Price) AS min_price 
FROM swiggy
GROUP BY city 
ORDER BY max_rating DESC,min_price;

 



