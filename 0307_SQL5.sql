-- UNIQUE 제약조건
-- DB에서 특정 열에 대해 고유한 값을 가지도록 강제함
-- 해당 열의 각 레코드 값이 모두 고유한 값을 가져야 함
-- 데이터 중복 방지
-- 데이터 일관성 유지
-- 인덱스를 생성할 때도 사용됨
-- -> UNIQUE 제약조건이 설정된 열은 자동으로 인덱스로 지정되어 검색 속도를 높일 수 있음

CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL, 
    email VARCHAR(50) UNIQUE, -- 중복 불가능
    phone VARCHAR(20), 
    address VARCHAR(100) NOT NULL
);

INSERT INTO member (name, email, phone, address)
VALUES 
	('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
	('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
	('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
	('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
	('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
	('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

UPDATE member
SET address = '서울시 중구'
WHERE name = '이철수';

-- 이메일이 중복되어 오류
-- INSERT INTO member (name, email, phone, address)
-- VALUES 
-- 	('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구');

-- 인덱스
-- 데이터베이스 내에 별도로 저장되어 있음
-- DB에서 데이터 검색 속도를 향상시키기 위해 사용되는 구조

-- 대량의 데이터를 처리할 때 효율적으로 검색 수행 가능
-- (인덱스가 없다면 : 풀 스캔 -> 하나하나 다 검색해서 시간이 오래 걸림)

-- DB의 열 값을 이용해서 검색을 빠르게 하기 위한 데이터 구조
-- 특정한 열에 대해 정렬된 값을 가짐
-- -> 해당 열의 값을 이용하여 검색을 수행할 때 이를 이용하여 빠르게 검색할 수 있음

-- 단점 
-- 추가적인 디스크 공간을 필요로 함
-- 인덱스를 생성할 때 데이터를 정렬하는 작업이 필요함
-- -> 인덱스를 생성/수정할 때 시간이 소요될 수 있음
-- 따라서, 인덱스를 무조건 만드는 것이 아니라, 적절하게 설계/사용하는 것이 중요함

-- PRIMARY KEY를 선언하면 자동으로 인덱스가 생성됨
-- UNIQUE를 선언하면 자동으로 인덱스가 생성됨

-- 테이블 생성 시 인덱스 추가 쿼리 @@@@@@@@@@@
-- CREATE TABLE 테이블명 (
-- 	컬럼명1 자료형 제약조건,
-- 	...
-- 	INDEX 인덱스명 (컬럼명)  -- 해당 컬럼에 인덱스 추가
-- );

-- 기존 테이블에 인덱스 추가하기 @@@@@@@@@@@
-- ALTER TABLE 테이블명
-- ADD INDEX 인덱스명 (컬럼명); -- 해당 컬럼에 인덱스 추가

-- PK 추가 설명
-- 테이블에서 고유한 값을 식별하는 데 사용되는 제약조건
-- 테이블에서 각 행을 고유하게 식별할 수 있는 열 또는 열의 조합
-- PK를 정의하면 해당 열에 대한 인덱스가 자동으로 생성됨
-- -> PK를 정의하면 검색 속도가 향상됨

-- PK를 수정하면 해당 열에 대한 인덱스가 자동으로 수정됨
-- -> PK는 인덱스에 포함됨 (인덱스의 일종이라고 할 수 있음)

desc member;

SELECT * FROM member;

-- 문제
-- id가 2인 회원의 이름과 전화번호를 각각 임성준, 010-9875-5432로 수정
UPDATE member
SET name = '임성준', phone = '010-9875-5432'
WHERE id = 2;

-- id가 5인 회원의 이메일과 주소를 각각 leejaehyun@test.com, 서울시 강서구로 수정
UPDATE member
SET email = 'leejaehyun@test.com', address = '서울시 강서구'
WHERE id = 5;

-- 문제 : 노션에 있는 표를 기반으로 테이블을 설계해주세요
CREATE TABLE movie (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    director VARCHAR(10) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(10) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL
);

-- 문제 : 노션에 있는 표를 기반으로 데이터를 입력해주세요
INSERT INTO movie (title, director, release_date, genre, rating)
VALUES
	('괴물', '봉준호', '2006-07-27', '드라마', 8.28),
    ('극한직업', '이병헌', '2019-01-23', '코미디', 9.20),
    ('명량', '김한민', '2014-07-30', '사극', 9.17),
    ('신과함께-죄와 벌', '김용화', '2017-12-20', '판타지', 7.56),
    ('밀양', '임권택', '2016-09-07', '드라마', 7.76),
    ('반도', '연상호', '2020-07-15', '액션', 6.71),
    ('베테랑', '류승완', '2015-08-05', '액션', 8.49),
    ('변호인', '양우석', '2013-12-18', '드라마', 8.41),
    ('군함도', '류승완', '2017-07-26', '사극', 8.01),
    ('암살', '최동훈', '2015-07-22', '액션', 8.37);
    
-- 문제 3
-- 직접 문제를 내보고, 데이터를 수정해보세요.
SELECT * FROM movie;

ALTER TABLE movie
ADD actor VARCHAR(10);

UPDATE movie
SET actor = '송강호'
WHERE title = '괴물';


