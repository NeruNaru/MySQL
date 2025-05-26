use hr_db;

select	first_name fname,
		salary s
from employees
where s >= 10000
order by s desc
;

/***********************************
* 단일행 함수
***********************************/
-- 단일행 함수 > 숫자함수

-- *round() : 반올림
-- 123.123 => 123.12
select	round(123.123, 2),		-- 123.123을 소수점 2자리까지 표현
		round(123.126, 2),		-- 123.126을 소수점 3자리에서 반올림
        round(234.567, 0),		-- 235
        round(123.124, -1),		-- 120
        round(125.126, -2)		-- 100
from dual;

-- * ceil : 올림	0번째자리까지 표현(소수점 1자리에서 버림)
select	ceil(123.456),		-- 124
		ceil(123.789),		-- 124
        ceil(987.1234)		-- 988
from dual;

-- * floor() : 내림
select	floor(123.456),		-- 123
		floor(123.789),		-- 123
        floor(123.789123),	-- 123
        floor(987.1234)	-- 987
from dual;

-- *truncate() : 자리수 버림
select	truncate(1234.34567, 2),		-- 1234.34
		truncate(1234.34567, 3),		-- 1234.345
        truncate(1234.34567, 0),		-- 1234
        truncate(1234.34567, -2)		-- 1200
from dual;

-- *POWER(숫자, n), POW(숫자, n) : 숫자의 n제곱
select	power(12, 3)
from dual;

-- *sqrt(숫자) : 제곱근
select sqrt(144)	-- 12
from dual;

-- **sign(숫자) : 숫자가 음수면 -1, 0 이면 0, 양수면 1
select 	sign(123),		-- 1
		sign(0),		-- 0
        sign(-123)		-- -1
from dual
;

-- *abs(숫자): 절댓값
select	abs(123),	-- 123
		abs(0),		-- 0
        abs(-123)	-- 123
from dual;

-- *greadtest(x, y, z, ...) : 괄호안의 값중 가장 큰값
select	greatest(2, 0, -2),				-- 2
		greatest(4, 3.2, 5.25),			-- 5.25
        greatest('B', 'A', 'C', 'c')	-- c
from dual;

-- *least(x, y, z, ...) : 괄호 안의 값중 가장 작은 값
select	least(2, 0, -2),			-- -2
		least(4, 3.2, 5.25),		-- 3.2
        least('B', 'A', 'C', 'c')	-- A
from dual;

-- *단일행함수 > 문자함수
select concat('안녕', '하세요')
from dual;

select concat('안녕', '-', '하세요')
from dual;

select concat(first_name, " ", last_name)
from employees;

-- concat_ws(s, str1, str2, ..., strn) : str1, str2, ...,
-- strN을 연결할 때 사이에 s로 연결
select concat_ws('-', 'abc', '123', '가나다')	-- abc-123-가나다
from dual;

select	first_name, last_name,
		concat(first_name, last_name),
        concat(first_name, '-', last_name),
        concat_ws('-', first_name, last_name, employee_id)
from employees;

-- lcase(str) 또는 lower(str) : str의 모든 대문자를 소문자로 변환
select	first_name,
		lcase(first_name),
        lower(first_name),
        lower('ABCabc!#$%'),
		lower('가나다')
from employees;

-- upper(str) or ucase(str) : str의 모든 소문자를 대문자로 변환
select	first_name,
		ucase(first_name),
        upper(first_name),
        upper('ABCabc!#$%'),
		upper('가나다')
from employees;

-- 문자함수
-- length(str): str의 길이를 바이트로 변환
-- char_length(str) 또는 character_length() : str의 문자열 길이를 변환
select	first_name,
		first_name,
        first_name,
        first_name
from employees;

select	length('a'),
		char_length('a'),
		character_length('a')
from dual;

select	length('가'),
		char_length('나'),
		character_length('다')
from dual;

select	length('家'),
		char_length('羅'),
		character_length('多')
from dual;

-- *SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): str의 pos 위치에서 시작하여 len 길이의 문자열 반환
select	first_name,
		substr(first_name,1,3),
        substr(first_name,-3,2)
from employees
where department_id = 100;

-- *LPAD(str, len, padstr): str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
select	first_name,
		lpad(first_name,10,'*'),
        first_name
from employees;

select	first_name,
		rpad(first_name,10,'*'),
        first_name
from employees;

/*
 *TRIM(str): str의 양쪽에 있는 공백 문자를 제거
 *LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
 *RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
 */
select 	concat('|',  '          안녕하세요             ',  '|' ),	
		concat('|',  trim('          안녕하세요             '),  '|' ),
		concat('|',  ltrim('          안녕하세요             '),  '|' ),
		concat('|',  rtrim('          안녕하세요             '),  '|' )
;

-- *REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select	first_name,
		replace(first_name, 'a','*')
from employees;

select	first_name,
		substr(first_name, 2, 3),
        replace(first_name, substr(first_name, 2, 3),'***')		-- 이벤트당첨자
from employees;

/*
*날짜 시간 반환하기
-CURRENT_DATE() 또는 CURDATE(): 현재 날짜를 반환
-CURRENT_TIME() 또는 CURTIME(): 현재 시간을 반환
-CURRENT_TIMESTAMP() 또는 NOW(): 현재 날짜와시간을 반환
*/
select current_date(), curdate();

select current_time(), curtime();

select current_timestamp(), now();

/*
*날짜, 시간 더하기 빼기
-ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기
-SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기
*/

select  adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
from dual;

-- *datediff(): 두 날짜간 일수차
select datediff('2021-06-21 01:05:05','2021-06-20 01:00:00')
from dual;

select datediff('2025-09-05','2025-03-27')
from dual;	-- 수업기간 몇일

select	first_name,
		concat(ceil(datediff('2025-05-26', hire_date)/365), '년차')
from employees;

-- *단일행함수 > 변환함수
select	now(),
		date_format(now(), '%y-%m-%d %h:%i:%s'),
        date_format(now(), '%y-%m-%d %h:%i:%s %p'),
        date_format(now(), '%y-%m-%d %H:%i:%s'),
        date_format(now(), '%Y?%M?%D %H %i %s')
from dual;

select	first_name,
		date_format(hire_date, '%y.%m.%d')
from employees;

-- ------------------------------------------------------------

-- 문자열 => 날짜형으로 변환 ==> 계산
select str_to_date('2021-jun-22', '2021-06-01');	-- 계산 안됨

select str_to_date('2021-jun-04 07:48:52', '%Y-%b-%d');
select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d');

select	datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'),
				str_to_date('2021-06-01 12:30:05', '%Y-%m-%d'))
from dual;

-- 숫자 => 문자열
-- *format(숫자,n) 숫자에 콤마','를 추가, 소수점 n 자리까지 출력
select	format(1234.5678, 2),
		format(123456787.89, 0),
        format(1234567.89, -5)
from dual;

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select	commission_pct, 
		ifnull(commission_pct, 0)
from employees;

select	first_name
		manager_id,
		ifnull(manager_id, '매니저 없음')
from employees;
