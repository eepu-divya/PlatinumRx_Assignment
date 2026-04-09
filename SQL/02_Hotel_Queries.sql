/* For every user in the system, get the user_id and last booked room_no */

SELECT user_id, room_no
FROM bookings b
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings
    WHERE user_id = b.user_id
);


/* Get booking_id and total billing amount of every booking created in November, 2021 */

SELECT bc.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', bc.bill_date) = '11'
  AND strftime('%Y', bc.bill_date) = '2021'
GROUP BY bc.booking_id;


/* Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000 */

SELECT bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', bc.bill_date) = '10'
  AND strftime('%Y', bc.bill_date) = '2021'
GROUP BY bill_id
HAVING bill_amount > 1000;


/* Determine the most ordered and least ordered item of each month of year 2021 */

SELECT month, item_name, total_qty,
RANK() OVER (PARTITION BY month ORDER BY total_qty DESC) AS rnk_max,
RANK() OVER (PARTITION BY month ORDER BY total_qty ASC) AS rnk_min
FROM (
    SELECT strftime('%m', bc.bill_date) AS month,
           i.item_name,
           SUM(bc.item_quantity) AS total_qty
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY month, i.item_name
);


/* Find the customers with the second highest bill value of each month of year 2021 */

SELECT *
FROM (
    SELECT strftime('%m', bill_date) AS month,
           bill_id,
           SUM(item_quantity * item_rate) AS total,
           RANK() OVER (PARTITION BY strftime('%m', bill_date) ORDER BY SUM(item_quantity * item_rate) DESC) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY month, bill_id
)
WHERE rnk = 2;


