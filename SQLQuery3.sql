--Find all Students  with FirstName = Antonio

SELECT *
FROM dbo.Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT * 
FROM dbo.Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * 
FROM dbo.Student
WHERE LastName like 'J%'  and EnrolledDate BETWEEN '1998-01-01' AND '1998-01-31'

--List all Students ordered  by FirstName

SELECT *
FROM dbo.Student
ORDER BY FirstName ASC

-- List all Teacher  Last Names and Student Last Names in single result set. 
-- REMOVE DUPLICATES

SELECT LastName 
FROM dbo.Student  
UNION 
SELECT LastName
FROM dbo.Teacher

-- Create  Foreign key constraints  from diagram or with script

ALTER TABLE dbo.Grade WITH CHECK
ADD CONSTRAINT [FK_StudentId]
FOREIGN KEY (StudentId)
REFERENCES dbo.Student (Id)

ALTER TABLE dbo.Grade WITH CHECK
ADD CONSTRAINT [FK_TeacherId]
FOREIGN KEY (TeacherId)
REFERENCES dbo.Teacher (Id)

-- List all possible combinations of Courses names and AchivementType names that can be passed by student
SELECT c.Name as CourseName , at.Name as AchievementName
FROM dbo.Course c
cross join dbo.AchievementType at


--List all Teachers , without exam Grade

SELECT FirstName ,LastName
FROM dbo.Teacher as t
LEFT JOIN dbo.Grade as g
ON t.Id = g.TeacherID
WHERE g.TeacherID is NULL













