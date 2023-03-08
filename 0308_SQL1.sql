-- 1:1 관계
-- 두 개의 테이블 간에 1:1 대응 관계가 있는 경우
-- 기본키와 외래키를 연결해서 관계 설정
-- 두 테이블 중 하나의 테이블에서만 외래키를 가질 수 있음
-- 1:1관계를 보조적인 테이블로 활용할 수 있음

-- 1:1 관계를 사용하는 경우
-- 테이블의 컬럼 중 일부가 NULL 값을 가지는 경우
-- 특정 컬럼 값이 자주 변경되지 않는 경우
-- -> 1:1 관계를 사용하면 테이블의 정규화를 유지하면서도 데이터를 보다 효율적으로 관리 가능

-- 정규화 (짧게 설명)
-- 데이터베이스 설계에서 가능한 중복을 제거하고 데이터를 구조화하는 프로세스
-- 효과 : 데이터의 일관성 & 유지보수 & 검색 속도 개선


-- 회원 정보 : 회원 등급 정보 = 1 : 1 관계
DROP TABLE IF EXISTS member; -- member 테이블이 존재한다면 삭제하라.

CREATE TABLE member (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100), 
    address VARCHAR(100)
);

CREATE TABLE  member_grade (
	member_id INT PRIMARY KEY,
    grade VARCHAR(10), 
    point INT,
    FOREIGN KEY (member_id) REFERENCES member(id)
);

-- 직원 정보 : 직책 정보 = 1 : 1 관계
DROP TABLE IF EXISTS employee; 
DROP TABLE IF EXISTS employee_position;

CREATE TABLE employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE employee_position (
	employee_id INT PRIMARY KEY,
	position VARCHAR(50) NOT NULL,
    dismissal_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

-- 
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS `order`;

CREATE TABLE product (
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT
);

CREATE TABLE product_detail (
	product_id INT PRIMARY KEY,
    description TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id)
);


