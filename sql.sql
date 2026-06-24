CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

INSERT INTO Users (full_name, email, city, registration_date)
VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2024-12-01'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2024-12-05'),
('Charlie Lee', 'charlie@example.com', 'Chicago', '2024-12-10'),
('Diana King', 'diana@example.com', 'New York', '2025-01-15'),
('Ethan Hunt', 'ethan@example.com', 'Los Angeles', '2025-02-01');


CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming','completed','cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

INSERT INTO Events (title, description, city, start_date, end_date, status, organizer_id)
VALUES
('Tech Innovators Meetup', 'A meetup for tech enthusiasts.', 'New York',
 '2025-06-10 100000', '2025-06-10 160000', 'upcoming', 1),
('AI & ML Conference', 'Conference on AI and ML advancements.', 'Chicago',
 '2025-05-15 090000', '2025-05-15 170000', 'completed', 3),
('Frontend Development Bootcamp', 'Hands-on training on frontend tech.', 'Los Angeles',
 '2025-07-01 100000', '2025-07-03 160000', 'upcoming', 2);

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time)
VALUES
(1, 'Opening Keynote', 'Dr. Tech', '2025-06-10 100000', '2025-06-10 110000'),
(1, 'Future of Web Dev', 'Alice Johnson', '2025-06-10 111500', '2025-06-10 123000'),
(2, 'AI in Healthcare', 'Charlie Lee', '2025-05-15 093000', '2025-05-15 110000'),
(3, 'Intro to HTML5', 'Bob Smith', '2025-07-01 100000', '2025-07-01 120000');

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Registrations (user_id, event_id, registration_date)
VALUES
(1, 1, '2025-05-01'),
(2, 1, '2025-05-02'),
(3, 2, '2025-04-30'),
(4, 2, '2025-04-28'),
(5, 3, '2025-06-15');

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Feedback (user_id, event_id, rating, comments, feedback_date)
VALUES
(3, 2, 4, 'Great insights!', '2025-05-16'),
(4, 2, 5, 'Very informative.', '2025-05-16'),
(2, 1, 3, 'Could be better.', '2025-06-11');

CREATE TABLE Resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    resource_type ENUM('pdf','image','link'),
    resource_url VARCHAR(255) NOT NULL,
    uploaded_at DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

INSERT INTO Resources (event_id, resource_type, resource_url, uploaded_at)
VALUES
(1, 'pdf', 'httpsportal.comresourcestech_meetup_agenda.pdf', '2025-05-01 100000'),
(2, 'image', 'httpsportal.comresourcesai_poster.jpg', '2025-04-20 090000'),
(3, 'link', 'httpsportal.comresourceshtml5_docs', '2025-06-25 150000');

#ANSWERS
#1
SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND u.city = e.city
ORDER BY e.start_date;
#2
SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND u.city = e.city
ORDER BY e.start_date;
#3
SELECT u.full_name
FROM Users u
WHERE u.user_id NOT IN (
    SELECT user_id FROM Registrations
    WHERE registration_date = CURDATE() - INTERVAL 90 DAY
);
#4
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '100000' AND '120000'
GROUP BY e.event_id;
#5
SELECT u.city, COUNT(DISTINCT r.user_id) AS total_users
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_users DESC
LIMIT 5;

#6
SELECT e.title,
       SUM(resource_type='pdf') AS pdf_count,
       SUM(resource_type='image') AS image_count,
       SUM(resource_type='link') AS link_count
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id;

#7
SELECT u.full_name, f.comments, e.title
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating  3;

#8
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id;

#9
SELECT u.full_name, e.status, COUNT(e.event_id) AS event_count
FROM Users u
JOIN Events e ON u.user_id = e.organizer_id
GROUP BY u.user_id, e.status;

#10
SELECT u.full_name, e.status, COUNT(e.event_id) AS event_count
FROM Users u
JOIN Events e ON u.user_id = e.organizer_id
GROUP BY u.user_id, e.status;

#11
SELECT registration_date, COUNT(user_id) AS new_users
FROM Users
WHERE registration_date = CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

#12
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id
ORDER BY session_count DESC
LIMIT 1;

#13
SELECT e.city, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.city;

#14
SELECT e.title, COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_id
ORDER BY total_registrations DESC
LIMIT 3;

#15
SELECT s1.event_id, s1.title AS session1, s2.title AS session2
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id = s2.event_id
AND s1.session_id  s2.session_id
WHERE s1.start_time  s2.end_time
AND s2.start_time  s1.end_time;

#16
SELECT u.full_name
FROM Users u
WHERE u.registration_date = CURDATE() - INTERVAL 30 DAY
AND u.user_id NOT IN (SELECT user_id FROM Registrations);

#17
SELECT speaker_name, COUNT(session_id) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(session_id)  1;

#18
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;

#19
SELECT e.title, COUNT(r.registration_id) AS total_registrations,
       AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

#20
SELECT u.full_name,
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(f.feedback_id) AS feedbacks_given
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;
#21
SELECT u.full_name, COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC
LIMIT 5;

#22
SELECT user_id, event_id, COUNT() AS duplicate_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT()  1;

#23
SELECT DATE_FORMAT(registration_date, '%Y-%m') AS month,
       COUNT() AS registrations
FROM Registrations
WHERE registration_date = CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;

#24
SELECT e.title, AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS avg_duration
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id;

#25
SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
