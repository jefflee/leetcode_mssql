-- https://leetcode.com/problems/reformat-department-table/

-- Table

CREATE TABLE [dbo].[Department](
	[id] [int] NOT NULL,
	[revenue] [int] NOT NULL,
	[month] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Data
INSERT [dbo].[Department] (id, revenue,[month])
    VALUES (1,8000,'Jan')
		  , (2, 9000, 'Jan')
		  , (3, 10000, 'Feb')
		  , (1, 7000, 'Feb')
		  , (1, 6000, 'Mar')

-- Solution 1
SELECT id
    , Jan AS 'Jan_revenue'
    , Feb AS 'Feb_revenue'
    , Mar AS 'Mar_revenue'
    , Apr AS 'Apr_revenue'
    , May AS 'May_revenue'
    , Jun AS 'Jun_revenue'
    , Jul AS 'Jul_revenue'
    , Aug AS 'Aug_revenue'
    , Sep AS 'Sep_revenue'
    , Oct AS 'Oct_revenue'
    , Nov AS 'Nov_revenue'
    , [Dec] AS 'Dec_revenue'
FROM (
    SELECT * FROM dbo.Department
) t
PIVOT (
    Sum(revenue)
    FOR [month] IN (Jan,Feb,Mar,Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
) p;

-- Solution 2

SELECT ID,
sum(case when month ='Jan' then revenue else NULL end) Jan_Revenue,
sum(case when month ='Feb' then revenue else NULL end) Feb_Revenue,
sum(case when month ='Mar' then revenue else NULL end) Mar_Revenue,
sum(case when month ='Apr' then revenue else NULL end) Apr_Revenue,
sum(case when month ='May' then revenue else NULL end) May_Revenue,
sum(case when month ='Jun' then revenue else NULL end) Jun_Revenue,
sum(case when month ='Jul' then revenue else NULL end) Jul_Revenue,
sum(case when month ='Aug' then revenue else NULL end) Aug_Revenue,
sum(case when month ='Sep' then revenue else NULL end) Sep_Revenue,
sum(case when month ='Oct' then revenue else NULL end) Oct_Revenue,
sum(case when month ='Nov' then revenue else NULL end) Nov_Revenue,
sum(case when month ='Dec' then revenue else NULL end) Dec_Revenue
FROM DEPARTMENT
GROUP BY ID;



