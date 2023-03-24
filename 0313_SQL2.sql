USE myblog;

-- user 테이블 생성
-- id : PK 부여
-- user_name : 사용자 이름 (100자 제한, NOT NULL, UNIQUE)
-- password : 비밀번호 (100자 제한, NOT NULL)
-- email : 이메일 (100자 제한, NOT NULL)
-- address : 주소 (100자 제한)
-- userRole : ADMIN, MANAGER, USER(일반사용자) -- 데이터 범주화 : Java의 Enum 타입
-- createDate : 회원 가입 날짜

CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP -- 시, 분, 초, 일자 확인
);


SELECT * FROM user;

-- 블로그 사이트
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB, -- 대용량 텍스트 데이터 타입
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY (userId) REFERENCES user(id)
);

-- user : reply = 1 : N
-- board : reply = 1 : N

-- 댓글
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY (boardId) REFERENCES board(id),
    FOREIGN KEY (userid) REFERENCES user(id)
);

SELECT * FROM board;
SELECT * FROM reply;

INSERT INTO user (userName, password, email, address, userRole, createDate)
VALUES ('티모', '1234', 'a@naver.com', '부산시 중구', 'USER', NOW());

SELECT * FROM user
WHERE userName = '이순신' AND password = '5678';

SELECT * FROM board;

DELETE FROM board;

INSERT INTO board(title, content, userId)
VALUES ('첫 번째 게시글', '자바는 쉬운 거예요', 9);

SELECT * FROM board;

ALTER TABLE board
MODIFY content TEXT;

DELETE FROM board WHERE id = 2;  -- 삭제할 행이 없더라도 성공으로 출력
