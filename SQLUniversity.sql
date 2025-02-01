
CREATE TABLE Program (
    programId INT PRIMARY KEY, 
    programName VARCHAR(100) NOT NULL, 
    commencementYear INT NOT NULL, 
    totalCreditPoints INT NOT NULL
);

CREATE TABLE Student (
    studentId INT PRIMARY KEY,
    programId INT, 
    firstName VARCHAR(100) NOT NULL, 
    lastName VARCHAR(100) NOT NULL, 
    birthDate DATE, 
    FOREIGN KEY (programId) REFERENCES Program(programId)
);
CREATE TABLE Course (
    courseId INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL, 
    creditPoints INT NOT NULL, 
    commencementYear INT NOT NULL
);

CREATE TABLE studentCourse (
    mark INT,
    grade CHAR(1),
    enrollmentYear INT,
    semester INT, 
    studentId INT,
    courseId INT,
    PRIMARY KEY (studentId, courseId),
    FOREIGN KEY (studentId) REFERENCES Student(studentId),
    FOREIGN KEY (courseId) REFERENCES Course(courseId)
);

CREATE TABLE programCourse (
    programId INT,
    courseId INT PRIMARY KEY,
    year INT,
    semester INT,
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    FOREIGN KEY (programId) REFERENCES Program(programId)
);
INSERT INTO Program (programId, programName, commencementYear, totalCreditPoints) VALUES
(1, 'Engineering', 2025, 120),
(2, 'Science', 2025, 100),
(3, 'Arts', 2025, 80),
(4, 'Commerce', 2025, 90);
INSERT INTO Student (studentId, programId, firstName, lastName, birthDate) VALUES
(1, 1, 'John', 'Doe', '2000-01-15'),
(2, 2, 'Jane', 'Smith', '2001-02-20'),
(3, 3, 'Mike', 'Johnson', '2000-03-25'),
(4, 4, 'Emily', 'Davis', '1999-04-30');
INSERT INTO Course (courseId, courseName, creditPoints, commencementYear) VALUES
(1, 'Mathematics', 4, 2025),
(2, 'Physics', 3, 2025),
(3, 'Chemistry', 4, 2025),
(4, 'Biology', 4, 2025);
INSERT INTO studentCourse (mark, grade, enrollmentYear, semester, studentId, courseId) VALUES
(85, 'B', 2025, 1, 1, 1),
(90, 'A', 2025, 2, 2, 2),
(78, 'C', 2025, 1, 3, 3),
(88, 'B', 2025, 2, 4, 4);
INSERT INTO programCourse (programId, courseId, year, semester) VALUES
(1, 1, 2025, 1),
(2, 2, 2025, 2),
(3, 3, 2025, 1),
(4, 4, 2025, 2);

SELECT 
    p.programName AS program_name, 
    COUNT(s.studentId) AS student_count
FROM 
    Program p
LEFT JOIN 
    Student s ON p.programId = s.programId
GROUP BY 
    p.programName;

SELECT 
    p.programName AS program_name, 
    c.courseName AS course_name, 
    pc.year, 
    pc.semester
FROM 
    programCourse pc
JOIN 
    Program p ON pc.programId = p.programId
JOIN 
    Course c ON pc.courseId = c.courseId;

UPDATE Program
SET totalCreditPoints = 130
WHERE programName = 'Engineering';

UPDATE studentCourse
SET grade = 'A'
WHERE studentId = 1 AND courseId = 1;



