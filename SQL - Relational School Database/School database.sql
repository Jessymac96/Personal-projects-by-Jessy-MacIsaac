-- Select each table
SELECT * FROM Students;
SELECT * FROM Marks;
SELECT * FROM Subjects;
SELECT * FROM Teachers;


-- 1. List all the students, subjects, marks, and teacher
SELECT S.FirstName, S.LastName, SJ.SubjectName, M.MarkObtained, T.FirstName AS TeacherFirstName, T.LastName AS TeacherLastName
FROM Students AS S
JOIN Marks AS M ON S.StudentID = M.StudentID
JOIN Subjects AS SJ ON M.SubjectID = SJ.SubjectID
JOIN Teachers AS T ON M.TeacherID = T.TeacherID;


-- 2. From highest to lowest, what is the average mark for all courses
SELECT SJ.SubjectName, ROUND(AVG(M.MarkObtained), 2) AS AverageMark
FROM Marks AS M
JOIN Subjects AS SJ ON M.SubjectID = SJ.SubjectID
GROUP BY SJ.SubjectName
ORDER BY AverageMark DESC;


-- 3. Combining 1 and 2 to list all student names, subject, mark and average mark 
SELECT S.FirstName, S.LastName, SJ.SubjectName, M.MarkObtained, AVG_Marks.AverageMark AS ClassAverageMark
FROM Students AS S
JOIN Marks AS M ON S.StudentID = M.StudentID
JOIN Subjects AS SJ ON M.SubjectID = SJ.SubjectID
JOIN ( SELECT SJ.SubjectID, ROUND(AVG(M.MarkObtained), 0) AS AverageMark
		FROM Marks AS M 
		JOIN Subjects AS SJ ON M.SubjectID = SJ.SubjectID
		GROUP BY SJ.SubjectID) AS AVG_Marks ON SJ.SubjectID = AVG_Marks.SubjectID
ORDER BY S.FirstName, S.LastName, SJ.SubjectName;


-- 4. From highest to lowest, what is the average mark for all courses by each student
SELECT S.FirstName, S.LastName, ROUND(AVG(M.MarkObtained), 2) AS AverageMark
FROM Students AS S
JOIN Marks AS M ON S.StudentID = M.StudentID
GROUP BY S.FirstName, S.LastName
ORDER BY AverageMark DESC;


-- 5. From highest to lowest, what is the mark from each student taking Swahili class
SELECT DISTINCT S.FirstName, S.LastName, M.MarkObtained
FROM Students AS S
JOIN Marks AS M ON S.StudentID = M.StudentID
JOIN Subjects AS SJ ON M.SubjectID = SJ.SubjectID
WHERE SJ.SubjectName = 'Swahili'
ORDER BY MarkObtained DESC;


-- 6. Average mark from students born in 1997, 1998, and 1999
SELECT YEAR(DateOfBirth) AS BirthYear, ROUND(AVG(M.MarkObtained), 2) AS AverageMark
FROM Students AS S
JOIN Marks AS M ON S.StudentID = M.StudentID
WHERE YEAR(DateOfBirth) IN (1997, 1998, 1999)
GROUP BY YEAR(DateOfBirth);


-- 7. which students and teachers where born in Kenya
SELECT S.FirstName, S.LastName, Address
FROM Students as S
WHERE Address like '%Kenya'
UNION
SELECT T.FirstName, T.LastName, Address
FROM Teachers as T
WHERE Address like '%Kenya';


-- 8. Select all teachers who doesn't teach english 
SELECT T.FirstName, T.LastName
FROM Teachers as T
WHERE TeacherID NOT IN (SELECT SubjectID FROM subjects WHERE SubjectName LIKE 'English')
ORDER BY T.FirstName, T.LastName
