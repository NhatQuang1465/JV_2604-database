CREATE SCHEMA university;
CREATE TABLE university.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE university.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER
);
CREATE TABLE university.enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enroll_date DATE,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES university.students(student_id),
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES university.courses(course_id)
);
--Xem danh sách database
SELECT datname FROM pg_database;
--Xem schema
SELECT schema_name 
FROM information_schema.schemata;
--Xem cấu trúc bảng
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'students';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'courses';

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'enrollments';