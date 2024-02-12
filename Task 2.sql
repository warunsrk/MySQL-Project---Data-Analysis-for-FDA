/* Task 2: Segmentation Analysis Based on Drug MarketingStatus
	
1. Group products based on MarketingStatus. Provide meaningful insights into the segmentation patterns. */

select * from product;

SELECT 
	productmktstatus Market_Status,
	count(drugname) as No_of_Drug
FROM
	product
GROUP BY
	Market_Status
ORDER BY
	Market_Status;

/*
2. Calculate the total number of applications for each MarketingStatus year-wise after the year 2010. */

SELECT 
	year(reg.actiondate) as App_Year,
    product.productmktstatus Market_Status,
    count(product.ApplNo) as No_of_App
FROM
	product
JOIN
	regactiondate reg
ON
	product.ApplNo = reg.ApplNo
WHERE
	year(reg.actiondate) > 2010
GROUP BY
	App_Year, Market_Status
ORDER BY
	App_Year, Market_Status;

/*
3. Identify the top MarketingStatus with the maximum number of applications and analyze its trend over time. */

SELECT 
	product.productmktstatus Market_Status,
    year(reg.actiondate) as App_Year,
    count(product.ApplNo) as Total_App
FROM
	product
JOIN
	regactiondate reg
ON
	product.ApplNo = reg.ApplNo
GROUP BY
	Market_Status, App_Year
ORDER BY
	Market_Status, Total_App desc;