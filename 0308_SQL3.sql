USE employees;

show tables;
-- 1. departments : 부서번호(dept_no), 부서이름(dept_name)
-- 기본키 : 부서번호
SELECT * FROM departments;
DESC departments;
-- 2. dept_emp : 사원번호(emp_no, 외래키), 부서번호(dept_no, 외래키), from_date, to_date
-- 기본키 : 사원번호 + 부서번호
SELECT * FROM dept_emp;
DESC dept_emp;
SHOW CREATE TABLE dept_emp;
-- 3. dept_manager : 부서번호(dept_no, 외래키), 사원번호(emp_no, 외래키), from_date, to_date
-- 기본키 : 부서번호 + 사원번호
SELECT * FROM dept_manager;
DESC dept_manager;
-- 4. employees : 사원번호(emp_no), 생년월일(birth_date), 이름(first_name), 성(last_name), 성별(gender), 입사일자(hire_date)
-- 기본키 : 사원번호
SELECT * FROM employees;
DESC employees;
-- 5. salaries : 사원번호(emp_no, 외래키), 급여(salary), from_date, to_date
-- 기본키 : 사원번호 + 입사일자
SELECT * FROM salaries;
DESC salaries;
-- 6. titles : 사원번호(emp_no, 외래키), 직책(title), from_date, to_date
SELECT * FROM titles;

-- ----------------------





