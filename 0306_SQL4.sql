SHOW CREATE TABLE `order`;

-- DROP TABLE `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  customer_order VARCHAR(50) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

INSERT INTO `order`
VALUES (1, '신발주문', '워커', 1, '2023-03-06');

SELECT * FROM `order`;

INSERT INTO `order`
VALUES (2, '신발주문', '구두', 1, 20230306);

-- INSERT INTO `order`
-- VALUES (3, '신발주문', '샌들', 1, 20222225); -- 월/일 범위 밖의 값으로 입력하면 알아서 거부함

-- DATE 타입에 값을 넣을 때, 작은따옴표나 큰따옴표를 사용해도 되고 정수값을 입력해도 됨.
-- 단, 날짜 형식에 맞는 값이어야 함


-- AUTO_INCREMENT (오토 인크리먼트)
-- 자동으로 순차적인 번호를 생성해주는 기능
-- 기본키에 활용
-- 새로운 레코드를 삽입할 때마다 기본키 값이 자동으로 증가하며, 중복된 값이 입력되지 않도록 보장함
-- 데이터의 일련번호를 자동으로 생성함

-- 고객 테이블 생성
CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY, -- INSERT할 때 id를 생략할 수 있게 됨
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50), 
    address VARCHAR(100) NOT NULL
);

INSERT INTO customer(name, email, address)
VALUES 
	('김철수', '@naver.com', '해운대구'),
    ('박길수', '@daum.net', '기장군'),
    ('권영수', '@kakao.com', '중구');

SELECT * FROM customer;





