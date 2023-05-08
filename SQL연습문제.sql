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
-- %는 0개 이상의 문자를 대체하며, \_는 1개의 문자를 대체함

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


/* 
'Senior'가 포함되는 직급에 현재 속해 있는 사원들 중, 
현재 급여가 58000에서 59000 사이인 사원들의 emp_no, 이름, 급여를 출력하시오.

조건 1) 이름은 first_name과 last_name을 연결한 형태로 출력하시오.
			(ex. Mariusz Prampolini)
조건 2) 급여를 내림차순으로 정렬하시오.
조건 3) 결과 집합의 행이 5개만 나타나도록 지정하시오.
*/

SELECT e.emp_no, CONCAT(first_name, ' ', last_name) AS '이름', salary
FROM employees AS e
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE t.title LIKE '%Senior%'
				AND t.to_date = '9999-01-01'
                AND s.to_date = '9999-01-01'
				AND s.salary BETWEEN 58000 AND 59000
ORDER BY salary DESC
LIMIT 5;


SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;

-- 현재 'Senior'가 포함되지 않는 직급에 속해 있는 사원들 중,
-- 현재 급여를 65000 ~ 66000 사이로 받고 있는 사원들의 수를 구하시오.
-- 단, FROM 절과 WHERE 절 모두 서브 쿼리를 사용하시오.

SELECT COUNT(*) AS '사원 수'
FROM (
		SELECT emp_no
		FROM titles
		WHERE NOT (title LIKE '%Senior%')
					   AND to_date = '9999-01-01'
	) AS et
WHERE emp_no IN (
		SELECT emp_no
		FROM salaries
        WHERE (salary BETWEEN 65000 AND 66000)
					   AND (to_date = '9999-01-01')
	);
    

SELECT * FROM salaries;

SELECT * 
FROM departments
WHERE CHAR_LENGTH(dept_name) < 10;

SELECT * FROM dept_emp;
SELECT * FROM salaries;

-- 부서명 길이가 10 미만인 부서에 현재 속해 있는 사원들의 
-- 급여 평균을 소수점 둘째 자리까지 나타내시오.
SELECT FORMAT(AVG(salary), 2)
FROM salaries
WHERE emp_no IN (SELECT de.emp_no 
									  FROM dept_emp AS de
									  INNER JOIN departments AS d
                                      ON de.dept_no = d.dept_no
                                      WHERE CHAR_LENGTH(d.dept_name) < 10 
													AND de.to_date = '9999-01-01')
				AND to_date = '9999-01-01';
-- 참고 : 부서명이 영문이라서 LENGTH 메서드를 사용해도 무관 


-- 1998년 이후 기준으로 봉급제일 많이 받는 부서 순으로 조회해보세요
SELECT d.dept_no, de.dept_name, SUM(s.salary)
FROM dept_emp AS d
INNER JOIN salaries AS s
ON d.emp_no = s.emp_no
LEFT JOIN departments AS de
ON d.dept_no = de.dept_no
WHERE YEAR(d.from_date) >= 1998
			   AND  YEAR(s.from_date) >= 1998
GROUP BY d.dept_no
ORDER BY SUM(s.salary) DESC;


SELECT  * FROM departments;

SELECT * FROM dept_manager AS dm
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE to_date = '9999-01-01'; -- 110567

SELECT * FROM dept_emp;

SELECT dept_no, COUNT(*)
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY COUNT(*) DESC;

-- 현재 가장 많은 사원들이 속해 있는 부서의 현재 매니저 이름을 구하시오.
-- 단, 이름은 first_name과 last_name을 연결한 형태로 출력하시오. 
-- (ex. Mariusz Prampolini)

SELECT CONCAT(first_name, ' ', last_name) AS '이름'
FROM dept_manager AS dm
LEFT JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE (dm.to_date = '9999-01-01')
			   AND dm.dept_no = (SELECT dept_no
													FROM dept_emp
													WHERE to_date = '9999-01-01'
													GROUP BY dept_no
													ORDER BY COUNT(*) DESC
													LIMIT 1);
-- 정답 : Leon DasSarma
              
-- 여기서부터는 bank db 이용하기

-- 출금한 기록이 있는 계좌를 가진 고객들의 이름(fullname + username)을 출력하시오.

SELECT CONCAT(fullname, username) AS '이름'
FROM user_tb
WHERE id IN (
			SELECT c.id
			FROM history_tb AS h
			LEFT JOIN account_tb AS c
			ON h.w_account_id = c.id
			WHERE h.w_account_id IS NOT NULL
						AND h.d_account_id IS NULL
            );

-- 문제 1. history_tb 에서 계좌 id 1번인 입금 내역을 출력하시오 
SELECT * FROM history_tb
WHERE d_account_id = 1 AND w_account_id IS NULL;

-- 문제 2. history_tb 에서 계좌 id 1번인 출금 내역을 출력하시오
SELECT * FROM history_tb
WHERE w_account_id = 1 AND d_account_id IS NULL;

-- 문제 3. history_tb 에서 계좌 id 1번인 입출금 내역을 출력하시오 
SELECT * FROM history_tb
WHERE (w_account_id = 1  AND d_account_id IS NULL)
				OR (d_account_id = 1 AND w_account_id IS NULL);
                
-- 문제 4. fullname 애기공룡의 계좌id를 뽑아 계좌 입출금 내역을 출력해주세요. 

SELECT * FROM history_tb;
SELECT * FROM account_tb;
SELECT * FROM user_tb;

SELECT * 
FROM history_tb AS h
WHERE h.w_account_id IN (SELECT a.id FROM user_tb AS u
													JOIN account_tb AS a
													ON u.id = a.user_id
													WHERE u.fullname = '애기공룡')
	  OR h.d_account_id IN (SELECT u.id FROM user_tb AS u
													JOIN account_tb AS a
													ON u.id = a.user_id
													WHERE u.fullname = '애기공룡');

-- 문제 1 
-- history_tb 에서 입금 내역과 입금 계좌 번호를 join 을 사용해서 출력 하시오
SELECT h.*, a.number AS '입금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE d_account_id IS NOT NULL;

-- 문제 2 
-- history_tb 에서 출금 내역과 출금 계좌 번호를 join 을 사용해서 출력 하시오 
SELECT h.*, a.number AS '출금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE w_account_id IS NOT NULL;

SELECT * FROM history_tb;
SELECT * FROM account_tb;
SELECT * FROM user_tb;

-- 쿼리 조건문을 활용하여, history_tb의 거래 유형을 입금/출금/이체로 구분하여 '비고'라는 컬럼으로 출력하시오.
SELECT *, CASE 
			WHEN (w_account_id IS NULL AND d_account_id IS NOT NULL) THEN '입금'
			WHEN (w_account_id IS NOT NULL AND d_account_id IS NULL) THEN '출금'
            WHEN (w_account_id IS NOT NULL AND d_account_id IS NOT NULL) THEN '이체'
		  END AS '비고'
FROM history_tb;
