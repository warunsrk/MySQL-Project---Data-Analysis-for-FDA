/*
Task 4: Exploring Therapeutic Classes and Approval Trends
1. Analyze drug approvals based on therapeutic evaluation code (TE_Code).*/

SELECT
	product.TECode as TE_Code,
    count(product.ApplNo) as Total_Approval
FROM
	product
JOIN
	application app
ON
	product.ApplNo = app.ApplNo
WHERE
	app.actiontype = "AP"
GROUP BY
	TE_CODE
ORDER BY
	TE_CODE;

/*
2. Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in each year.*/

SELECT
	year(reg.actiondate) as App_Year,
    product.TECode as TE_Code,
    count(product.ApplNo) as Total_Approval
FROM
	product
JOIN
	regactiondate reg
ON
	product.ApplNo = reg.ApplNo
WHERE
	reg.actiontype = "AP"
GROUP BY
	App_Year, TE_CODE
ORDER BY
	App_Year, Total_Approval desc;