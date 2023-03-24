DESC salaries;

DESC employees;

SELECT  * FROM salaries;
SELECT * FROM employees;

-- 'employees' DB에 있는 'employees' 테이블과 'salaries' 테이블을 이용해서
-- 생일이 6월인 직원들이 현재 받고 있는 급여의 평균을 구하시오.

SELECT AVG(salary) FROM salaries AS s
INNER JOIN employees AS e
ON s.emp_no = e.emp_no
WHERE MONTH(e.birth_date) = 6 AND s.to_date = '9999-01-01';

-- MONTH()는 DATE에서 월만 가져오는 함수
-- 데이터를 살펴보면 salaries에서 to_date가 9999-01-01인 데이터가 현재 급여임을 알 수 있음

DESC employees;
SELECT * FROM titles;

-- 'employees' DB에 있는 'employees' 테이블과 'titles' 테이블을 활용해서
-- 승진한 적이 있고, first_name의 두 번째 글자가 'p'인 사원들을 대상으로 
-- 나이가 많은 순으로 정렬해서
-- 결과집합에 총 5개의 데이터만 출력하시오.
-- 단, 컬럼은 emp_no, birth_date, first_name만 출력

SELECT e.emp_no, e.birth_date, first_name
FROM titles AS t
INNER JOIN employees AS e
ON t.emp_no = e.emp_no
WHERE e.first_name LIKE '_p%'
GROUP BY t.emp_no
HAVING COUNT(*) > 1
ORDER BY birth_date
LIMIT 5;

-- 풀이
-- 승진한 적이 있는 사원들은 emp_no로 그룹화했을 때 COUNT(*)가 2 이상으로 출력됨 
-- 그룹을 대상으로 한 조건이므로 HAVING 절에 입력함

-- LIKE와 함께 쓰는 와일드 문자로는 \_와 % 등이 있음
-- %는 0개 이상의 문자를 대체하며, \_는
 1개의 문자를 대체함

-- LIMIT 숫자를 입력하면 결과집합에 해당 숫자 만큼의 레코드만 출력되도록 함

 -- birth_date를 오름차순으로 정렬했을 때 먼저 출력될수록 나이가 많은 것
 -- 정렬의 기본값이 ASC(오름차순)이므로, ASC를 생략할 수 있음

DESC employees;
DESC titles;
SELECT * FROM titles;

-- employees DB에서 employees 테이블과 titles 테이블을 이용해서 
-- Senior이고 고용 날짜가 4월이고 태어난 달이 1955년생이고 성별이 남자인 사람의 이름 구하기
SELECT e.first_name 
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.tItle LIKE 'Senior%' AND MONTH(e.hire_date) = 4 AND YEAR(e.birth_date) = 1955 AND e.gender = 'M';

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM departments;

-- employees DB에서 employees 테이블과 dept_emp 테이블과 departments 테이블을 이용하고
-- 부서를 기준으로 그룹화해서, 
-- 현재 해당 부서에 속해 있으면서 3~7월 사이에 생일인 사원들의 수가 20000명이 넘는 부서를 구하시오.

-- 조건 1. 생일에 대한 조건에는 비교 연산자를 사용하지 마시오.
-- 조건 2. 결과 집합의 컬럼에는 부서 이름(dept_name)과 사원 수를 . (별칭 사용)
-- 조건 3. 다중 조인을 사용하시오.

SELECT d.dept_name AS '부서 이름', COUNT(*) AS '사원 수'
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
WHERE (MONTH(e.birth_date) BETWEEN 3 AND 7)
                AND (d_e.to_date = '9999-01-01')
GROUP BY d.dept_name
HAVING COUNT(*) > 20000;


SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM salaries;

-- employees DB에서 'dept_manager' 테이블과 'departments' 테이블과 'salaries' 테이블을 이용해서
-- 부서 이름이 'Finance' 또는 'Production' 또는 'Sales'인 부서 매니저들의 연봉 평균을 반올림해서 소수점 1번째 자리까지 표시하시오.

-- 조건 1 : 부서 이름에 대한 조건에는 비교 연산자를 사용하지 말 것 
-- 조건 2 : 현재 매니저를 맡고 있는 직원 정보를 사용할 것 (이전 매니저의 정보 X)
-- 조건 3 : 해당 직원의 현재 연봉을 대상으로 평균을 구할 것 (이전 연봉 정보 X)
-- 조건 4 : 결과 집합의 컬럼명은 '연봉 평균'으로 지정할 것 (별칭 사용) 

SELECT ROUND(AVG(salary), 1) AS '연봉 평균'
FROM dept_manager AS m
LEFT JOIN salaries AS s
ON m.emp_no = s.emp_no
LEFT JOIN departments AS d
ON m.dept_no = d.dept_no
WHERE m.to_date = '9999-01-01'
		AND s.to_date = '9999-01-01'
        AND d.dept_name IN ('Finance', 'Production', 'Sales');
