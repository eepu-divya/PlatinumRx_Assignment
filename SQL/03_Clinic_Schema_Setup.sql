/* SQL script to set up the clinic database schema and insert sample data */

CREATE TABLE clinics (
    cid TEXT PRIMARY KEY,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);


CREATE TABLE customer (
    uid TEXT PRIMARY KEY,
    name TEXT,
    mobile TEXT
);


CREATE TABLE clinic_sales (
    oid TEXT PRIMARY KEY,
    uid TEXT,
    cid TEXT,
    amount REAL,
    datetime TEXT,
    sales_channel TEXT
);


CREATE TABLE expenses (
    eid TEXT PRIMARY KEY,
    cid TEXT,
    description TEXT,
    amount REAL,
    datetime TEXT
);




INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100001', 'XYZ clinic', 'lorem', 'ipsum', 'dolor'),
('cnc-0100002', 'Sunrise Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100003', 'Care Plus Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100004', 'Wellness Care', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100005', 'MediTrust Clinic', 'Bengaluru', 'Karnataka', 'India'),
('cnc-0100006', 'Prime Health', 'Bengaluru', 'Karnataka', 'India'),
('cnc-0100007', 'Arogya Clinic', 'Pune', 'Maharashtra', 'India'),
('cnc-0100008', 'Life Line Clinic', 'Pune', 'Maharashtra', 'India');


INSERT INTO customer (uid, name, mobile) VALUES
('bk-09f3e-95hj', 'Jon Doe', '97XXXXXXXX'),
('bk-09f3e-95hk', 'Asha Reddy', '98XXXXXXXX'),
('bk-09f3e-95hl', 'Rahul Mehta', '99XXXXXXXX'),
('bk-09f3e-95hm', 'Priya Nair', '96XXXXXXXX'),
('bk-09f3e-95hn', 'Karan Singh', '95XXXXXXXX'),
('bk-09f3e-95ho', 'Sneha Patel', '94XXXXXXXX'),
('bk-09f3e-95hp', 'Vikram Rao', '93XXXXXXXX'),
('bk-09f3e-95hq', 'Anjali Iyer', '92XXXXXXXX'),
('bk-09f3e-95hr', 'Meena Verma', '91XXXXXXXX'),
('bk-09f3e-95hs', 'Suresh Kumar', '90XXXXXXXX');


INSERT INTO clinic_sales (oid, uid, cid, amount, datetime, sales_channel) VALUES
('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodat'),
('ord-00100-00101', 'bk-09f3e-95hk', 'cnc-0100002', 18999, '2021-09-25 15:20:10', 'online'),
('ord-00100-00102', 'bk-09f3e-95hl', 'cnc-0100003', 29999, '2021-10-02 11:05:44', 'walk-in'),
('ord-00100-00103', 'bk-09f3e-95hm', 'cnc-0100004', 14999, '2021-10-08 09:45:12', 'referral'),
('ord-00100-00104', 'bk-09f3e-95hn', 'cnc-0100005', 34999, '2021-11-03 14:33:18', 'online'),
('ord-00100-00105', 'bk-09f3e-95ho', 'cnc-0100006', 27999, '2021-11-12 16:12:50', 'walk-in'),
('ord-00100-00106', 'bk-09f3e-95hp', 'cnc-0100007', 21999, '2021-12-01 10:25:30', 'referral'),
('ord-00100-00107', 'bk-09f3e-95hq', 'cnc-0100008', 31999, '2021-12-15 18:55:05', 'sodat'),
('ord-00100-00108', 'bk-09f3e-95hr', 'cnc-0100001', 19999, '2021-09-29 13:17:40', 'online'),
('ord-00100-00109', 'bk-09f3e-95hs', 'cnc-0100002', 25999, '2021-10-20 08:40:25', 'walk-in'),
('ord-00100-00110', 'bk-09f3e-95hj', 'cnc-0100003', 40999, '2021-11-22 12:11:11', 'referral'),
('ord-00100-00111', 'bk-09f3e-95hk', 'cnc-0100004', 22999, '2021-12-28 17:05:42', 'online');


INSERT INTO expenses (eid, cid, description, amount, datetime) VALUES
('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48'),
('exp-0100-00101', 'cnc-0100002', 'sanitizer stock', 1200, '2021-09-25 10:20:10'),
('exp-0100-00102', 'cnc-0100003', 'equipment maintenance', 2300, '2021-10-02 08:30:44'),
('exp-0100-00103', 'cnc-0100004', 'staff refreshment', 650, '2021-10-08 09:15:12'),
('exp-0100-00104', 'cnc-0100005', 'medical gloves', 1800, '2021-11-03 13:25:18'),
('exp-0100-00105', 'cnc-0100006', 'power backup', 900, '2021-11-12 15:00:50'),
('exp-0100-00106', 'cnc-0100007', 'new chairs', 1450, '2021-12-01 10:40:30'),
('exp-0100-00107', 'cnc-0100008', 'software renewal', 2100, '2021-12-15 18:10:05'),
('exp-0100-00108', 'cnc-0100001', 'medicine stock', 750, '2021-09-29 11:05:40'),
('exp-0100-00109', 'cnc-0100002', 'cleaning supplies', 500, '2021-10-20 08:20:25');


SELECT * FROM clinics;
SELECT * FROM customer; 
SELECT * FROM clinic_sales;
SELECT * FROM expenses;