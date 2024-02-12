/*
Task 3: Analyzing Products
1. Categorize Products by dosage form and analyze their distribution. */

SELECT 
	form as Dosage_Form,
	count(applno) as No_of_Form
FROM
	product
GROUP BY
	Dosage_Form
ORDER BY
	Dosage_Form;

/*
2. Calculate the total number of approvals for each dosage form and identify the most successful forms.*/

SELECT
	product.form as Dosage_Form,
    count(app.applno) as Total_Approval
FROM
	product
JOIN
	application app
ON
	product.ApplNo = app.ApplNo
WHERE
	app.actiontype = "AP"
GROUP BY
	Dosage_Form
ORDER BY
	Total_Approval desc;

/*
Investigate yearly trends related to successful forms.*/

SELECT
	year(reg.actiondate) as Reg_Year,
	product.form as Dosage_Form,
    count(product.applno) as Total_Approval
FROM
	product
JOIN
	regactiondate reg
ON
	product.ApplNo = reg.ApplNo
WHERE
	reg.actiontype = "AP"
GROUP BY
	Reg_Year, Dosage_Form
ORDER BY
	Reg_Year, Total_Approval desc;

