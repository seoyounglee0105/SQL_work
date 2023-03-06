-- 직접 문제 내고 풀어보기

SHOW CREATE TABLE customer;


-- 문제
-- 1. professor 테이블을 정의 하세요.
-- 컬럼 : id, name, phonenumber, major
-- id는 순서대로 1, 2, 3, ...의 값을 갖는 PRIMARY KEY로 설정하세요. (제약조건 활용)
-- 모든 컬럼을 NOT NULL로 설정하세요.

CREATE TABLE professor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phonenumber VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

-- 2. professor 테이블에 아래의 값을 갖는 3개의 레코드를 삽입하세요.
-- phonenumber가 주어지지 않은 경우, DEFAULT 값으로 빈 문자열이 들어가도록 설정하세요. (ALTER 활용)
-- 레코드 삽입 시, 복수형으로 작성해주세요.

-- 레코드 1] name : 박교수, phonenumber : 010-1111-2222, major : 경영학과
-- 레코드 2] name : 이교수, major : 기계공학과
-- 레코드 3] name : 최교수, phonenumber : 010-3333-4444, major : 물리학과

ALTER TABLE professor MODIFY phonenumber VARCHAR(50) NOT NULL DEFAULT '';

INSERT INTO professor(name, phonenumber, major)
VALUES
	('박교수', '010-1111-2222', '경영학과'),
    ('이교수', DEFAULT, '기계공학과'),
    ('최교수', '010-3333-4444', '물리학과');
    
-- 결과 집합 확인
SELECT * FROM professor;




