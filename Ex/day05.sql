-- *단일행함수 > 숫자함수

-- *기본원리*
-- 직원의 이름과 직원이 속한 부서명을 출력하세요
-- Steven	90			90	executive
-- 카디젼 프로턱트 모든 경우의 수의 갯수가 된다
-- 107 * 27 = 2889건 (원하는게 아니다 107개)

-- where절을 사용한다
select	first_name,
		department_name
from employees, departments
where employees.department_id = departments.department_id	-- where 절 사용
;

-- ----------------------------------------------------------------------------------
-- inner join(equi join)
-- ----------------------------------------------------------------------------------

-- 직원의 이름과 직원이 속한 부서명을 출력하세요
select	first_name,
		employees.department_id,
        departments.department_id
from employees inner join departments
on employees.department_id = departments.department_id
;

select	e.first_name,
		e.department_id,
		d.department_id,
        d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
;

select	count(*)
from employees e, departments d
where e.department_id = d.department_id
;

-- ---------------------------------
-- 여러개 테이블을 join할 때
/*
이름		부서명		부서도시
Steven	Excutive	

*/
select	count(*)
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
;

select	count(*)
from employees e
inner join departments d
		on e.department_id = d.department_id
inner join locations l
		on d.location_id = l.location_id
;

-- 모든 직원이름, 부서이름, 업무명 을 출력하세요   *3개의 테이블
-- where사용 버전
select	first_name,
		department_name,
        j.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
;


-- join 사용 버전
select	first_name,
		department_name,
		j.job_id
from employees e
inner join departments d
		on e.department_id = d.department_id
inner join jobs j
		on e.job_id = j.job_id
;

-- --------------------------------------------------------
-- left outer join
-- --------------------------------------------------------
-- 왼쪽 테이블을 기준, 기준 테이블의 정보는 다 보여줌
-- (kimberely)가 결과에 있어야함 : 소속부서가 없는 직원)
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e
left outer join departments d
on e.department_id = d.department_id
;

-- ----------------------------------------------------------
-- right outer join
-- ----------------------------------------------------------
-- 모든 직원의 부서번호, 이름, 부서번호를 출력하세요
-- 직원이 없는 부서도 표시하세요	(kimberely는 결과에서 빠진다)
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e
right outer join departments d
		on e.department_id = d.department_id
;

-- --------------------------------------------------------------
# right outer join => left outer join
-- --------------------------------------------------------------
select	e.first_name,
		d.department_name
from departments d
left outer join employees e
		on d.department_id = e.department_id
;

-- ----------------------------------------------------------------
-- full outer join
-- ----------------------------------------------------------------

(-- left join
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e
left outer join departments d
		on e.department_id = d.department_id
)
union
(-- right join
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e
right outer join departments d
		on e.department_id = d.department_id
)
;

-- 본인의이름 본인의전화번호 본인의이메일 		부서의메일


-- --------------------------------------------------
# self join
-- --------------------------------------------------
-- 테이블에서 자신의 pk를 fk로 가지고 있는 경우
-- 같은 테이블을 두 번 불러와서 써야하는 경우
-- 두 번 불러와서 별명을 다르게 준다(꼭 별명을 주아야함)
select	e.employee_id,
		e.first_name,
        e.phone_number,
        m.employee_id as m_id,
        m.first_name as m_first_name,
        m.phone_number as m_phone_number
from employees e, employees m
where e.manager_id = m.employee_id
;

select	*
from employees e, locations l
where e.salary = l.location_id
;

select	*
from employees
;

