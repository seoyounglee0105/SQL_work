use employees;

-- GROUP BY 
-- 데이터들을 원하는 그룹으로 나눌 수 있음
-- 나누고자 하는 그룹의 컬럼명을 SELECT절과 GROUP BY절 뒤에 추가하면 됨
-- 집계 함수와 함께 사용되는 상수는 GROUP BY절에 추가하지 않아도 됨

-- 집계 함수

SHOW TABLES;

SELECT * FROM salaries
limit 10;  -- 결과 집합의 행 개수 제한
				  -- limit b; : 처음부터 b개 만큼

SELECT * FROM salaries
limit 10, 5; -- limit a, b; : a번째 레코드부터 b개 만큼 

SELECT emp_no, COUNT(emp_no) 
FROM salaries
GROUP BY emp_no;

SELECT *, count(gender)
FROM employees
GROUP BY gender;

SELECT COUNT(*)
FROM employees
GROUP BY hire_date, gender; -- 그룹화 조건 여러 개 가능

-- GROUP에 대한 조건절 HAVING

-- SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';

SELECT *, COUNT(salary) AS 'count', MAX(salary) AS 'max'
			    , MIN(salary) AS 'min', SUM(salary) as 'sum'
				, ROUND(AVG(salary), 2) AS 'avg'
FROM salaries
GROUP BY emp_no;

-- 문제 1. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT  MAX(salary)
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY e.gender
HAVING e.gender = 'M';

-- 문제 2. employees 테이블, titles 테이블, salaries 테이블을 활용해서 'Senior Engineer'들의 평균 연봉을 구하시오.
-- (단, 소수점은 버림)
SELECT FLOOR(AVG(salary))
FROM (SELECT e.emp_no, t.title
			  FROM employees AS e
			  INNER JOIN titles AS t
			  ON e.emp_no = t.emp_no) AS et
INNER JOIN salaries AS s
ON et.emp_no = s.emp_no
GROUP BY et.title
HAVING et.title = 'Senior Engineer';



-- employees : dept_emp = 1 : N
SELECT *
FROM employees;

SELECT *
FROM dept_emp;

-- departments : dept_emp = 1 : N
SELECT *
FROM departments;

-- employees : departments = N : M

-- 1. 조인 해보기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2. 다중 조인 가능
SELECT *
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 3. 원하는 컬럼만 출력
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4. 그룹화
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';


-- 다른 학생이 만든 문제 풀어보기
-- 1. emp_no로 그룹을 나누고, title 테이블에서 title, salaries 테이블에서 salary를 출력하시오.
SELECT t.title, s.salary
FROM titles AS t
LEFT JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY s.emp_no;

-- 2. 위의 결과에서 연봉 65000 이상인 사람만 출력하시오.
SELECT t.title, s.salary, COUNT(*)
FROM titles AS t
LEFT JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY s.emp_no
HAVING s.salary >= 65000;

-- 3. 직책에 'Engineer'가 포함되는 사원들의 최고 연봉을 출력하시오.
SELECT t.title, MAX(s.salary)
FROM titles AS t
INNER JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING t.title LIKE '%Engineer%';

SELECT MAX(s.salary)
FROM titles AS t
INNER JOIN salaries AS s
ON t.emp_no = s.emp_no
WHERE t.title LIKE '%Engineer%';

-- 4. 각 부서에는 몇 명이 있는지 출력하시오.
SELECT d.dept_no, COUNT(*) AS '인원 수'
FROM dept_emp AS d
GROUP BY d.dept_no;

-- 5. 각 직급별로 몇 명이 있는지 출력하시오.
SELECT t.title, COUNT(*) AS '인원 수'
FROM titles AS t
GROUP BY t.title;

-- 6. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT  MAX(salary)
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY e.gender
HAVING e.gender = 'M';