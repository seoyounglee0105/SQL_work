
-- blog
-- 서버 프로그램 구현 - MYSQL <- 서버

CREATE DATABASE myblog;
USE myblog;

-- 사용자 생성 : CREATE USER '사용자명'@'호스트명' IDENTIFIED BY '비밀번호';
CREATE USER 'blog_user'@'%' IDENTIFIED BY '1q2w3e4r5t';
-- 사용자명 : 생성할 계정의 이름
-- 호스트명 : 해당 계정이 접근 가능한 호스트 이름 (% : 모든 호스트)
-- 비밀번호 : 해당 계정의 비밀번호

-- 사용자 기본 권한 조회 : DB 선택
USE mysql;
-- host : localhost -> 지금 컴퓨터에서만 접근 가능
-- host : % -> 어디서든 접근 가능
SELECT user, host FROM user;

-- N : 해당 권한이 없는 상태 (기본값 : 전부 N)
SELECT * FROM user WHERE user = 'blog_user';

-- 모든 DB에 대한 모든 권한 부여 
--          권한                    모든 DB, 모든 테이블        사용자
GRANT ALL PRIVILEGES ON *.* TO 'blog_user'@'%';
-- GRANT 권한 ON DB명.테이블명 TO '사용자명'@'호스트명';
-- 권한 : SELECT, INSERT, UPDATE, DELETE 등
--           모든 권한 : ALL PRIVILEGES
-- DB명 : 권한을 부여할 데이터베이스 이름 (모든 DB : *)
-- 테이블명 : 권한을 부여할 테이블 이름 (모든 테이블 : *)

-- 적용한 권한을 즉시 적용하는 명령어
FLUSH PRIVILEGES;

-- 홈에서 사용자 생성 -> Username 항목에 방금 만든 사용자명 입력


