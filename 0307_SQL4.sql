-- DROP TABLE `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  order_name VARCHAR(20) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

INSERT INTO `order` (id, order_name, product_name, quantity, order_date) 
VALUES
(1, '홍길동', '피자', 2, '2022-02-26'),
(2, '김영희', '치킨', 3, '2022-02-26'),
(3, '이철수', '햄버거', 1, '2022-02-27'),
(4, '박지민', '스테이크', 2, '2022-02-27'),
(5, '최영희', '짬뽕', 1, '2022-02-27'),
(6, '박서준', '초밥', 3, '2022-02-28'),
(7, '김민지', '파스타', 2, '2022-02-28'),
(8, '정재은', '토스트', 1, '2022-02-28'),
(9, '신은주', '감바스', 2, '2022-03-01'),
(10, '유지훈', '돈까스', 1, '2022-03-01');

SELECT * FROM `order`;

DESC `order`;

-- 1. id가 1인 주문의 상품 수량을 5개로 변경
UPDATE `order`
SET quantity = 5
WHERE id = 1;

-- 2. id가 3인 주문의 상품메뉴를 감바스로 변경
UPDATE `order`
SET product_name = '감바스'
WHERE id = 3;

-- 3. id가 5인 주문의 주문일자를 2022-01-05로 수정
UPDATE `order`
SET order_date = 20220105
WHERE id = 5;

-- 테이블 구조 변경 - 컬럼 추가
ALTER TABLE `order`
ADD COLUMN address VARCHAR(100);

-- 문제
-- 주문 수량이 2개 이상이고, 상품명이 '피자'인 주문의 수령인 이름을 '김철수'로 수정
UPDATE `order`
SET order_name = '김철수'
WHERE (quantity >= 2) AND (product_name = '피자');

-- 주문 날짜가 '2022-02-28'이고, 상품명이 '초밥'인 주문의 주문 수량을 5개로 수정
UPDATE `order` 
SET 
    quantity = 5
WHERE
    (order_date = '2022-02-28')
        AND (product_name = '초밥');

-- 주문 수량이 1개 이하이고, 상품명이 '감바스'인 주문의 수령인 주소를 '경기도 성남시'로 수정
UPDATE `order`
SET address = '경기도 성남시'
WHERE (quantity <= 1) AND (product_name = '감바스');

