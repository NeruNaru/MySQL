-- ---------------------------------------
-- web계정
-- -----------------------------------------

use web_db;

-- #테이블 만들기
create table book(
    book_id	integer,
    title varchar(50),
    author varchar(20),
    pub_date datetime
);

-- 테이블에 칼럼 추가
ALTER TABLE book ADD pubs VARCHAR(50);

-- 테이블에 칼럼 수정
ALTER TABLE book MODIFY title VARCHAR(100);
ALTER TABLE book RENAME COLUMN title TO subject;

-- 테비블에 칼럼 삭제
alter table book drop author;

-- 테이블 이름 수정
rename table book to article;

-- 테이블 삭제
DROP TABLE article;

select	*
from book;


-- #작가 테이블 만들기
create table author(
		author_id 		int 			primary key,
        author_name		varchar(100)	not null,
        author_desc		varchar(500)	
);

-- #책 테이블 만들기
create table book(
		book_id		int				primary key,
        title		varchar(100)	not null,
        pubs		varchar(100),
        pub_date	datetime
);

select	*
from author;

-- #작가 데이터 insert
-- insert문
insert into author
values(1, '박경리', '토지작가');

insert into author			-- 데이터 갯수를 맞춰주어야함
values(2, '이문열', '');		-- 작가 설명에 ' ' 테이터를 입력하였음

insert into author			-- 데이터 갯수를 맞춰 주어야함
values(6, '박명수', null);	-- 작가 설명에 null은 실제 데이터가 없는 값

insert into author
values(1, '황일열','강사');

insert into author(author_id, author_name)
values(4, '정우성');

insert into author(author_id, author_desc)		-- 오류 author_name => not null 조건이 있기 때문
values(5, '런닝맨');								-- author_name 데이터가 꼭 있어야함

insert into author(author_name, author_desc)	-- 오류 author_id => primary key (unique + not null)
values('유재석','런닝맨');							-- author_id 데이터가 꼭 있어야한다(유니크해야 한다)

insert into author(author_desc, author_name, author_id)	-- 나열한 컬럼의 순서대로 값을 입력해주어야함
values('제주도','이효리',5);

-- 다양한 insert문으로 데이터 넣어보기
