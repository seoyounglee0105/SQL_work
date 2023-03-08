-- 관계 차수

-- 테이블 (릴레이션, 엔터티)
-- 관계형 데이터베이스에서 데이터의 저장/관리를 위한 개념
-- 관계형 DB에서는 테이블을 여러 개 만들고, 테이블 간 관계를 설정해서 데이터를 구성함

-- 관계 차수
-- 1:1 관계
-- 두 개의 테이블 간에 각각 하나의 레코드만 매칭되는 관계
-- 보통 기본키와 외래키를 사용하여 연결

-- 1:N 관계
-- N:1 관계 (관점 차이, 의미 같음)
-- 한 테이블의 레코드가 다른 테이블의 여러 레코드와 매칭되는 관계
-- 보통 외래키를 사용하여 연결

-- 학교와 학생의 관계 차수 = 1 : N
-- 학생과 학교의 관계 차수 = N : 1
-- 관계 차수를 표현할 때 특정한 기준이 없다면 다수 N쪽을 뒤로 표현하는 것을 권장함

-- 야구 팀과 야구 선수의 관계 차수 = 1 : N

-- N:M 관계
-- 두 개의 테이블 간에 다수의 레코드가 매칭되는 관계
-- 중간에 연결 테이블을 만들어서 각각의 테이블과 연결함으로써 구현 가능

-- 부모 테이블과 자식 테이블
-- 부모 테이블은 일반적으로 자식 테이블에 대한 PK를 가지고 있음
-- 자식 테이블은 부모 테이블을 참조하는 FK(외래키)를 가지고 있음
-- FK는 다른 테이블의 기본키를 참조하여 현재 테이블의 필드를 정의할 때 사용되는 제약조건
-- FK를 이용해 두 개 이상의 테이블 간에 관계 설정 가능

-- 부모 테이블은 하나의 레코드가 자식 테이블에서 여러 번 참조될 수 있음
-- 자식 테이블에서는 각 레코드가 부모 테이블에서 오직 하나의 레코드만 참조하게 됨
-- -> 1:N 관계
DROP TABLE school;
DROP TABLE student;

CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(20) NOT NULL,
    city VARCHAR(20)
);

CREATE TABLE student(
student_id INT PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,
grade VARCHAR(3) NOT NULL,
school_id INT,
FOREIGN KEY(school_id) REFERENCES school(school_id) -- 테이블명(PK명);
);

INSERT INTO school(school_id, school_name, city)
VALUES 
	(1, '서울대학교', '서울'),
	(2, '고려대학교', '서울'),
	(3, '연세대학교', '서울'),
	(4, '한양대학교', '서울');

SELECT * FROM school;

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES
	(1, '홍길동', '1학년', 1),
	(2, '김유신', '2학년', 2),
	(3, '이순신', '1학년', 3),
	(4, '유관순', '3학년', 1),
	(5, '안중근', '2학년', 4);
    
-- FK를 사용하면 여러 가지 제약 사항이 생기게 됨
SELECT * FROM student;
desc student; -- 외래키는 Key 열에 MUL이라고 표시됨

INSERT INTO student(student_id, student_name, grade, school_id)
VALUES (6, '야수오', 1, 10); -- 부모 테이블에 없는 school_id 값을 입력하면 오류

-- 야구 팀과 야구 선수 = 1 : N 관계
CREATE TABLE team(
	id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE player(
	player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(50) NOT NULL,
    team_id  INT,
    FOREIGN KEY(team_id) REFERENCES team(id)
);

INSERT INTO team(team_name)
VALUES
	('LG 트윈스'),
    ('NC 다이노스'),
    ('두산 베어스');

INSERT INTO player(player_name, team_id)
VALUES
	('허경민', 1),
    ('김하성', 2),
    ('최원준', 3);
    
SELECT * FROM team;
SELECT * FROM player;

-- 부서와 직원 관계를 설계해보세요.

CREATE TABLE department(
	department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(20) NOT NULL
);

CREATE TABLE employee(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
	employee_name VARCHAR(20) NOT NULL,
	department_id INT NOT NULL,
	FOREIGN KEY(department_id) REFERENCES department(department_id)
);

-- --
CREATE TABLE product (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE `order` (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO product(name, price)
VALUES
	('노트북', 1000000),
    ('스마트폰', 700000),
    ('키보드', 50000);
    
INSERT INTO `order`(order_date, product_id)
VALUES
	(20220215, 2),
    (20220216, 1),
    (20220217, 3);
    
SELECT * FROM product;
SELECT * FROM `order`;



