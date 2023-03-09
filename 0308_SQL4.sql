-- 함수 FUNCTION
-- 수학 함수 : ABS(), CEIL(), FLOOR(), ROUND(), TRUNCATE() 등
-- 문자열 함수 : CONCAT(), LENGTH(), UPPER(), LOWER(), SUBSTR(), REPLACE() 등
-- 날짜 및 시간 함수 : NOW(), CURDATE(), CURTIME(), YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND(), DATE_FORMAT() 등
-- 조건 함수 : IF(), CASE(), COALESCE() 등
-- 집계 함수 : COUNT(), SUM(), AVG(), MAX(), MIN() 등


-- NOW() : 현재 날짜 시간
-- CURDATE() : 현재 날짜
-- CURTIME() : 현재 시간
SELECT now(), curdate(), curtime();

-- 문자열 함수
SELECT ASCII('U'); -- 문자열을 정수 값으로

SELECT char_length('my sql test안녕'); -- 문자열 길이 (공백 포함)
SELECT length('my sql test안녕'); -- byte 수 (공백 포함)

SELECT concat("green", "class", "       100%") AS title; -- 문자열 병합

SELECT concat_ws("->", "class", "mysql", "홍길동"); -- concat_ws("연결문자", "문자열1", "문자열2", ...) : 문자열 사이를 '연결문자'로 연결해서 병합

SELECT find_in_set('q', 's,q,l'); -- find_in_set("찾을문자", "문자1,문자2,문자3,...") : 문자 집합 내에 '찾을문자'가 몇 번째 위치에 존재하는지 (인덱스 아님, 1부터 시작)  # 문자 집합 사이 띄어쓰기 X

SELECT format(2500.123, 2);  -- format(실수, 소숫점자릿수n) : 실수를 소숫점 n번째 자리까지만 출력

SELECT lcase('HELLO JAVA');  -- 모두 소문자로 전환

SELECT ucase('hello java'); -- 모두 대문자로 전환

SELECT trim('          MY S Q L   '); -- 양끝 공백 제거 (문자열 사이 공백 제거 X)

SELECT replace('     MY   S Q L   ', ' ', '');  -- replace('문자열', '바꿀문자', '새문자') : '바꿀문자'들을 찾아서 '새문자'로 변환
                                                                          -- 활용 : ' '을 ''로 바꾸면 모든 공백 제거 가능

USE showdb;

-- MySQL Numberic function
SELECT * FROM buyTBL;

SELECT SUM(price) AS '상품가격 합'
FROM buyTBL;

-- 서브 쿼리
SELECT *, (SELECT SUM(price) from buyTBL) AS '총 합계'
FROM buyTBL;

-- AVG
SELECT *, (SELECT AVG(price) from buyTBL) AS '상품평균가격'
FROM buyTBL;

SELECT ceil(25.12); -- 올림
SELECT round(25.52); -- 반올림
SELECT round(25.52, 1); -- 반올림하고 소숫점 몇 번째 자리까지 표시할지 지정
SELECT floor(25.12); -- 내림

SELECT *,  MAX(price) FROM buyTBL; -- 최댓값

SELECT MIN(price) FROM buyTBL; -- 최솟값

-- SELECT @@GLOBAL.sql_mode;
-- SELECT @@SESSION.sql_mode;

-- *, 집계함수 안되면 이거 실행하고 SQL 다시 실행하면 됨
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';



