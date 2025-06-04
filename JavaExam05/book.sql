-- -------------------------------------------------------------
-- 정윤영 book
-- -------------------------------------------------------------

use book_db;

-- author table 생성
create table author(
	author_id		int				primary key		auto_increment,
    author_name		varchar(100)	not null,
    author_desc		varchar(500)
);

-- book table 생성
create table book(
	book_id		int				primary key		auto_increment,
    title		varchar(100)	not null,
    pubs		varchar(100),
    pub_date	datetime,
    author_id	int,
	constraint book_fk foreign key(author_id)
    references author(author_id)
);

-- author table 데이터 추가
insert into author values(null,'김문열','경북 영양');
insert into author values(null,'박경리','경상남도 통영');
insert into author values(null,'유시민','17대 국회의원');
insert into author values(null,'기안84','기안동에서 산 84년생');
insert into author values(null,'강풀','온라인 만화가 1세대');
insert into author values(null,'김영하','알쓸신잡출연');

-- book table 데이터 추가
insert into book values(null,'우리들의 일그러진 영웅','다림','1998-02-22',1);
insert into book values(null,'삼국지','민음사','2002-03-01',1);
insert into book values(null,'토지','마로니에북스','2012-08-15',2);
insert into book values(null,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);
insert into book values(null,'패션왕','중앙북스(books)','2012-02-22',4);
insert into book values(null,'순정만화','재미주의','2011-08-03',5);
insert into book values(null,'26년','재미주의','2012-02-04',5);

-- 테이블 조회
show tables;

-- book 데이터 조회
select	*
from book;

-- author 데이터 조회
select	*
from author;

-- 모든 데이터 조회 (where문)
select	bo.book_id,
		bo.title,
        bo.pubs,
        bo.pub_date,
        bo.author_id,
        au.author_id,
        au.author_name,
        au.author_desc
from book bo, author au
where bo.author_id = au.author_id
;

-- 모든 데이터 조회(join문)
select	bo.book_id,
		bo.title,
        bo.pubs,
        bo.pub_date,
        bo.author_id,
        au.author_id,
        au.author_name,
        au.author_desc
from book bo
join author au
on bo.author_id = au.author_id
;

-- 강풀작가의 설명의 데이터 변경(온라인 만화가 1세대 => 서울특별시)
update author
set author_desc = '서울특별시'
where author_id = 5
;

-- 김영하 데이터 삭제 쿼리문
delete from author
where author_id = 6
;

-- 기안84 데이터 삭제 쿼리문

-- 데이터가 삭제되지 않는 쿼리문
delete from author
where author_id = 4
;
-- author_id를 author 테이블에서만 사용하는 것이 아닌 book 테이블에서도 사용하기 때문이다

-- 데이터를 삭제할 수 있는 방법
delete from book
where author_id = 4;

delete from author
where author_id = 4;
-- 자식 데이터를 먼저 삭제한 후 부모 데이터를 삭제하는 방법