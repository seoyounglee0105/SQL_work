-- TodoList 기능 개발

CREATE DATABASE todo_db;
USE todo_db;

-- CREATE -> 데이터 정의어 (DDL)

-- 할일 목록 테이블 (todoList 테이블)
-- 각 할 일은 고유한 ID 값을 가짐
-- 제목, 내용, 우선순위, 완료 여부, 생성일자 정의

CREATE TABLE todoList (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 현재 시간/날짜 자동으로 들감
);

-- 카테고리 테이블 (category 테이블)
-- 각 카테고리는 고유한 ID 값을 가짐
-- 이름 정의


CREATE TABLE category (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- todoList와 category 테이블의 관계를 생각해보아야 함
-- todoList : category = N : 1

ALTER TABLE todoList
ADD COLUMN categoryId INT NOT NULL,
ADD CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES category(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

SELECT * FROM category;
DESC category;

-- 샘플 데이터
INSERT INTO category (name)
VALUES 
	('운동'),
	('공부'),
    ('모임'),
    ('집안일');

SELECT * FROM todolist;
DESC todolist;

SELECT * FROM todolist AS t
INNER JOIN category AS c
ON t.categoryId = c.id;
