-- DROP TABLE student;

CREATE TABLE student(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
	grade INT NOT NULL,
    major VARCHAR(20) NOT NULL
);

SELECT * FROM student;

INSERT INTO student(student_id, name, grade, major)
VALUES (1, '김철수', 3, '컴퓨터공학과');

-- student 샘플 데이터 
INSERT INTO student (student_id, name, grade, major)
VALUES
	(2, '박영희', 2, '경영학과'),
	(3, '이민수', 4, '전자공학과'),
	(4, '홍길동', 1, '디자인학과'),
	(5, '임성민', 3, '컴퓨터공학과'),
	(6, '한지원', 2, '경영학과'),
	(7, '박준형', 4, '전자공학과'),
	(8, '김민지', 1, '디자인학과'),
	(9, '이현수', 3, '컴퓨터공학과'),
	(10, '정미경', 2, '경영학과'),
	(11, '김성진', 4, '전자공학과'),
	(12, '임승환', 1, '디자인학과');

SELECT * FROM student;

DESC student;












