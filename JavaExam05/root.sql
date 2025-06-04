-- -------------------------------------------
-- 정윤영 root
-- -------------------------------------------

-- 계정 만들기 (계정명 book / 비밀번호 book) => 모든 ip로 접속 가능
create user 'book'@'%' identified by 'book';

-- database 만들기(book_db)
create database book_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

-- 권한 부여(모든권한)
grant all privileges on book_db.* to 'book'@'%' ;

-- 데이터베이스 선택
use book_db;

-- 데이터베이스 조회
show databases;