use hr_db;

-- 종류: 갯수 합계 평균 최고값 최저값
/*
avg()
*/
-- 정상출력됨
select	avg(salary)
from employees;

-- 오류남
/* 이유: 모든 결과값의 갯수는 다를 수 없다.
즉 first_name의 결과값은 107개, avg(salary)의 결과값은 1개이기 때문에
결과를 도출하지 못하고 오류가 발생하는 것
*/
select	first_name,
		salary
from employees;

-- *그룹함수 > count()
-- 직원의 수를 구하시오
select concat(count(*), '명')	-- 전체 갯수(row갯수)
from employees;

select count(commission_pct)	-- 커미션을 받은 직원의 수
from employees;

select count(manager_id)		-- 매니저(팀장)가 있는 직원의 수 (null제외)
from employees;

select count(*), count(commission_pct)
from employees;

-- 월급이 16000 초과되는 직원의 수는
select	count(salary)
from employees
where salary > 16000;

select first_name
from employees
where salary > 16000;

-- *그룹함수 > sum()
--  전체직원의 수와 급여의 합
select	count(*),
		sum(salary)
from employees;

-- 논리적으로 잘못된 합계
select	*
from employees;

-- *그룹함수 > avg()	:	null의 포함여부 결정
-- 월급의 평균을 구하시오
select	count(*), sum(salary), avg(salary)				-- salary가 null일 때 평균에 포함하지 않음
from employees;

select count(*), sum(salary), avg(ifnull(salary, 0))	-- salary가 null일 때 0으로 변환 후 평균에 포함
from employees;

-- *그룹함수 > max(), min()
select	format(max(salary),0),
		format(min(salary),0),
        format(sum(salary),0)
from employees;

select	max(hire_date)
from employees;

-- ---------------------------------------------------

-- 부서별로 월급 합계를 구해라

-- 현재로서는 where절을 이용해서 구해야 한다 => 한 그룹씩
select	sum(salary)
from employees
where department_id = 90;

-- 한번에 그룹별로 합계를 구한다
select	department_id,
		avg(salary)
from employees
group by department_id
order by department_id asc
;

-- Group by에 참여한 컬럼이나 그룹함수만 올 수 있다.
select department_id, count(*), sum(salary)
from employees
group by department_id;

-- 부서별로 부서 번호와, 인원수, 월급 합계를 출력하세요
select	job_id '부서명',
		count(*) '인원수',
        format(sum(salary), 0) '월급합계'
from employees
group by job_id
;

select	department_id,
		job_id,
        first_name,		-- 그룹에 참여하지 않은 컬럼명은 사용할 수 없다
        sum(salary),
        count(*)
from employees
group by department_id, job_id
;

-- 부서별로 부서번호와 최고월급, 최고월급을 받는 직원의 이름을 출력하세요
select	department_id '부서번호',
		format(max(salary), 0) '최고임금'
from employees
group by department_id
;

-- -----------------------------------------------------------------
-- 월급의 합계가 20000 이상인 부서의 부서 번호와, 인원수, 월급합계를 출력하세요
-- 조건: 부서번호 >= 100 
select	department_id '부서번호',
		count(*) '인원수',
        concat(format(sum(salary), 0),'원') '월급합계'
from employees
group by department_id
having sum(salary) >= 20000
and department_id >= 100
order by department_id asc
;

/*
select	department_id,
		
from employees
where
and
group by department_id
having department_id
and
order by
;
*/

select	first_name,
		salary,
        commission_pct,
        if(commission_pct >= 0.1, '사무직', '영업사원') as 'if()',
        ifnull(commission_pct, '없음') as 'ifnull()'
from employees
;

/*
직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요
실제 월급은 job_id가 'AC_ACCOUNT'면 월급+월급*0.1,
				  'SA_REP'월급+월급*0.2
                  'ST_CLERK'면 월급+월급*0.3
                  그 외에는 월급으로 계산하세요
*/
select	employee_id '직원아이디',
		job_id '업무아이디',
		salary '추정월급',
        case
			when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
            when job_id = 'SA_REP' then salary + salary * 0.2
            when job_id = 'ST_CLERK' then salary + salary * 0.3
            else salary
		end '실제월급'
from employees
;

/*
직원의 이름, 부서아이디, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가
	10~50이면 'A-Team'
	60~100이면 'B-Team'
    110~150이면 'C-Team'
    나머지는 '팀없음'으로
출력하세요
*/
select	first_name,
		job_id,
        if(department_id >= 10 and department_id <= 50, 'A-Team', 
			if(department_id >= 60 and department_id <= 100, 'B-Team',
				if(department_id >= 110 and department_id <= 150, 'C-Team', '팀없음')
			)
		) as '팀'
from employees
;

select	first_name,
		job_id,
        case
			when department_id >= 10 and department_id <= 50
            then 'A-TEAM'
            when department_id >= 60 and department_id <= 100
            then 'B-TEAM'
            when department_id >= 110 and department_id <= 150
            then 'C-TEAM'
            else '팀없음'
		end Team
from employees
order by Team asc
;

select	department_id,
		count(*)
from employees
group by department_id
;

select	*
from employees
;