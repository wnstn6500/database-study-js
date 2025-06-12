-- 1. 자료형 확인 문제

-- 자료형에 대한 문제를 읽고 답하세요.(주관식)

-- 문제 1
-- 다음 쿼리에서 id 칼럼의 자료형으로 SMALLINT가 적합한 이유를 설명하세요.

CREATE TABLE employees (
	id SMALLINT UNSIGNED,
	age TINYINT,
	salary INTEGER,
	PRIMARY KEY (id)
);

-- 정답: 메모리를 절약하면서 65,535까지의 정수를 저장할 수 있기 때문이다.


-- 문제 2
-- 다음 쿼리에서 DECIMAL(5, 2) 자료형의 의미는 무엇입니까?

CREATE TABLE products (
	id INTEGER,
	price DECIMAL(5, 2),
	...
);

-- 정답: 최대 5자리 실수를 저장하며, 소수점 이하 2자리를 포함한다.


-- 문제 3
-- 다음 쿼리에서 VARCHAR(50)과 CHAR(50)의 주요 차이점은 무엇입니까?

CREATE TABLE users (
	username VARCHAR(50),
	password CHAR(50),
	...
);

-- 정답: varchar(50)은 50자까지 가변길이 문자열을 저장하지만 char(50)은 고정 길이 문자열을 저장.


-- 문제 4
-- 다음 쿼리에서 DATETIME과 DATE의 주요 차이점은 무엇입니까?

CREATE TABLE events (
	event_id INTEGER,
	start_time DATETIME,
	event_date DATE,
	...
);

-- 정답: DATETIME은 날짜와 시간을 모두 저장하는 타입이지만 
-- DATE는 날짜만 저장하는 타입이다.


-- 문제 5
-- 다음 쿼리에서 ENUM 자료형이 사용된 이유를 설명하세요.

CREATE TABLE employees (
	id INTEGER,
	gender ENUM('M', 'F'),
	...
);

-- 정답: 성별의 입력값을 제한하기 위해서


-- 문제 6
-- 다음 쿼리에서 BLOB 자료형은 어떤 데이터를 저장하는 데 적합합니까?

CREATE TABLE files (
	file_id INTEGER,
	file_data BLOB NOT NULL,
	...
);

-- 정답: 크기가 큰 파일


-- 문제 7
-- 다음 쿼리에서 FLOAT와 DOUBLE의 차이점을 설명하세요.

CREATE TABLE measurements (
	id INTEGER,
	value FLOAT,
	precise_value DOUBLE,
	...
);

-- 정답: 둘 다 부동소수점 방식의 실수를 저장하며 차지하는 메모리 크기가 달라 float는 4바이트 double은
-- 8바이트를 차지한다. double은 float 보다 더 넓은 범위의
-- 실수를 저장해 좀 더 정밀하게 표현할 수 있다. 


-- 문제 8
-- 다음 쿼리에서 DATE 자료형이 저장할 수 있는 값의 범위는 무엇입니까?

CREATE TABLE schedules ( id INTEGER,
	meeting_date DATE,
	...
);

-- 정답: 1000-01-01 부터 9999-12-31 까지


-- 2. LIKE 연산자, 날짜/시간 함수, BETWEEN 연산자 확인 문제

-- 다음 문제를 읽고 답하세요.(주관식 문제)

-- 문제 1
-- LIKE 연산자를 사용할 때 _(언더스코어)의 역할은 무엇입니까?

-- 정답: _는 정확히 임의의 한 글자를 대체한다. 예로 _ㅇㅇ 면 김ㅇㅇ 백ㅇㅇ 로 끝나게 된다.


-- 문제 2
-- 다음 WHERE 절이 의미하는바를 설명하세요.

WHERE customer_name LIKE '박__';

-- 정답: 박으로 시작하는 3글자 customer_name을 찾는다


-- 문제 3
-- 날짜에서 월을 추출하는 함수는 무엇입니까?

-- 정답: month()


-- 문제 4
-- 다음 쿼리의 결과는 무엇입니까?

-- SELECT EXTRACT(DAY FROM '2024-01-15');

-- 정답: 15


-- 문제 5
-- 다음 쿼리의 결과는 무엇입니까?

-- SELECT HOUR('15:45:20');

-- 정답: 15


-- 문제 6
-- 다음 쿼리의 조건에 해당하는 고객 이름을 [보기]에서 모두 고르세요. 

WHERE customer_name LIKE '%현%';

-- [보기] 안현준, 현철수, 박영희, 정수현, 김준호

-- 정답: 안현준,현철수,정수현


-- 문제 7
-- 다음 WHERE 절의 조건이 의미하는바를 설명하세요. 

WHERE HOUR(order_time) BETWEEN 9 AND 17;

-- 정답: order_time 컬럼의 시에서 9~17사이 를 의미한다


-- 3. 자료형에 따른 필터링 연습 문제

-- 다음 이벤트(events) 테이블을 보고 문제에 답하세요.
CREATE DATABASE quiz;
USE quiz;

-- events 테이블  생성
CREATE TABLE events (
	id INTEGER,           -- ID
	title VARCHAR(100),   -- 이벤트 제목
	event_date DATE,      -- 이벤트 날짜
	start_time TIME,      -- 시작 시간
	location VARCHAR(50), -- 장소
	attendees INT,        -- 참석자 수
	PRIMARY KEY (id)
);

-- events 데이터  삽입
INSERT INTO events (id, title, event_date, start_time, location, attendees)
VALUES
	(1, '코딩  부트캠프', '2023-10-01', '09:00:00', '서울', 50), 
	(2, 'AI 세미나', '2023-10-15', '14:00:00', '부산', 100), 
	(3, '데이터  분석  워크숍', '2023-11-05', '10:30:00', '서울', 30), 
	(4, '스타트업  데모데이', '2023-12-10', '13:00:00', '대전', 200), 
	(5, '클라우드  컨퍼런스', '2024-01-20', '11:15:00', '인천', 150), 
	(6, '해커톤', '2024-02-05', '08:00:00', '서울', 300),
	(7, 'UX/UI 디자인  워크숍', '2023-09-25', '09:30:00', '광주', 25), 
	(8, '기술  트렌드  토크', '2023-11-20', '15:00:00', '서울', 80), 
	(9, '프로그래밍  대회', '2023-12-01', '10:00:00', '부산', 120), 
	(10, '오픈소스  컨트리뷰션  데이', '2023-10-25', '16:00:00', '서울', 60);

-- 문제 1
-- 이벤트 제목에 '워크숍'이 포함된 이벤트의 제목과 장소를 조회하세요.

-- 정답: 
select title , location
from events
WHERE title Like '%워크숍%';



-- 문제 2
-- 이벤트 제목이 '데이터'로 시작하는 이벤트의 제목과 참석자 수를 조회하세요. 

-- 정답:
select title, attendees
from events
WHERE title LIKE '데이터%';


-- 문제 3
-- 이벤트 날짜가 2023년인 이벤트의 제목과 날짜를 조회하세요.

-- 정답:
select title, event_date
FROM events
WHERE YEAR(event_date) = '2023';



-- 문제 4
-- 이벤트 시작 시간이 오전 9시 이전인 이벤트의 제목과 시작 시간을 조회하세요.

-- 정답:
select title, start_time
from events
WHERE hour(start_time) < '09';


-- 문제 5
-- 참석자가 50명 이상 150명 이하인 이벤트의 제목과 참석자 수를 조회하세요.

-- 정답:
select title,attendees
from events
where attendees BETWEEN 50 and 150;


-- 문제 6
-- 이벤트 날짜가 2023-10-01부터 2023-12-31 사이인 이벤트의 제목과 날짜를 조회하세요.

-- 정답:
select title,event_date
from events
where event_date BETWEEN '2023-10-01' and '2023-12-31';


-- 문제 7
-- 이벤트 제목에 '컨퍼런스' 또는 '컨트리뷰션'이 포함되고, 
-- 시작 시간이 오전 11시 이후인(오전 11시 00분 포함) 이벤트의 제목과 시작 시간을 조회하세요.

-- 정답:
select title, start_time
from events
where (title Like '%컨퍼런스%' or title Like '%컨트리뷰션%')
			and HOUR(start_time) >= 11;


-- 문제 8
-- 이벤트 날짜가 2023-11-1부터 2023-12-31 사이고, 
-- 시작 시간이 오후 2시 이후인(오후 2시 00분 포함) 이벤트의 제목과 날짜, 시작 시간을 조회하세요.

-- 정답:
select title, event_date, start_time
from events
WHERE event_date BETWEEN '2023-11-1' and '2023-12-31' and
			HOUR(start_time) >= 14;

