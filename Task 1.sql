use fda;

/* Determine the number of drugs approved each year and provide insights into the yearly trends.*/
SELECT 
	year(actiondate) as Year, 
    count(actiontype) as "No. of Approvals" 
FROM 
	REGACTIONDATE
WHERE 
	actiontype = "AP" 
GROUP BY
	year(actiondate) 
ORDER BY 
	Year asc;

/*Identify the top three years that got the highest and lowest approvals, in descending and ascending order, respectively.*/
(SELECT 
	year(actiondate) as Year,
    count(actiontype) as "No. of Approvals" 
FROM 
	REGACTIONDATE 
WHERE 
	actiontype = "AP" 
GROUP BY 
	year(actiondate) 
ORDER BY 
	count(actiontype) desc 
LIMIT 3)
UNION
(SELECT 
	year(actiondate) as Year, 
    count(actiontype) as "No. of Approvals" 
FROM 
	REGACTIONDATE 
WHERE 
	actiontype = "AP" 
GROUP BY
	year(actiondate) 
ORDER BY 
	count(actiontype) asc 
LIMIT 3); 

/* Explore approval trends over the years based on sponsors. */

SELECT
	year(Reg.actiondate) as Approval_Year,
    app.sponsorApplicant as sponsor,
    count(Reg.actiontype) as Total_Approval
FROM
	RegActionDate Reg 
JOIN 
	Application app
    on reg.applno = app.applno
where
	app.actiontype = "AP"
GROUP BY
	Approval_Year, sponsor
ORDER BY
	Approval_Year, sponsor;


/* Rank sponsors based on the total number of approvals they received each year between 1939 and 1960. */

SELECT
	year(Reg.actiondate) as Approval_Year,
    sponsorApplicant as Sponsor,
    rank() over (partition by year(Reg.actiondate) order by count(Reg.actiontype) desc) as Sponsor_Rank,
    count(Reg.actiontype) as Total_Approval
FROM
	RegActionDate Reg 
JOIN 
	Application app
    on reg.applno = app.applno
WHERE
	reg.actiontype = "AP" AND year(Reg.actiondate) between 1939 AND 1969
GROUP BY
	Approval_Year, Sponsor
ORDER BY
	Approval_Year, Sponsor_Rank;
    
commit;
	

	
