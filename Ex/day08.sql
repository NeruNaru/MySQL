-- ----------------------------------------------------------------------
-- web 계정 -02
-- ----------------------------------------------------------------------
use web_db;

-- 계정삭제
drop table author;
drop table book;

show databases;

-- 작가 테이블 생성
create table author(
	author_id 		int				primary key		auto_increment,
    author_name		varchar(100)	not null,
    author_desc		varchar(500)	
);

insert into author
values(null, '박경리', '토지작가');

insert into author
values(null, '이문열', '');

insert into author(author_desc, author_name)
values('런닝맨', '유재석');

-- ----------------------------------------------
-- 데이터 삭제

delete from author
where author_id = 3
;

delete from author;		-- 전체삭제

-- 데이터 수정
-- update author set 컬럼명=값, 컬럼명=값, 컬럼명=값 조건절;

-- 조건절이 없으면 모든 데이터가 변경되니 조심해야한다
-- update author set author_name = '기안84', author_desc = '웹툰작가';

-- 조건절(where)을 꼭 사용해야 한다 (pk로 조건절 작성하기)
update author
set author_name = '기안84',
	author_desc = '웹툰작가'
where author_id = 1;

update author
set author_name = '서장훈',
	author_desc = '농구선수'
where author_id >= 1;

select	*
from author;

show tables;