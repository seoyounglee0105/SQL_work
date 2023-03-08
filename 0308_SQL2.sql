-- JOIN

CREATE DATABASE showdb;
USE showdb;

-- 코딩 컨벤션을 카멜 노테이션 기법으로 사용해보기

-- 회원 정보
CREATE TABLE userTBL (
	userName CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(10) NOT NULL, -- ALTER 써보게 일부러 틀리게 씀
    PRIMARY KEY (userName)
);

ALTER TABLE userTBL
MODIFY mobile VARCHAR(13) NOT NULL;

-- userTBL와 bUYTBL은 1 : N 관계
-- 구매 이력 정보
CREATE TABLE buyTBL (
	userName CHAR(3) NOT NULL,
    productName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (userName) REFERENCES userTBL(userName)
);

INSERT INTO userTBL VALUES('이승기', 1987, '서울', '010-1234-1234');
INSERT INTO userTBL VALUES('홍길동', 1911, '부산', '010-2222-3333');
INSERT INTO userTBL VALUES('이순신', 1999, '대구', '010-3333-4444');

INSERT INTO buyTBL VALUES('이승기', '운동화', 50, 1);
INSERT INTO buyTBL VALUES('이승기', '노트북', 150, 1);
INSERT INTO buyTBL VALUES('홍길동', '책', 10, 5);
INSERT INTO buyTBL VALUES('홍길동', '모니터', 200, 2);
INSERT INTO buyTBL VALUES('이순신', '청바지', 40, 1);
INSERT INTO buyTBL VALUES('이순신', '책', 10, 3);

-- 현재 부모 테이블에 야스오가 존재하지 않아 buyTBL에 추가할 수 없음
-- INSERT INTO buyTBL VALUES('야스오', '책', 10, 3);

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- INNER JOIN
SELECT * 
FROM userTBL -- 기준 테이블
INNER JOIN buyTBL -- 조인할 테이블
ON userTBL.userName = buyTBL.userName;

-- LEFT JOIN 
-- 기준 테이블(FROM)의 데이터는 모두 보존됨
SELECT *
FROM userTBL -- 기준 테이블
LEFT JOIN buyTBL -- 조인 대상 테이블
ON userTBL.userName = buyTBL.userName;

-- 야스오 회원 가입 
-- -> 야스오는 userTBL에만 존재하므로 INNER JOIN에서는 나타나지 않고, LEFT JOIN에서는 나타남
INSERT INTO userTBL(userName, birthYear, addr, mobile)
VALUES ('야스오', 2020, '부산', '010-1111-1111');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.userName = buyTBL.userName
WHERE buyTBL.userName IS NOT NULL;  -- buyTBL 정보가 NULL이 아닌 것들만 (해당 조건에 쓰는 컬럼이 기본키면 더 정확한 결과)

-- AS(별칭) 구문 사용하기

SELECT *
FROM userTBL AS u -- userTBL을 'U'라고 부르겠다.
INNER JOIN buyTBL AS b -- buyTBL을 'B'라고 부르겠다.
ON u.userName = b.userName;

SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.userName IS NOT NULL;

-- 고민해볼 것 : LEFT JOIN의 기준 테이블 선정
-- 기준 테이블 선정에 따라 다른 결과 집합이 나타날 수 있음
-- 기준 테이블은 더 적은 데이터를 가진 테이블으로 선정하는 것이 좋음
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.userName = u.userName;

-- RIGHT JOIN
SELECT *
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.userName = b.userName;

-- 문제 3개 만들어 보기

-- 문제 1. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고, 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
SELECT SUM(amount) AS '구입 물품 개수'
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.userName = u.userName
WHERE u.birthYear = 1999;

-- 문제 2. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고,  '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
SELECT u.userName AS '이름', u.mobile AS '전화번호'
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.productName = '책';

-- 문제 3. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고,  '대구'에 사는 사람이 구매한 물품들을 출력하시오.
SELECT productName AS '물품'
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.userName = u.userName
WHERE u.addr = '대구';


-- 다른 학생들이 낸 문제도 풀어보기

-- 1. 성이 '이'씨면서, 태어난 년도가 1999년인 사람이 구매한 아이템 정보를 표시하시오.
SELECT productName
FROM buyTBL AS b
INNER JOIN userTBL AS u
ON b.userName = u.userName
WHERE (u.userName LIKE '이%') AND (u.birthYear = 1999);

-- 2. 기준 테이블로 userTBL을 사용해서 LEFT JOIN을 수행하고, 주문자 이름, 주소, 전화번호, 상품이름, 가격, 주문수량을 출력하시오.
-- (단, 주문 정보가 없는 경우 출력하지 않음)
SELECT u.userName AS '이름', u.addr AS '주소', u.mobile AS '전화번호', b.productName AS '상품', b.price AS '가격', b.amount AS '주문수량'
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.userName IS NOT NULL;

-- 3. LEFT JOIN을 사용해서 NULL 값도 확인할 수 있게 출력하시오.
SELECT *
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.userName = b.userName;

-- 4. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, 주문 수량이 3개 이상인 데이터만 조회하시오.
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userName = b.userName
WHERE b.amount >= 3;

-- 5. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고, userTBL의 userName이 '이승기' 또는 '야스오'이면서, buyTBL의 userName이 NULL이 아닌 데이터만 조회하시오.
SELECT *
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON b.userName = u.userName
WHERE (u.userName IN ('이승기', '야스오')) AND (b.userName IS NOT NULL);
 
