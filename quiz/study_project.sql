-- study_project 데이터베이스 생성
CREATE DATABASE study_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 생성된 데이터베이스 사용
USE study_project;

-- 학생(student) 테이블 생성
CREATE TABLE student (
    student_no INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    student_age INT
);

-- 학생 정보 추가
INSERT INTO student (student_name, student_age)
VALUES ('홍길동', 20),
       ('김철수', 22),
       ('이영희', 21);

       SELECT * from student;


USE study_project;
CREATE TABLE product (
    product_no INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price INT,
    product_category INT
);

INSERT INTO product (product_name, product_price, product_category)
VALUES 
('노트북', 1500000, 1),
('핸드폰', 1000000, 1),
('셔츠', 20000, 2),
('젤리', 1500, 3);
SELECT * FROM product;

-- maven_project 데이터베이스 생성
CREATE DATABASE maven_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 생성된 데이터베이스 사용
USE maven_project;

-- 회원(member) 테이블 생성
CREATE TABLE member (
    member_no INT AUTO_INCREMENT PRIMARY KEY,
    member_id VARCHAR(50),
    member_pw VARCHAR(100)
);

-- 게시판(board) 테이블 생성
CREATE TABLE board (
	board_no INT AUTO_INCREMENT PRIMARY KEY,
  board_title VARCHAR(100) NOT NULL,
  board_content TEXT,
  board_writer INT NOT NULL,
  reg_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  mod_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 첨부파일(attach) 테이블 생성
CREATE TABLE attach (
  attach_no INT AUTO_INCREMENT PRIMARY KEY,
  board_no INT NOT NULL,                         
  ori_name VARCHAR(255) NOT NULL,           
  re_name VARCHAR(255) NOT NULL,             
  reg_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('1', '테스트 게시글1', 1);

select B.*, M.member_id
from board B
join 'member' M on B.board_writer = M.member_no;

INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('1', '테스트 게시글1', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('2', '테스트 게시글2', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('3', '테스트 게시글3', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('4', '테스트 게시글4', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('5', '테스트 게시글5', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('6', '테스트 게시글6', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('7', '테스트 게시글7', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('8', '테스트 게시글8', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('9', '테스트 게시글9', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('10', '테스트 게시글10', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('11', '테스트 게시글11', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('12', '테스트 게시글13', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('13', '테스트 게시글13', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('14', '테스트 게시글14', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('15', '테스트 게시글15', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('16', '테스트 게시글16', 1);

select * from board;