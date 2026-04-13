CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE
);
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);
CREATE TABLE Enrollments(
    enrollment_id SERIAL PRIMARY KEY,
	student_id INT REFERENCES Students(student_id),
	course_id INT REFERENCES Courses(course_id),
	grade VARCHAR(1) CHECK(grade IN('A','B','C','D','F'))
);