
-- 실수로 전체 코드 실행을 수행해서 데이터가 모두 삭제될 수 있으므로,
-- DROP, DELETE 등은 사용한 후 주석 처리 해두는 걸 권장함
-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);

-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES(값1, 값2, ...);

-- 포지셔널 : 컬럼명과 값의 위치를 동일하게
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

-- INSERT INTO student(student_id, name, grade, major)
-- VALUES (1, '김철수', 4, '전자공학과'); -- 기본키인 id가 중복되어서 오류

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');
    
INSERT INTO student(student_id, name, grade, major)
VALUES (3, '이영희', 2, '경영학과');

-- VALUES와 VALUE의 기능이 동일하지만, 여러 개의 레코드를 삽입하는 경우에는
-- 복수형인 VALUES를 사용하는 것이 더 자연스러움 (사실 별로 상관 없음) -> 그냥 VALUES로 통일해도 됨
INSERT INTO student(student_id, name, grade, major)
VALUE (4, '티모', 1, '롤학과');

-- 테이블 데이터 삭제
DELETE FROM student;

-- INSERT문을 복수형으로 작성 (매 레코드마다 INSERT 작성 대신 한 번에 추가)
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');
	

SELECT * FROM student; -- 결과집합

-- 복수형으로 데이터 3행을 입력해보세요.
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1004, '홍길동', 4, '체육학과'),
    (1005, '이서영', 4, '산업공학과'),
    (1006, '최영수', 2, '국어교육과');

-- INSERT 구문에서 복수행 쿼리를 실행할 때
-- 하나라도 오류가 있다면 모든 데이터가 정상 저장되지 않음
-- 복수형 작성 시, 하나 이상의 레코드에 오류가 발생한다면 모든 레코드가 추가되지 않음
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수2', 2, '컴퓨터공학과'),
    (1008, '이영희2', 3, '수학과'),
    (1009, '박민수2', 1, '전자공학과');

SELECT * FROM student;

-- 문제
-- 직원 테이블과 고객 테이블의 스키마 확인하고 데이터 형식에 맞춰서 5행 이상의 데이터를 입력하시오.
-- 단, 복수형으로 작성

DESC employee;

INSERT INTO employee(id, name, age, department)
VALUES
	(1, '김직원', 25, '부서 1'),
    (2, '박직원', 26, '부서 2'),
    (3, '최직원', 35, '부서 1'),
    (4, '이직원', 33, '부서 1'),
    (5, '한직원', 43, '부서 2');

DESC customer;

INSERT INTO customer(id, name, email, address)
VALUES
	(1, '김고객', '111@naver.com', '해운대구'),
    (2, '박고객', '222@naver.com', '기장군'),
    (3, '최고객', '333@kakao.com', '진구'),
    (4, '이고객', '444@daum.net', '중구'),
    (5, '한고객', '555@naver.com', '북구');
    
-- 문제
-- product 테이블을 설계하고 데이터를 3행 이상 입력하시오. 
-- 단, 단수형으로 작성

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO product(id, name, price)
VALUES (1, '바나나', 2500);

INSERT INTO product(id, name, price)
VALUES (2, '멜론', 10000);

INSERT INTO product(id, name, price)
VALUES (3, '라면', 800);

SELECT * FROM product;
SELECT * FROM employee;
SELECT * FROM customer;

-- 이미 생성된 테이블의 제약사항 변경
ALTER TABLE student MODIFY grade INT NULL; -- 기존 : NOT NULL -> 변경 : NULL 허용

desc student;

-- 포지셔널 타입 : 순서에 맞춰 값을 넣기
INSERT INTO student(student_id, name, major)
VALUES (1, '홍길동', '검술학과');

-- 연습
-- grade의 제약조건을 다시 NOT NULL로 변경해보세요.
DELETE FROM student WHERE grade IS NULL;
ALTER TABLE student MODIFY grade INT NOT NULL;

SELECT * FROM student;

-- 문제
-- major 컬럼의 제약조건을 NOT NULL로 변경해보세요.
ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;

DESC student;

-- INSERT 구문에서, 모든 컬럼에 값을 삽입할 경우 컬럼 선언 부분 생략 가능
INSERT INTO student VALUES (2, '홍길동2', 3, '검술학과');

-- 정리
-- INSERT 구문 컬럼명 선언 방식
-- 1. 전부 작성
-- 2. 제약사항이 NOT NULL이 아니라면, 해당 컬럼을 제외하고 작성 가능
-- 3. 전부 삽입하는 상황이라면, 컬럼 선언 부분 생략 가능






