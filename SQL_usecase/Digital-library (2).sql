create database practice;
use practice;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IssuedBooks (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Books VALUES
(1, 'Java Basics', 'Education'),
(2, 'Python Guide', 'Education'),
(3, 'History of India', 'History'),
(4, 'Fiction Story', 'Fiction');

INSERT INTO Students VALUES
(1, 'Vishnu'),
(2, 'Rahul'),
(3, 'Anu'),
(4, 'Pavi');

INSERT INTO IssuedBooks VALUES
(1, 1, 1, '2024-03-01', NULL),         
(2, 2, 2, '2024-03-10', '2024-03-15'), 
(3, 3, 3, '2024-02-20', NULL),         
(4, 1, 4, '2024-03-05', '2024-03-07'), 
(5, 4, 2, '2020-09-01', NULL);  

SELECT s.name, b.title, i.issue_date
FROM IssuedBooks i
JOIN Students s ON i.student_id = s.student_id
JOIN Books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.issue_date < CURDATE() - INTERVAL 14 DAY;   

SELECT b.category, COUNT(*) AS total_borrows
FROM IssuedBooks i
JOIN Books b ON i.book_id = b.book_id
GROUP BY b.category
ORDER BY total_borrows DESC;

// it shows inactive student
SELECT * FROM Students
WHERE student_id NOT IN (
    SELECT student_id
    FROM IssuedBooks
    WHERE issue_date >= CURDATE() - INTERVAL 3 YEAR
);

DELETE FROM IssuedBooks
WHERE issue_date < CURDATE() - INTERVAL 3 YEAR;

DELETE FROM Students
WHERE student_id NOT IN (
    SELECT DISTINCT student_id FROM IssuedBooks
);


