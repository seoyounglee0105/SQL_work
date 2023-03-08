-- DELETE
-- 특정 테이블에서 특정 조건을 만족하는 행을 삭제
-- 삭제하고 나면 복구하기 어려움
-- 사용하기 전, 데이터를 백업하거나 테스트용 데이터를 사용할 것.

CREATE TABLE product (
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	description VARCHAR(200)
);

INSERT INTO product (id, name, price, description) 
VALUES
	(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
	(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
	(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
	(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
	(5, '아이패드', 800000, 'Apple의 태블릿'),
	(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
	(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
	(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
	(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
	(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

DELETE FROM product WHERE id = 5;
DELETE FROM product WHERE name = '맥북 에어';

-- 가격이 1,000,000원 이상인 제품 삭제
DELETE FROM product WHERE price >= 1000000;

-- id가 2 or 3인 제품 삭제
DELETE FROM product WHERE id IN (2, 3);

SELECT * FROM product;

-- LIKE 사용해보기 : 갤럭시가 포함된 것들 삭제
DELETE FROM product WHERE name LIKE '%갤럭시%';

-- 이름이 에어팟 프로이거나, 설명이 삼성을 포함하는 제품 삭제
DELETE FROM product WHERE (name = '에어팟 프로') OR (description LIKE '%삼성%');







