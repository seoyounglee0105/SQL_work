-- 1단계 --

SELECT * FROM history_tb;

-- 1번 계좌의 출금 내역
SELECT * FROM history_tb WHERE w_account_id = 1;

-- 1번 계좌의 입금 내역
SELECT * FROM history_tb WHERE d_account_id = 1;

-- 1번 계좌의 입금 내역에 계좌번호를 포함해서 출력
SELECT h.id, h.amount, h.d_account_id, h.d_balance, a.number, h.created_at
   FROM history_tb AS h
     JOIN account_tb AS a
		 ON h.d_account_id = a.id
 WHERE h.d_account_id = 1;

-- 1번 계좌의 출금 내역에 계좌번호를 포함해서 출력
SELECT h.id, h.amount, h.w_account_id, h.w_balance, a.number, h.created_at
FROM history_tb AS h
JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE h.w_account_id = 1; 


-- 2단계 --

-- 1번 계좌의 출금 내역																				-- ifnull(a, b) : a가 null이면 b 출력
SELECT h.id, h.amount, h.w_balance, wa.number AS 'sender', ifnull(h.d_account_id, 'ATM') AS 'receiver'
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.w_account_id = 1;

-- 1번 계좌의 입금 내역
SELECT h.id, h.amount, h.d_balance, da.number AS 'receiver', ifnull(h.w_account_id, 'ATM') AS 'sender'
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.d_account_id = 1;


-- 3단계 --

-- 1번 계좌의 출금 내역
-- 목표 : d_account_id를 계좌번호로 변경해서 표시하기
SELECT h.id, h.amount, h.w_balance, wa.number AS 'sender', ifnull(h.d_account_id, 'ATM') AS 'receiver', da.number
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_Tb AS da -- 별칭을 지정해서 같은 테이블에 대해 여러 번 조인 가능
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- 1번 계좌의 입금 내역
-- 목표 : w_account_id를 계좌번호로 변경해서 표시하기
SELECT h.id, h.amount, h.d_balance, da.number AS 'receiver', ifnull(h.w_account_id, 'ATM'), wa.number AS 'sender'
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 2;

-- 출금 내역 + 입금 내역
SELECT h.id, h.amount, h.w_balance, wa.number AS 'sender', ifnull(h.d_account_id, 'ATM') AS 'receiver', da.number
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_Tb AS da -- 별칭을 지정해서 같은 테이블에 대해 여러 번 조인 가능
ON h.d_account_id = da.id
WHERE h.w_account_id = 1 OR h.d_account_id = 1;


-- 입금 내역
SELECT h.id, h.amount, h.d_balance AS balance, h.created_at, 
				ifnull(wa.number, 'ATM') AS 'sender', da.number AS 'receiver'
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
on h.w_account_id = wa.id
WHERE h.d_account_id = 2;

-- 출금 내역
SELECT h.id, h.amount, h.w_balance AS balance, h.created_at, 
				ifnull(da.number, 'ATM') AS 'sender', wa.number AS 'receiver'
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;


-- 상황에 따라 동적으로 결과를 보여주자.
-- CASE WHEN THEN END

-- CASE 
-- 		WHEN a THEN a1
-- 		WHEN b THEN b1
-- 		END AS '별칭'
-- a이면 a1를 출력하고, b이면 b1를 출력하라.
-- 그리고 해당 속성을 '별칭'이라고 표시하라.

SELECT h.id, h.amount,
				CASE 
						WHEN h.w_account_id = 1 THEN (h.w_balance)
						WHEN h.d_account_id = 1 THEN (h.d_balance)
				END AS balance,
				ifnull(wa.number, 'ATM') AS 'sender',
				ifnull(da.number, 'ATM') AS 'receiver',
				h.created_at
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 OR h.w_account_id = 1;


			SELECT h.id, h.amount,
				CASE 
					WHEN h.w_account_id = 1 THEN (h.w_balance)
					WHEN h.d_account_id = 1 THEN (h.d_balance)
				END AS balance,
				ifnull(wa.number, 'ATM') AS 'sender',
				ifnull(da.number, 'ATM') AS 'receiver',
				h.created_at
			FROM history_tb AS h
			LEFT JOIN account_tb AS da
			ON h.d_account_id = da.id
			LEFT JOIN account_tb AS wa
			ON h.w_account_id = wa.id
			WHERE h.d_account_id = 1 OR h.w_account_id = 1;
