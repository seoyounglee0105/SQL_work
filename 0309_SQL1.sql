-- N:M 관계
-- 두 개 이상의 테이블이 서로 복수 개의 레코드를 가질 때 발생하는 관계
-- 중간 테이블을 추가해서 두 테이블 간의 관계를 나타냄
-- 데이터 중복 최소화, 데이터 일관성/정확성 유지

-- 학생 : 과목 = N : M

CREATE TABLE student (
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject (
	subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 학생 : 수강 = 1 : N
-- 과목 : 수강 = 1 : N
CREATE TABLE enrollment (
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

--

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축해보세요.
-- 사람 : 도시 = N : M

CREATE TABLE person (
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE city (
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE travel (
    person_id INT NOT NULL,
    city_id INT NOT NULL,
    trip_date DATE,
    PRIMARY KEY (person_id, city_id, trip_date), -- 복합 기본키 (중간 테이블은 id를 따로 지정하는 것보다는 이렇게 하는 걸 추천) 
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

INSERT INTO person
VALUES
	(1, '김영희'),
	(2, '박철수'),
	(3, '이민호'),
	(4, '한지민'),
	(5, '송혜교');
    
    INSERT INTO city
    VALUES
		(1, '서울'),
		(2, '부산'),
		(3, '제주'),
		(4, '홍콩'),
		(5, '도쿄');
        
	INSERT INTO travel
    VALUES 
		(1, 1, '2022-07-10'),
		(1, 2, '2022-07-10'),
		(2, 5, '2022-07-10'),
		(2, 4, '2022-07-10'),
		(3, 3, '2022-07-10'),
		(4, 5, '2022-07-10'),
		(1, 4, '2022-07-10');
        
	SELECT * FROM travel;
    
    -- 문제 만들기 (JOIN 활용)
    
    -- 문제 1. FROM 절에 서브 쿼리를 사용해서 travel, person, city를 모두 LEFT JOIN으로 연결한 후, 
    -- 김영희가 방문한 도시 이름들을 출력하시오.
    -- (단, 결과 집합의 컬럼명이 '도시명'으로 출력되도록 함)

    SELECT c.name AS '도시명'
    FROM (SELECT *
					FROM travel AS t
					LEFT JOIN person AS p
					ON t.person_id = p.id) AS tp
    LEFT JOIN city AS c
    ON tp.city_id = c.id
    WHERE tp.name = '김영희';
    
    -- 문제 2. travel과 city를 LEFT JOIN으로 연결한 후, '서울'의 방문 횟수가 몇 번인지 구하시오. (COUNT 함수 활용)
    -- (단, 결과 집합의 컬럼명이 '서울 방문 횟수'로 출력되도록 함)
	SELECT COUNT(*) AS '서울 방문 횟수'
    FROM travel AS t
    LEFT JOIN city AS c
    ON t.city_id = c.id
    WHERE c.name = '서울';
    
    -- 테이블 설계
    -- 고객, 상품, 주문
    CREATE TABLE customer (
		id INT PRIMARY KEY,
        name VARCHAR(20) NOT NULL
    );
    
    CREATE TABLE product (
		id INT PRIMARY KEY,
        name VARCHAR(20) NOT NULL,
        price INT NOT NULL
    );
    
    CREATE TABLE 	`order` (
		id INT PRIMARY KEY,
        customer_id INT NOT NULL,
        product_id INT NOT NULL,
        amount INT NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customer(id),
        FOREIGN KEY (product_id) REFERENCES product(id)
    );
    
    







