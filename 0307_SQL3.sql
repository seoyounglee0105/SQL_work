CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);

-- subject 테이블 샘플 데이터 
INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');

-- customer 샘플 데이터 
INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

-- 1. 과목 이름이 미국사인 데이터 조회
SELECT *
FROM subject
WHERE subject_name = '미국사';

-- 2. 학점이 3점인 과목 데이터 조회
SELECT *
FROM subject
WHERE credit = 3;

-- 3. 국어국문학과에서 개설된 과목 데이터 조회
SELECT *
FROM subject
WHERE department = '국어국문학과';

-- 4. 과목이 영어회화이거나, 교수명이 이승호인 과목 데이터 조회
SELECT *
FROM subject
WHERE (subject_name = '영어회화') OR (professor = '이승호');

-- 5. 과목번호가 5보다 큰 데이터 조회
SELECT *
FROM subject
WHERE subject_id > 5;

-- 6. 과목 이름이 '데이터베이스 개론'이 아닌 데이터 조회
SELECT * 
FROM subject
WHERE subject_name != '데이터베이스 개론'; -- MySQL은 문자열 내 공백도 하나의 값으로 취급함

-- 7. 학과가 컴퓨터공학과이고 교수명이 박철수인 데이터 조회
SELECT *
FROM subject
WHERE (department = '컴퓨터공학과') AND (professor = '박철수');

-- 8. 교수명이 김현진이거나 최영식이면서, 학과가 외국어학과인 과목 데이터 조회
SELECT *
FROM subject 
WHERE (professor IN ('김현진', '최영식')) AND (department = '외국어학과');

-- 검증 쿼리
SELECT *
FROM subject
WHERE professor = '김현진';


-- 문제
-- customer 테이블과 입력되어 있는 데이터를 활용해서 문제를 직접 만들어보고 쿼리 구문을 작성해주세요. 문제는 최소 5개 이상입니다. 

DESC customer;

-- 1. 서울에 사는 고객들의 데이터 조회
SELECT *
FROM customer
WHERE address LIKE '서울%';

-- 2. 이메일 주소가 입력되지 않은 고객들의 데이터 조회
SELECT *
FROM customer
WHERE email IS NULL;

-- 3. 이름에 '수'가 포함된 고객들의 데이터 조회
SELECT *
FROM customer
WHERE name LIKE '%수%';

-- 4. id가 5인 고객의 이름과 주소 데이터 조회
SELECT name, address
FROM customer
WHERE id = 5;

-- 5. 경기도에 사는 고객들 수 구하기
SELECT COUNT(*) AS '경기도 고객 수'
FROM customer
WHERE address LIKE '경기도%';

-- ---------------------------------

-- 1. 강남 3구에 사는 사람들 조회
SELECT * 
FROM customer
WHERE address IN ('서울시 강남구', '서울시 서초구', '서울시 송파구');

-- 2. 이메일 주소가 입력되지 않은 고객들의 데이터 조회
SELECT *
FROM customer
WHERE email IS NULL;

-- 3. id가 5 이상이며 서울시에 거주하는 사람들 조회
SELECT *
FROM customer
WHERE (id >= 5) AND (address LIKE '서울시%');

-- 4. 이메일 주소가 입력되지 않은 고객들의 데이터 조회
SELECT *
FROM customer
WHERE email IS NULL;

-- 5. 이메일이 NULL이 아니고 주문번호가 2번이 넘으며, 종로구에 사는 사람들 조회
SELECT *
FROM customer
WHERE (email IS NOT NULL) AND (id > 2) AND (address = '서울시 종로구');

-- 6. 주소가 서울이면서 id가 5 이하인 사람들 조회
SELECT *
FROM customer
WHERE (address LIKE '서울%') AND (id <= 5);

-- 7. 서울에 사는 고객들의 데이터 조회
SELECT *
FROM customer
WHERE address LIKE '서울%';

-- 8. 아이디가 3~8인 사람들 중, 경기도 의정부에 거주하면서 이메일이 입력되어 있는 사람들 조회
SELECT *
FROM customer
WHERE (id BETWEEN 3 AND 8) AND (address = '경기도 의정부시') AND (email IS NOT NULL);


