CREATE DATABASE test1;
USE test1;

-- 1. 학생 테이블을 생성해주세요.
CREATE TABLE student (
	id INT PRIMARY KEY AUTO_INCREMENT, -- 학번
    name VARCHAR(10) NOT NULL, -- 이름
    grade INT NOT NULL -- 학년
);

-- 2. 상품 테이블을 생성하고 데이터 입력 쿼리 구문을 작성해주세요.
CREATE TABLE product (
    name VARCHAR(20) NOT NULL PRIMARY KEY, -- 이름
    price INT NOT NULL -- 가격
);

INSERT INTO product (name, price)
VALUES 
	('바나나', 3000),
    ('사과', 2000);

-- 3. 상품 테이블과 1:N 관계를 갖는 구매 테이블을 생성해주세요.
CREATE TABLE buy_product (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL, -- 구매자 id
    product_name VARCHAR(20) NOT NULL, -- 상품 이름
    amount INT NOT NULL, -- 구매 수량
	FOREIGN KEY (product_name) REFERENCES product(name)
);

-- 4. 구매 테이블에 데이터를 입력해주세요.
INSERT INTO buy_product(user_id, product_name, amount)
VALUES 
	(1, '사과', 2),
    (2, '바나나', 1),
    (3, '사과', 3);

-- 5. INNER JOIN 구문을 사용해서 결과 집합을 출력해주세요.
SELECT *
FROM buy_product AS b
INNER JOIN product AS p
ON b.product_name = p.name;


