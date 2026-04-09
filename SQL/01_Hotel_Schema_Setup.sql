CREATE TABLE users (
    user_id TEXT,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id TEXT,
    booking_date DATETIME,
    room_no TEXT,
    user_id TEXT
);

CREATE TABLE items (
    item_id TEXT,
    item_name TEXT,
    item_rate REAL
);

CREATE TABLE booking_commercials (
    id TEXT,
    booking_id TEXT,
    bill_id TEXT,
    bill_date DATETIME,
    item_id TEXT,
    item_quantity REAL
);


INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', 'XX, Street Y, ABC City'),
('21wrcxuy-67erfo', 'Jane Smith', '98XXXXXXXX', 'jane.smith@example.com', '12, Green Park, Delhi'),
('21wrcxuy-67erfp', 'Rahul Kumar', '99XXXXXXXX', 'rahul.kumar@example.com', '44, Lake View Road, Chennai'),
('21wrcxuy-67erfq', 'Anjali Sharma', '96XXXXXXXX', 'anjali.sharma@example.com', '18, MG Road, Bengaluru'),
('21wrcxuy-67erfr', 'Vikram Singh', '95XXXXXXXX', 'vikram.singh@example.com', '77, Civil Lines, Jaipur'),
('21wrcxuy-67erfs', 'Priya Patel', '94XXXXXXXX', 'priya.patel@example.com', '5, River Side, Ahmedabad');


INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-09f3e-95hk', '2021-11-05 10:15:22', 'rm-a12k-9pqr', '21wrcxuy-67erfo'),
('bk-09f3e-95hl', '2021-11-18 14:40:10', 'rm-c45m-7stu', '21wrcxuy-67erfp'),
('bk-09f3e-95hm', '2021-10-02 09:05:33', 'rm-d78n-1vwx', '21wrcxuy-67erfq'),
('bk-09f3e-95hn', '2021-10-19 16:30:27', 'rm-e90p-3yz1', '21wrcxuy-67erfr'),
('bk-09f3e-95ho', '2021-11-25 12:55:08', 'rm-f11q-5abc', '21wrcxuy-67erfs'),
('bk-09f3e-95hp', '2021-12-12 18:20:45', 'rm-g22r-7def', '21wrcxuy-67erfn');


INSERT INTO items (item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-a07vh-aer8', 'Mix Veg', 89),
('itm-w978-23u4', 'Paneer Butter Masala', 149),
('itm-p456-12xy', 'Veg Biryani', 120),
('itm-k789-45mn', 'Dal Tadka', 95),
('itm-r234-67pq', 'Butter Naan', 25),
('itm-s567-89rs', 'Gulab Jamun', 40),
('itm-t890-12tu', 'Masala Dosa', 75);

INSERT INTO booking_commercials (id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES
('bc-001', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('bc-002', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('bc-003', 'bk-09f3e-95hk', 'bl-nov-1001', '2021-11-05 10:20:11', 'itm-w978-23u4', 4),
('bc-004', 'bk-09f3e-95hk', 'bl-nov-1001', '2021-11-05 10:20:11', 'itm-p456-12xy', 3),
('bc-005', 'bk-09f3e-95hk', 'bl-nov-1001', '2021-11-05 10:20:11', 'itm-a07vh-aer8', 2),
('bc-006', 'bk-09f3e-95hl', 'bl-nov-1002', '2021-11-18 14:45:30', 'itm-k789-45mn', 5),
('bc-007', 'bk-09f3e-95hl', 'bl-nov-1002', '2021-11-18 14:45:30', 'itm-r234-67pq', 8),
('bc-008', 'bk-09f3e-95hl', 'bl-nov-1002', '2021-11-18 14:45:30', 'itm-s567-89rs', 2),
('bc-009', 'bk-09f3e-95hm', 'bl-oct-1001', '2021-10-02 09:10:12', 'itm-w978-23u4', 4),
('bc-010', 'bk-09f3e-95hm', 'bl-oct-1001', '2021-10-02 09:10:12', 'itm-p456-12xy', 3),
('bc-011', 'bk-09f3e-95hm', 'bl-oct-1001', '2021-10-02 09:10:12', 'itm-a07vh-aer8', 2),
('bc-012', 'bk-09f3e-95hn', 'bl-oct-1002', '2021-10-19 16:35:41', 'itm-w978-23u4', 5),
('bc-013', 'bk-09f3e-95hn', 'bl-oct-1002', '2021-10-19 16:35:41', 'itm-p456-12xy', 2),
('bc-014', 'bk-09f3e-95ho', 'bl-nov-1003', '2021-11-25 12:59:19', 'itm-a9e8-q8fu', 6),
('bc-015', 'bk-09f3e-95ho', 'bl-nov-1003', '2021-11-25 12:59:19', 'itm-t890-12tu', 4),
('bc-016', 'bk-09f3e-95hp', 'bl-dec-1001', '2021-12-12 18:25:55', 'itm-a07vh-aer8', 2),
('bc-017', 'bk-09f3e-95hp', 'bl-dec-1001', '2021-12-12 18:25:55', 'itm-r234-67pq', 3);


SELECT * FROM users;
SELECT * FROM bookings;
SELECT * FROM items;
SELECT * FROM booking_commercials;