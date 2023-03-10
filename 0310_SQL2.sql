SELECT * FROM titles;

-- Staff라는 매개변수로 문자열을 받으면
-- 결과집합으로 Staff에 해당하는 직원들의 이력을 결과 집합으로 만들기

SELECT * 
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no  -- ASC(기본값) : 오름차순, DESC : 내림차순
limit 10;

-- 2단계
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff';

DESC employees;

SELECT e.first_name, e.last_name, COUNT(*)
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY e.first_name, e.last_name
HAVING e.first_name = 'Georgi' AND e.last_name = 'Facello';

SELECT *
FROM employees AS eemployees
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE e.first_name = 'Georgi' AND e.last_name = 'Facello';

SELECT * FROM employees;
SELECT * FROM salaries;

SELECT * 
FROM dept_emp
WHERE to_date != "9999-01-01";


