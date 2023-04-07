
/* 
	서브 쿼리 : 쿼리 내의 쿼리
    
	서브 쿼리는 쿼리의 위치가 어디에 있느냐에 따라서 세 가지 종류로 나눌 수 있음
		1. 중첩 서브 쿼리 (Nested SubQuery) : WHERE 절에 사용하는 서브 쿼리
		2. 인라인 뷰 (Inline View) : FROM 절에 사용하는 서브 쿼리
		3.  스칼라 서브 쿼리  (Scalar SubQuery) : SELECT 절에 사용하는 서브 쿼리 (권장 ㄴㄴ)
    
    내부 쿼리 (서브 쿼리)는 괄호로 반드시 감싸줘야 함
*/

-- db 생성 
create database reservationdb;
use reservationdb;

-- 예약 테이블 생성 
create table reservation(
	id int auto_increment, 
    name varchar(20) not null, 
    reserveDate date not null, 
    roomNum varchar(5) not null,
    primary key(id)
);

-- 고객 테이블 
create table customer(
	id int auto_increment, 
    name varchar(20) not null, 
    age int not null, 
    address varchar(10), 
    primary key(id)
);

-- 예약 테이블 데이터 생성 
insert into reservation values(1, '홍길동', '2020-04-01 00:00:00', 1);
insert into reservation values(2, '임꺽정', '2020-04-02 00:00:00', 2);
insert into reservation values(3, '장길산', '2020-04-03 00:00:00', 3);
insert into reservation values(4, '홍길동', '2020-04-04 00:00:00', 4);

-- 데이터 확인 
select * from reservation;

-- 데이터 수정 
update reservation set roomNum = '1001' where id = 1; 
update reservation set roomNum = '1002' where id = 2; 
update reservation set roomNum = '1003' where id = 3; 
update reservation set roomNum = '1004' where id = 4; 

-- 고객 테이블 데이터 생성 
select * from customer;

-- 고객 테이블 데이터 생성
insert into customer values(1, '홍길동', 20, '서울');
insert into customer values(2, '임꺽정', 30, '서울');
insert into customer values(3, '장길산', 24, '서울');
insert into customer values(4, '전우치', 33, '서울');

-- 고객 테이블 데이터 수정 
update customer set address = '인천' where id = 2;
update customer set address = '서울' where id = 3;
update customer set address = '수원' where id = 4;



-- 주소가 서울인 고객이 예약한 정보만을 뽑아 주세요.
SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN (SELECT name FROM customer WHERE address='서울');

SELECT r.id, reserveDate, roomNum, r.name
FROM reservation AS r
LEFT JOIN customer AS c
ON r.name = c.name
WHERE c.address = '서울';


-- FROM절 서브 쿼리
SELECT name, reservedRoom
FROM (
	SELECT name, reserveDate, roomNum AS reservedRoom
	FROM reservation
    WHERE roomNum > 1001
) AS reservationInfo; -- 반드시 테이블 이름을 설정해주어야 함

/*
	서브 쿼리의 특징
    서브 쿼리를 사용하면 다음과 같은 장점을 얻을 수 있다.
    
    쿼리를 구조화시킴
    -> 쿼리의 각 부분을 명확히 구분할 수 있게 함 (가독성 UP)
    
    서브쿼리는 복잡한 JOIN이나 UNION과 같은 동작을 수행할 수 있는 또 다른 방법을 제공함
    
    서브쿼리는 읽기 편함
    
    ! 스칼라 서브쿼리는 가능한 사용 ㄴㄴ
*/

select * from customer;
SELECT * FROM reservation;

-- 2020-04-02 예약 정보 확인
SELECT id, name
FROM customer
WHERE name IN (SELECT name FROM reservation WHERE reserveDate = '2020-04-02');

-- 고객 테이블에서 실제 예약한 고객 중 30살 이상인 고객 id, 이름, 나이, 주소, 예약일, 예약한 방 정보 출력

 