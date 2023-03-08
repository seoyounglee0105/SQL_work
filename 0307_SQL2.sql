-- 조건절 (WHERE)
-- 조건식은 연산자와 피연산자로 이루어짐
-- 연산자 : (비교연산자) =, <>, <, <=, >, >=     (논리연산자) AND, OR, NOT
-- 피연산자 : 컬럼명, 상수값, 서브쿼리 (쿼리 안에 쿼리)
-- 논리연산자를 이용해서 여러 조건식을 조합해서 사용할 수 있음

-- 학과가 컴퓨터공학과인 학생들의 이름과 학번을 조회하려면?
SELECT student_id, name 
FROM student
WHERE major = '컴퓨터공학과';

-- student
-- 1. grade가 3인 학생들 조회하기
SELECT *
FROM student
WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회하기
SELECT *
FROM student
WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생 조회하기
SELECT *
FROM student
WHERE student_id BETWEEN 1 AND 10;

-- 4. 학과가 디자인학과이고, 1학년인 학생 조회하기
SELECT *
FROM student
WHERE major = '디자인학과' AND grade = 1;

-- 5. 학과가 컴퓨터공학과이거나, 2학년인 학생 조회하기
SELECT *
FROM student
WHERE major = '컴퓨터공학과' OR grade = 2;

-- 6. 이름이 홍길동이 아닌 학생 조회하기
SELECT *
FROM student
WHERE NOT (name = '홍길동');

-- 7. 학년이 2학년 이상인 학생 조회하기
SELECT *
FROM student
WHERE grade >= 2;

-- 8. 학년이 2학년 미만인 학생 조회하기
SELECT *
FROM student
WHERE grade < 2;

-- 9. 학년이 1학년이거나 3학년이거나 4학년인 학생 조회하기
SELECT *
FROM student
WHERE grade IN (1, 3, 4);

SELECT *
FROM student
WHERE NOT (grade = 2);

