-- NOT NULL과 DEFAULT

-- DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL  -- 데이터 삽입 시 값을 입력하지 않으면 기본값으로 자동 삽입됨
);

DESC student;

-- DEFAULT 제약조건을 사용했을 때 INSERT 방법
-- 1.
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1, 'John', 3, '경영학과'),
    (2, 'Jane', 2, '경영학과'),
    (3, 'Mike', 1, DEFAULT), -- DEFAULT 값이 들어가게 함
    (4, 'David', 2, DEFAULT);
    
-- 2.
INSERT INTO student(student_id, name, grade)
VALUES
	(5, '홍길동1', 2),
	(6, '홍길동1', 3),
	(7, '홍길동1', 1),
	(8, '홍길동1', 3);
    -- 알아서 major에 기본값이 삽입됨
    
SELECT * FROM student;
    
CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);
    
-- 문제
-- professor 컬럼의 제약사항 DEFAULT 추가, 값은 빈 문자열로
-- 빈 문자열 : ''
-- 제약조건 작성 순서는 크게 상관 x
ALTER TABLE subject MODIFY professor VARCHAR(50) NOT NULL DEFAULT '';
DESC subject;
    
    
    