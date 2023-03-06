-- 데이터베이스 생성
-- CREATE DATABASE DB명;

CREATE DATABASE mydb;

-- 생성된 데이터베이스는 MySQL 서버에 저장됨
-- 데이터베이스 내에서 테이블을 생성하고 데이터를 저장할 수 있음
-- 데이터베이스 이름이 중복될 경우 오류 발생


-- 해당 DB를 사용하겠다는 명령어 실행 or 데이터베이스를 더블 클릭
USE mydb;  -- 해당 코드 실행 : [Ctrl] + [Enter]
		   -- 전체 코드 실행 : [Ctrl] + [Shift] + [Enter]

-- 가급적 예약어는 대문자로 작성하고, 직접 정의하는 단어들은 소문자로 작성할 것
-- 변수 표기법은 _ 권장 (스네이크 케이스 또는 스네이크 표기법 : 연결 단어를 언더바로)

-- 테이블 생성
-- CREATE TABLE 테이블명
--    컬럼명1 자료형,
--    컬럼명2 자료형 [NOT NULL],
--    ...
-- );

-- 학생 테이블 생성하기
-- 실행 후, 새로고침하면 Tables 탭에 student 테이블이 생성됨
CREATE TABLE student(
	student_id INT,
    student_name VARCHAR(50) NOT NULL,  -- VARCHAR(n) : 최대 n자까지, 가변 길이 문자열 타입
    grade INT NOT NULL,                               -- n자보다 짧게 문자열을 입력하면 그 만큼의 메모리 공간만 차지함
    major VARCHAR(50) NOT NULL    
);

-- SELECT 컬럼명
SELECT * FROM student;

-- 해당 테이블에 있는 컬럼들의 제약사항 확인 (구조 확인)
-- 특정 테이블의 구조(스키마) 정보 출력
-- 구조 정보를 보다 간략하게 확인할 수 있도록 지원함
-- Null] YES == Null 값을 허용함
DESC student;

-- 과목 테이블 생성하기
CREATE TABLE subject(
	subject_id INT,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL, -- 학점
    department VARCHAR(50),
    professor CHAR(50) NOT NULL -- CHAR(n) : n자의 고정 길이 문자열
										   -- n자보다 짧게 문자열을 입력해도 n 만큼의 메모리 공간을 차지함
);

SELECT * FROM subject;

DESC subject;

-- 이미 생성된 테이블에 PK(제약조건 - 기본키 or 고유키)를 추가하는 방법
-- 기본키를 추가하면 해당 열에 대한 중복 데이터 저장 불가능
-- 데이터 검색 속도 향상
-- 기본키는 테이블 내에서 고유한 값이어야 함
-- 기본키를 사용하려면 해당 열에 대해 NOT NULL 제약조건 필요

-- student_id를 기본키(PK)로 
ALTER TABLE student ADD PRIMARY KEY(student_id);
DESC student;

-- 문제 : subject 테이블의 subject_id에 PK를 추가하고, 제약 확인하기
ALTER TABLE subject ADD PRIMARY KEY(subject_id);
DESC subject;

-- DESC보다 자세하게 구조 확인하기
-- 테이블이 생성되었던 시점에 실행되었던 명령어를 볼 수 있음
SHOW CREATE TABLE student;

-- 테이블 삭제
DROP TABLE student;
DROP TABLE subject;

-- 테이블 생성 시점에서 PK를 추가하는 방법
CREATE TABLE student(
	student_id INT PRIMARY KEY, -- PK 설정 시, NOT NULL을 설정하지 않아도 자동으로 NOT NULL 설정됨
    student_name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);

DESC student;

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(10) NOT NULL,
    professor VARCHAR(20) NOT NULL
);

DESC subject;

-- 문제 1
-- employee 테이블을 생성하며, id, name, age, department 열을 포함
-- id 열은 기본키로 설정, 데이터 타입은 직접 선정하기
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(50) NOT NULL 
);

-- 문제 2
-- customer 테이블을 생성하며, id, name, email, address 열을 포함
-- id 열은 기본키로 설정, 데이터 타입은 직접 선정하기
CREATE TABLE customer(
	id INT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);

-- TEXT, DECIMAL 사용해보기
CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- 고정 소숫점 방식 : DECIMAL(전체 자릿수, 소숫점 이하 자릿수)
	description TEXT -- 긴 텍스트 데이터 저장 가능 (문자열의 길이에 제한 X)
);

DESC product;

-- 기본적으로, 예약어와 같은 이름으로 테이블을 생성할 수 없음
-- 하지만 작은따옴표를 사용해서 테이블 이름이라고 명시하면 사용할 수 있음
CREATE TABLE product_order(
	id INT PRIMARY KEY,
    customer_order VARCHAR(50),
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);

-- 문제 3
-- 간단한 테이블을 직접 만들고, 제약 조건을 설정하여 테이블 생성 쿼리 구문을 작성하시오
-- 동물병원의 환자 테이블
CREATE TABLE dog_patient(
	id INT PRIMARY KEY, -- 환자 번호
    name VARCHAR(30) NOT NULL, -- 환자 이름
    breed VARCHAR(50) NOT NULL, -- 품종
    gender VARCHAR(5) NOT NULL, -- 성별 (남 : M, 여 : F)
    protector_phone VARCHAR(50) NOT NULL -- 보호자 전화번호
);




