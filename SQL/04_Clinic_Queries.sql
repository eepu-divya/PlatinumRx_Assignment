SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;


SELECT 
    cs.uid,
    c.name,
    SUM(cs.amount) AS total_spent
FROM clinic_sales cs
JOIN customer c ON cs.uid = c.uid
WHERE strftime('%Y', cs.datetime) = '2021'
GROUP BY cs.uid, c.name
ORDER BY total_spent DESC
LIMIT 10;


WITH revenue AS (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
),
expense AS (
    SELECT 
        strftime('%m', datetime) AS month,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
)

SELECT 
    r.month,
    r.total_revenue,
    IFNULL(e.total_expense, 0) AS total_expense,
    (r.total_revenue - IFNULL(e.total_expense, 0)) AS profit,
    CASE 
        WHEN (r.total_revenue - IFNULL(e.total_expense, 0)) > 0 
        THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM revenue r
LEFT JOIN expense e ON r.month = e.month;



WITH clinic_profit AS (
    SELECT 
        c.cid,
        c.clinic_name,
        c.city,
        SUM(cs.amount) - IFNULL(SUM(e.amount), 0) AS profit
    FROM clinics c
    LEFT JOIN clinic_sales cs 
        ON c.cid = cs.cid 
        AND strftime('%m', cs.datetime) = '09'
    LEFT JOIN expenses e 
        ON c.cid = e.cid 
        AND strftime('%m', e.datetime) = '09'
    GROUP BY c.cid, c.clinic_name, c.city
)

SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS rnk
    FROM clinic_profit
)
WHERE rnk = 1;



WITH revenue AS (
    SELECT 
        cid,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE strftime('%m', datetime) = '09'
    GROUP BY cid
),
expense AS (
    SELECT 
        cid,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE strftime('%m', datetime) = '09'
    GROUP BY cid
),
clinic_profit AS (
    SELECT 
        c.cid,
        c.clinic_name,
        c.state,
        IFNULL(r.total_revenue, 0) - IFNULL(e.total_expense, 0) AS profit
    FROM clinics c
    LEFT JOIN revenue r ON c.cid = r.cid
    LEFT JOIN expense e ON c.cid = e.cid
)

SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rnk
    FROM clinic_profit
)
WHERE rnk = 2;

