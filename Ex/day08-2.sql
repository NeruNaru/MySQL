-- --------------------------------------------------------
-- web계정-03
-- --------------------------------------------------------

-- 테이블 삭제
drop table author;
drop table book;

-- 테이블 리스트보기
show tables;

-- 테이블 생성
create table author(
	author_id 		int				primary key		auto_increment,
    author_name		varchar(100)	not null,
    author_desc		varchar(500)	
);

create table book(
	book_id		int				primary key		auto_increment,
    title		varchar(100)	not null,
    pubs		varchar(100),
    pub_date	datetime,
    author_id	int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);


-- 작가 데이터 입력
insert into author
values(null,'이문열','경북 영양');

insert into author
values(null,'박경리','경남 통영');

select	*
from author;

-- 책 데이터 입력
insert into book	values(null, '우리들의 일그러진 영웅','다림','1988-02-22',1);
insert into book	values(null, '삼국지','민음사','2002-03-01',1);
insert into book	values(null, '토지','마로니에북스','2012-08-15',2);
insert into book	values(null, '유시민의 글쓰기 특강','생각의길','2015-04-01',3);		-- 안되는 이유: 작가id가 3인 자료가 없기 때문

select	book_id,
		title,
        pubs,
        pub_date,
        author_id
from book;

-- 전체조회


-- 경북 영양 => 서울
update author
set author_desc = '서울'
where author_id = 1;

-- 우리들의 일그러진 영웅 책 삭제
delete from book
where title = '우리들의 일그러진 영웅';

-- 작가 박경리 삭제
delete from author
where author_name = '박경리';
-- 삭제 불가능 데이터 추가 방법이 safty방식이였기 때문에 삭제를 위해서는 해당 데이터 전부를 지워야한다

delete from author
where author_id = 2;
-- 삭제 불가능 author_id를 author 테이블 뿐만 아니라 book 테이블에서도 사용하고 있기 때문에 삭제가 불가능하다

-- 전체조회(코드)
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