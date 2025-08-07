USE student_managment;

-- Database Setup
CREATE TABLE Students (
    student_id INT auto_increment PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    math_score INT CHECK (math_score BETWEEN 0 AND 100),
    science_score INT CHECK (science_score BETWEEN 0 AND 100),
    english_score INT CHECK (english_score BETWEEN 0 AND 100),
    total_score INT 
);

-- inserting data
INSERT INTO Students (name, math_score, science_score, english_score) VALUES
('Alice Johnson', 85, 90, 88),
('Brian Smith', 78, 75, 80),
('Carla Gomez', 92, 89, 95),
('David Lee', 66, 70, 72),
('Emily Chen', 88, 91, 86),
('Farhan Malik', 73, 68, 74),
('Grace Kim', 95, 97, 94),
('Hassan Ali', 81, 83, 79),
('Isabella Brown', 90, 85, 87),
('Jack Wilson', 60, 65, 62);

select * from students;

SELECT student_id, name, total_score
FROM (
    SELECT 
        student_id,
        name,
        math_score + science_score + english_score AS total_score
    FROM students
) AS score_summary;

SELECT student_id, name, total_score
FROM (
    SELECT 
        student_id,
        name,
        math_score + science_score + english_score AS total_score
    FROM students
) AS score_summary
ORDER BY total_score DESC
limit 5;

--  Average score of students who scored above 70 in Math
SELECT AVG(math_score) AS avg_math_score_above_70
FROM (
    SELECT math_score
    FROM students
    WHERE math_score > 70
) AS filtered_math_scores;

-- Average total score of students scoring between 200 and 250
SELECT AVG(total_score) AS avg_total_score_in_range
FROM (
    SELECT 
        student_id,
        name,
        (math_score + science_score + english_score) AS total_score
    FROM students
) AS score_summary
WHERE total_score BETWEEN 200 AND 250;


-- Find Second-Highest Math Scores
SELECT MAX(math_score) AS second_highest_math_score
FROM students
WHERE math_score < (
    SELECT MAX(math_score)
    FROM students
);
