-- CREATE DATABASE digital_library;
USE digital_library;
CREATE TABLE IF NOT EXISTS Books(
	id int PRIMARY KEY,
    book_name varchar(50),
    author varchar(30),
    publishing_year int,
    category varchar(10),
    publishing_house varchar(20)
);


CREATE TABLE IF NOT EXISTS Students(
	reg_id int PRIMARY KEY,
    student_name varchar(40),
    branch varchar(20),
    course_name varchar(20),
    year_of_admission int
    

);

CREATE TABLE IF NOT EXISTS IssuedBooks(
		booking_id int PRIMARY KEY,
        issue_date date,
        return_date date,
        id int,
        reg_id int,
        FOREIGN KEY (id) REFERENCES Books(id), 
        FOREIGN KEY (reg_id) REFERENCES Students(reg_id)
);

SHOW TABLES;
DESC students;
DESC ISSUEDBOOKS;
DESC BOOKS;

-- INSERT INTO Books VALUES (1, 'The Alchemist', 'Paulo Coelho', 1988, 'Fiction', 'Harper');

-- INSERT INTO Books VALUES (2, 'Clean Code', 'Robert Martin', 2008, 'Tech', 'Prentice Hall');

-- INSERT INTO Books VALUES (3, '1984', 'George Orwell', 1949, 'Fiction', 'Penguin');

-- INSERT INTO Books VALUES (4, 'Data Science 101', 'John Smith', 2019, 'Tech', 'OReilly');

-- INSERT INTO Books VALUES (5, 'Wings of Fire', 'A P J Abdul Kalam', 1999, 'Biography', 'Universities');

-- INSERT INTO Books VALUES (6, 'The Hobbit', 'J R R Tolkien', 1937, 'Fantasy', 'Allen');

-- INSERT INTO Books VALUES (7, 'Python Crash', 'Eric Matthes', 2015, 'Tech', 'NoStarch');

-- INSERT INTO Books VALUES (8, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 1997, 'Finance', 'Plata');

-- INSERT INTO Books VALUES (9, 'Hamlet', 'William Shakespeare', 1603, 'Drama', 'Oxford');

-- INSERT INTO Books VALUES (10, 'Atomic Habits', 'James Clear', 2018, 'SelfHelp', 'Penguin');

-- ALTER TABLE Students
-- RENAME COLUMN year_of_admisiion TO year_of_admission;

-- INSERT INTO Students VALUES (101, 'Aarav Sharma', 'CSE', 'BTech', 2022);

-- INSERT INTO Students VALUES (102, 'Priya Verma', 'ECE', 'BTech', 2021);

-- INSERT INTO Students VALUES (103, 'Rohan Mehta', 'Mechanical', 'BTech', 2020);

-- INSERT INTO Students VALUES (104, 'Sneha Kapoor', 'CSE', 'BTech', 2023);

-- INSERT INTO Students VALUES (105, 'Arjun Nair', 'Civil', 'BTech', 2021);

-- INSERT INTO Students VALUES (106, 'Neha Singh', 'IT', 'BTech', 2022);

-- INSERT INTO Students VALUES (107, 'Rahul Chatterjee', 'EEE', 'BTech', 2020);

-- INSERT INTO Students VALUES (108, 'Ishita Patel', 'CSE', 'BTech', 2023);

-- INSERT INTO Students VALUES (109, 'Karan Malhotra', 'ECE', 'BTech', 2021);

-- INSERT INTO Students VALUES (110, 'Meera Joshi', 'IT', 'BTech', 2022);

-- INSERT INTO Students VALUES (111, 'Aditya Rao', 'Mechanical', 'BTech', 2020);

-- INSERT INTO Students VALUES (112, 'Fatima Khan', 'Civil', 'BTech', 2023);

-- INSERT INTO Students VALUES (113, 'Daniel Smith', 'CSE', 'BTech', 2021);

-- INSERT INTO Students VALUES (114, 'Ayesha Siddiqui', 'ECE', 'BTech', 2022);

-- INSERT INTO Students VALUES (115, 'Liam Carter', 'IT', 'BTech', 2023);


-- INSERT INTO IssuedBooks VALUES (1001, '2026-04-01', '2026-04-10', 1, 101);

-- INSERT INTO IssuedBooks VALUES (1002, '2026-04-02', '2026-04-11', 2, 102);

-- INSERT INTO IssuedBooks VALUES (1003, '2026-04-03', '2026-04-12', 3, 103);

-- INSERT INTO IssuedBooks VALUES (1004, '2026-04-04', '2026-04-13', 4, 104);

-- INSERT INTO IssuedBooks VALUES (1005, '2026-04-05', '2026-04-14', 5, 105);

-- INSERT INTO IssuedBooks VALUES (1006, '2026-04-06', '2026-04-15', 6, 106);

-- INSERT INTO IssuedBooks VALUES (1007, '2026-04-07', '2026-04-16', 7, 107);

-- INSERT INTO IssuedBooks VALUES (1008, '2026-04-08', '2026-04-17', 8, 108);

-- INSERT INTO IssuedBooks VALUES (1009, '2026-04-09', '2026-04-18', 9, 109);

-- INSERT INTO IssuedBooks VALUES (1010, '2026-04-10', '2026-04-19', 10, 110);

--  INSERT INTO IssuedBooks VALUES (1011, '2026-04-01', NULL, 1, 101);

-- SELECT * FROM BOOKS;
-- SELECT * FROM STUDENTS;
-- SELECT * FROM ISSUEDBOOKS;


#TO FIND STUDENTS WHO HAVENT RETURNED BOOK IN 14 DAYS


SELECT STUDENTS.student_name FROM
ISSUEDBOOKS JOIN STUDENTS
ON STUDENTS.reg_id = ISSUEDBOOKS.reg_id
WHERE DATEDIFF(DAYS,ISSUEDBOOKS.issue_date,NOW())>=14 AND ISSUEDBOOKS.return_date IS NULL;


#TO FIND WHICH GENRE IS BORROWED MOST

SELECT BOOKS.category,COUNT(*) 
FROM BOOKS JOIN ISSUEDBOOKS
ON BOOKS.id = ISSUEDBOOKS.id
GROUP BY BOOKS.category;

#TO REMOVE STUDENTS WHO HAVENT BORROWED IN MORE THAN 3 YEARS

-- DELETE FROM STUDENTS
-- WHERE STUDENTS.reg_id IN


SELECT STUDENTS.reg_id, STUDENTS.student_name FROM
STUDENTS JOIN ISSUEDBOOKS
ON STUDENTS.reg_id = ISSUEDBOOKS.reg_id
WHERE DATEDIFF(YEAR,	
