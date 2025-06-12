-- 셀프체크
-- 5장에서 만든 orders(주문) 테이블을 이용해 다음 1~5를 수행하는 쿼리를 작성하세요.
use store;


-- 1 상품명이 '국내산'으로 시작하는 주문의 개수를 구하세요.
SELECT count(*)
from orders
WHERE name LIKE '국내산%';
-- 2 주문 수량이 2~4개인 상품의 평균 가격을 구하세요.
SELECT avg(price)
from orders
WHERE quantity BETWEEN 2 and 4;
-- 3 11월 주문 중 11월 20일 이후에 들어온 주문의 개수를 구하세요.
select count(*)
from orders
where MONTH(created_at) = 11 and DAY(created_at) > 20;

-- 4 상품명에 부피 단위인 'ml' 또는 'l'가 포함된 주문을 모두 조회하세요.
SELECT *
from orders
WHERE name like '%l%';

-- 5 10월과 12월에 들어온 주문의 개수를 구하세요(주의: 11월은 포함하지 않습니다).
select count(*)
from orders
WHERE MONTH(created_at) = 10 or MONTH(created_at) = 12;

-- in 연산자 사용 버전
select count(*)
from orders
WHERE MONTH(created_at) in(10,12);


