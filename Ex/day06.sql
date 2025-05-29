-- ---------------------------------------------------------------------
# SubQuery
-- ---------------------------------------------------------------------
-- 'Den'보다 월급이 많은 사람의 이름과 월급은?

-- Den의 월급 확인
select	first_name,
		salary
from employees
where first_name = 'Den'
;

-- Den의 월급인 11000보다 높은 사람의 이름과 월급 확인
select	first_name,
		salary
from employees
where salary > 11000
;

-- SubQuery 사용
select	first_name,
		salary
from employees
where salary > (select salary
				from employees
                where first_name = 'Den');
;

-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
select	first_name,
		salary,
		employee_id
from employees
where salary = (select min(salary)
				from employees);
;

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요
-- 평균값 확인
select	avg(salary)
from employees
;

select	first_name,
		salary
from employees
where salary < (select avg(salary)
				from employees);
;

-- 부서번호가 110인 직원의 월급과 같은 월급을 받는
-- 모든 직원의 사번, 이름, 월급을 출력하세요

-- 부서번호가 110인 직원의 월급 확인
select	salary,
		first_name,
        department_id
from employees
where department_id = 110
;

-- salary가 8300 혹은 12008인 사람 확인
select	employee_id,
		first_name,
        salary
from employees
where salary = 12008
or salary = 8300
;

select	employee_id,
		first_name,
        salary
from employees
where salary in (select salary
				from employees
				where department_id = 110);
;

-- 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
-- 최고임금 확인
select	max(salary)
from employees
;

-- 부서별 최고임금 확인
select	department_id,
		max(salary)
from employees
group by department_id
;

-- 각 부서별 최고임금을 받는 사람의 이름 출력
-- where절로 표현
select	first_name,
		department_id,
        salary
from employees
where (department_id = 10 and salary = 4400)
or (department_id = 20 and salary = 13000)
or (department_id = 30 and salary = 11000)
;

-- in 문법으로 표현
select	first_name,
		department_id,
        salary
from employees
where (department_id, salary) in((10, 4400),(20,13000),(30,11000))
;

-- 최종
select	department_id,
		first_name,
        salary
from employees
where(department_id, salary) in (select department_id,
										max(salary)
									from employees
									group by department_id)
;

-- 부서번호가 110인 직원의 월급 중
-- 가장 작은 월급 보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요(or연산 => 8300보다 큼)

-- 부서번호가 110인 직원의 월급
select	department_id,
		salary
from employees
where department_id = 110
;

-- 그 중 가장 적은 임금
select	department_id,
		salary
from employees
where salary = (select min(salary)
				from employees
                where department_id =110)
;

-- salary가 8300보다 높은 직원의 이름, 급여
select	first_name,
		salary
from employees
where salary > 8300
;

-- 최종
select	first_name,
		salary
from employees
where salary > (select min(salary)
					from employees
					where department_id = 110)
;

-- 부서번호가 110인 직원의 임금 중
-- 가장 많은 월급보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요 (and연산 => 12008보다 큰)

-- 부서번호가 110인 직원의 월급 구하기
select	first_name,
		salary
from employees
where department_id = 110
;

-- 부서번호가 110인 직원의 월급중 가장 많은 월급보다 월급이 많은 직원의 수 구하기
-- where 사용
select	first_name,
		salary
from employees
where salary > 12008
and salary > 8300
;
-- all 사용
select	first_name,
		salary
from employees
where salary > all(8300, 12008)
;

-- 최종
select	first_name,
		salary
from employees
where salary > all(select salary
				from employees
				where department_id = 100)
;

-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요

-- in 사용하기
select	*
from employees
where (department_id, salary) in((10, 4400),(20,13000),(30,11000))
;

-- 최종
select	department_id,
		employee_id,
        first_name,
        salary
from employees
where (department_id, salary) in (select	department_id,
										max(salary)
								from employees
                                group by department_id)
;

-- in(), >any(), >all()
select	*
from employees
where (department_id, salary) and ((,),(,),(,))
or department_id = 1 and salary = 4400
or department_id = 20 and salary = 13000
or department_id = 30 and salary = 11000
;

-- # from절의 테이블로 해결

/*
테이블 2를 조인한다
select	*
from 테이블명, 테이블2(서브퀄 결과)
where 컬럼명 = 컬럼명
;
*/

-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
-- 1) 각 부서별 최고월급
select	department_id,
		max(salary)
from employees
group by department_id
;

/*결과 일부
(10, 4400)
(20, 13000)
30, 11000)
*/

-- 2)전체구조
select	*
from employees e, 가상의테이블 s
;

select	*
from employees e
where e.department_id = 20
and e.salary = 6000
;

-- 각 부서별로 최고급여를 받는 사원을 출력하세요
select	max(salary)
from employees
group by department_id
;

select	employee_id,
		department_id,
		first_name,
        salary
from employees e
where (department_id = 10 and salary = 4400)
or (department_id = 20 and salary = 13000)
or (department_id = 30 and salary = 11000)
;

select	employee_id,
		department_id,
		first_name,
        salary
from employees e
where(department_id, salary) in (select department_id,
										max(salary)
									from employees
                                    group by department_id)
;

select	*
from employees e,	(select department_id,
							max(salary) maxSalary
					from employees
					group by department_id) s
where e.department_id = s.department_id
;
select	*
from employees
;