CREATE DATABASE college;

CREATE TABLE college.department(
    dept_id int(255) PRIMARY KEY ,
    dept_name varchar(30)  
);

CREATE TABLE college.student(
    student_id int(255) PRIMARY KEY ,
    student_name varchar(30) , 
    major varchar(30) ,
    `level` varchar(30) ,
    age int(255)
);

CREATE TABLE college.professor(
    prof_id int(255) PRIMARY KEY ,
    prof_name varchar(30) , 
    dept_id int(255) ,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE college.course(
    course_code varchar(30)  PRIMARY KEY,
    `name` varchar(30)
);

CREATE TABLE college.semester_course(
    course_code varchar(30) ,
    quarter varchar(30) , 
    `year` int(255),
    prof_id int(255),
    PRIMARY KEY(course_code,quarter,`year`),
    FOREIGN KEY (course_code) REFERENCES course(course_code) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (prof_id) REFERENCES professor(prof_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE college.enrolled(
    student_id int(255)    ,
    course_code varchar(30) , 
    quarter varchar(30),
    `year` int(255),
    enrolled_at date,
    PRIMARY KEY(student_id,course_code,quarter,`year`),
    FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (course_code,`quarter`, `year`) REFERENCES `semester_course`(course_code,`quarter`, `year`) ON DELETE RESTRICT ON UPDATE CASCADE
);

