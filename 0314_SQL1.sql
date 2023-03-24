SHOW TABLES;

SELECT * FROM board;

SELECT * FROM user;

INSERT INTO board (title, content, userId)
VALUES ('테스트 글1', '테스트 내용1', 2);

SELECT * FROM board WHERE id = 4;

DELETE FROM board WHERE id = 5;