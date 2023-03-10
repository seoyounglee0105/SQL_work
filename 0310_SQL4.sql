CREATE DATABASE test;
USE test;

DROP TABLE board;
DROP TABLE member;

CREATE TABLE board(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    writer VARCHAR(50) NOT NULL COMMENT '작성자',
    INDEX idx_parent_id(id),
    title VARCHAR(50) NOT NULL COMMENT '제목',
    content TEXT NOT NULL COMMENT '내용',
    regdate DATETIME NOT NULL COMMENT '등록일자',
    updatedate DATETIME NULL COMMENT '수정일자',
    deletedate DATETIME NULL COMMENT '삭제일자',
    FOREIGN KEY (writer) REFERENCES member(id)
);


CREATE TABLE member(
id  VARCHAR(50) NOT NULL COMMENT '아이디',
pw VARCHAR(100) NOT NULL COMMENT '비밀번호',
address_number VARCHAR(100) NULL COMMENT '우편번호',
address VARCHAR(100) NULL COMMENT '주소',
address_detail VARCHAR(100) NULL COMMENT '상세주소',
regdate DATETIME NOT NULL COMMENT '가입일자',
PRIMARY KEY(id)
);
ALTER TABLE member
    ADD CONSTRAINT FK_member_id_board_writer FOREIGN KEY (id)
        REFERENCES board (writer) ON DELETE RESTRICT ON UPDATE RESTRICT;