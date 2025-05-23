use hr_db;

-- select문 (select절 + select문)
select * from employees;
Select * from employsees;
-- 대소문자 상관없이 사용가능하다 --


-- 테이블 전체 조회하기
select * from employees;	-- 직원
select * from locations;	-- 도시
select * from regions;		-- 지역
select * from countries;	-- 나라
select * from job_history;	-- 업무현황
select * from jobs;			-- 업무
select * from departments; 	-- 부서

-- select 절
select * from employees;

-- employee_id만
select employee_id from employees;

-- employee_id, first_name, last_name
select employee_id, first_name, last_name from employees;

-- 모든 직원의 이름(fisrt_name)과 전화번호 입사일 월급을 출력하세요
select first_name, phone_number, hire_date from employees;
-- 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select	first_name, 
		last_name,
		salary,
		phone_number,
		email,
		hire_date
from	employees;

-- 컬럼명에 별명사용하기
-- 직원아이디, 이름, 월급을 출력하세요.
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select	employee_id as empNo,
		first_name as 'f-name',
        salary as '월 급'
from	employees;

-- *산술연산자 사용하기*
select	first_name,
		salary 월급,
        salary-100 as '월급-식대',
        salary*12 as 연봉,
        salary*12+5000 as 보너스포함,
        salary/30 일급,
        employee_id%3
from employees;

-- 연산시 문자열은 0으로 처리됨 ==> 오류는 나지 않기 때문에 주의가 필요
select	job_id*12
from employees;

select	first_name, last_name,
		concat(first_name, last_name) as '전체-이름',
        concat(first_name, '-', last_name) as '전체-이름',
        concat(first_name, ' ', last_name) as 문장,	-- 황일영의 입사일은 2024-01-01 입니다.
		
        concat(first_name, '-', last_name, '의 입사일은 ', hire_date, ' 입니다.') as 입사일

from employees;

select	first_name, last_name,
		concat(first_name, '-', last_name) as 성명,
        salary as 월급,
        salary*12+5000 보너스,
        phone_number
from employees;

-- MySQL은 테이블명을 생략할 수 있다. (오라클은 안됨)
select	first_name,
		'(주)개발자' as company
from	employees;