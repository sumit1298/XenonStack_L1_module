-- queries.sql

-- Query 1: Print the names of professors who work in departments that have fewer than 50 PhD students.
SELECT DISTINCT prof.pname
FROM prof
JOIN dept ON prof.dname = dept.dname
WHERE dept.numphds < 50;

-- Query 2: Print the names of the students with the lowest GPA.
SELECT sname
FROM student
WHERE gpa = (SELECT MIN(gpa) FROM student);

-- Query 3: For each Computer Sciences class, print the class number, section number, and the average GPA of the students enrolled in the class section.
WITH AvgGPA AS (
    SELECT e.cno, e.sectno, AVG(s.gpa) AS avg_gpa
    FROM enroll e
    JOIN student s ON e.sid = s.sid
    WHERE e.dname = 'Computer Sciences'
    GROUP BY e.cno, e.sectno
)
SELECT e.cno, e.sectno, ag.avg_gpa
FROM enroll e
JOIN AvgGPA ag ON e.cno = ag.cno AND e.sectno = ag.sectno
WHERE e.dname = 'Computer Sciences';

-- Query 4: Print the names and section numbers of all sections with more than six students enrolled in them.
SELECT s.pname, s.sectno
FROM section s
JOIN (
    SELECT dname, cno, sectno, COUNT(*) AS enroll_count
    FROM enroll
    GROUP BY dname, cno, sectno
    HAVING COUNT(*) > 6
) AS e ON s.dname = e.dname AND s.cno = e.cno AND s.sectno = e.sectno;

-- Query 5: Print the name(s) and sid(s) of the student(s) enrolled in the most sections.
WITH EnrollCount AS (
    SELECT sid, COUNT(*) AS num_enrollments
    FROM enroll
    GROUP BY sid
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT sname, sid
FROM student
WHERE sid IN (SELECT sid FROM EnrollCount);

-- Query 6: Print the names of departments that have one or more majors who are under 18 years old.
SELECT DISTINCT d.dname
FROM dept d
JOIN major m ON d.dname = m.dname
JOIN student s ON m.sid = s.sid
WHERE s.age < 18;

-- Query 7: Print the names and majors of students who are taking one of the College Geometry courses.
SELECT DISTINCT s.sname, m.dname
FROM student s
JOIN major m ON s.sid = m.sid
JOIN enroll e ON s.sid = e.sid
JOIN course c ON e.cno = c.cno AND e.dname = c.dname
WHERE c.cname LIKE 'College Geometry%';

-- Query 8: For those departments that have no major taking a College Geometry course print the department name and the number of PhD students in the department.
SELECT d.dname, d.numphds
FROM dept d
LEFT JOIN major m ON d.dname = m.dname
LEFT JOIN student s ON m.sid = s.sid
WHERE s.sid IS NULL AND d.dname NOT IN (
    SELECT DISTINCT c.dname
    FROM enroll e
    JOIN course c ON e.cno = c.cno AND e.dname = c.dname
    WHERE c.cname LIKE 'College Geometry%'
);

-- Query 9: Print the names of students who are taking both a Computer Sciences course and a Mathematics course.
SELECT DISTINCT s.sname
FROM student s
JOIN major m ON s.sid = m.sid
JOIN enroll e ON m.dname = e.dname
JOIN course c ON e.cno = c.cno AND e.dname = c.dname
WHERE c.dname IN ('Computer Sciences', 'Mathematics')
GROUP BY s.sname
HAVING COUNT(DISTINCT c.dname) = 2;

-- Query 10: Print the age difference between the oldest and the youngest Computer Sciences major.
SELECT MAX(s.age) - MIN(s.age) AS age_difference
FROM student s
JOIN major m ON s.sid = m.sid
WHERE m.dname = 'Computer Sciences';

-- Query 11: For each department that has one or more majors with a GPA under 1.0, print the name of the department and the average GPA of its majors.
WITH DeptAvgGPA AS (
    SELECT dname, AVG(gpa) AS avg_gpa
    FROM major
    JOIN student ON major.sid = student.sid
    GROUP BY dname
)
SELECT dname, avg_gpa
FROM DeptAvgGPA
WHERE dname IN (
    SELECT dname
    FROM major
    JOIN student ON major.sid = student.sid
    WHERE gpa < 1.0
    GROUP BY dname
);

-- Query 12: Print the ids, names and GPAs of the students who are currently taking all the Civil Engineering courses.
SELECT s.sid, s.sname, s.gpa
FROM student s
JOIN enroll e ON s.sid = e.sid
JOIN course c ON e.cno = c.cno AND e.dname = c.dname
JOIN dept d ON c.dname = d.dname
WHERE d.dname = 'Civil Engineering'
GROUP BY s.sid, s.sname, s.gpa
HAVING COUNT(DISTINCT c.cno) = (
    SELECT COUNT(*)
    FROM course
    WHERE dname = 'Civil Engineering'
);

