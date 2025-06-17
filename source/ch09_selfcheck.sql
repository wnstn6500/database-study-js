-- 셀프체크
-- 8장에서 만든 market DB를 토대로 다음 1~4를 수행하는 쿼리를 작성하세요.
-- (ch08_09_market_db.png 참고)

USE market;

-- 1 다음은 모든 사용자 수를 세는 쿼리입니다. 
-- 이를 SELECT 절의 서브쿼리로 활용해 전체 사용자의 1인당 평균 결제 금액을 조회하세요.
SELECT COUNT(*)
FROM users;

-- ------------------
-- 1인당 평균 결제 금액
-- ------------------
-- 41790.0000

-- 정답: 
select sum(amount) / (
      SELECT COUNT(*)
      FROM users) as '1인당 평균 결제 금액'       
from payments;

-- 2 다음은 사용자 아이디별로 총 결제 금액을 집계하는 쿼리입니다.
-- 이를 FROM 절의 서브쿼리로 활용해 전체 사용자의 1인당 평균 결제 금액을 조회하세요.
SELECT u.id AS user_id, SUM(amount) AS total_amount
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN payments p ON o.id = p.order_id
GROUP BY u.id;

-- ------------------
-- 1인당 평균 결제 금액
-- ------------------
-- 41790.0000

-- 정답:
SELECT
avg(total_amount) as '1인당 평균 결제 금액'
FROM(
  SELECT u.id AS user_id, SUM(amount) AS total_amount
  FROM users u
  JOIN orders o ON u.id = o.user_id
  JOIN payments p ON o.id = p.order_id
  GROUP BY u.id
) as sub; -- from 절 서브쿼리 별칭 필수

-- 3 앞의 두 문제(1과 2)의 정답 쿼리를 실행하면 다음과 같이 동일한 결과가 나옵니다. 그 이유를 설명하세요.
-- ------------------
-- 1인당 평균 결제 금액
-- ------------------
-- 41790.0000

-- 정답: 모든 사용자가 결제에 참여했기 떄문
-- 1은 결제에 참여하지 않은 전체 인원으로 집계, 2는 진짜 결제한 사람만 집계


-- 4 다음은 최근에 배송받은 사용자의 아이디를 찾는 쿼리입니다.
-- 이를 WHERE 절의 서브쿼리로 활용해 해당 사용자의 총 결제 금액을 조회하세요.
SELECT user_id
FROM orders
WHERE status = '배송 완료'
ORDER BY created_at DESC
LIMIT 1;

-- 정답:
SELECT nickname, sum(amount)
from users u
join orders o on o.user_id = u.id
join payments p on p.order_id = o.id
WHERE u.id = (
    SELECT user_id
    FROM orders
    WHERE status = '배송 완료'
    ORDER BY created_at DESC
    LIMIT 1
)
GROUP BY nickname;



