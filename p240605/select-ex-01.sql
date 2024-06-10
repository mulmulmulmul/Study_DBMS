## [where clause 사용되는 연산자] ==================================
## - 비교(관계) 연산자 : =, <>(!=), <, <=, >, >=  
## - 논리 연산자  : and, or, not   
## - 범위 연산자  : between A and B
## - 집합 연산자  : in (값1, 값2, ...) - 일치
##  				not in (값1, 값2, ...) - 불일치
## - 문자열 연산자 : like
##   				 not like
##				     와일드 카드 - % (모든)
##									_ (글자 하나) 
## - NULL 연산자   : is null		null과 같다, null이다
##  			   : is not null    null과 같지 않다, null이 아니다
#===================================================================  

/*
[DML] 조작어 : select - 조회, 검색 =================================
<< select statement >> select 문
select 필드명1, 필드명2				##select clause
from 테이블명						##from clause
where 조건 (컬럼명 연산자 값);		##where clause
===================================================================
*/

## DB 선택
use employees;

## 테이블 목록
show tables;    

## employees 구조 확인
desc employees;  

## 전체 직원 정보 중 사번과 이름만 조회
select emp_no, first_name
from employees;

## 사번이 10001인 사원의 사번과 이름 조회
select emp_no, first_name
from employees
where emp_no = 10003;


## [문제 1] d005 부서 매니저의 사원번호, 부서번호 추출하시오.

## 데이터 조회
select * from employees;
  
select emp_no, dept_no
from dept_manager
where dept_no = 'd005';

## [문제 2] d003부서 소속(담당)이 아닌 매니저들의 사원번호, 부서번호 추출하시오.
select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';

## [문제 3] 연봉이 150,000 이상인 사원들의 사원번호, 연봉 추출하시오.
select emp_no, salary
from salaries
where salary >= 150000;

select * from salaries;

## [문제 4] 1986년 이후에 입사한 사원들의 사원번호, 입사일, 이름 추출하시오.
select emp_no, hire_date, first_name
from employees
where hire_date >= '1986-01-01';

## [문제 5] 1990년 이후부터 매니저로 근무하고 있는 사원들의 사원번호, 부서번호, 매니저 시작날짜 추출  
select emp_no, dept_no, from_date
from dept_manager
where from_date >= '1990-01-01'
	and to_date = '9999-01-01';
    
## [문제 6] 1990년 이전 입사한 사원들의 사원번호, 입사일 추출하시오.
select emp_no, hire_date, first_name
from employees
where hire_date < '1990-12-31';


##  논리 연산자  : and, or, not ======================================================= 
##  and -------------------------------------------------------------------------------
## [문제 7] 부서번호가 d001이고 1990년도부터 매니저인 사원의 사번, 부서번호, 매니저 시작일 추출
select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

select *
from employees
where emp_no <= 10100
	and hire_date >= '1986-01-01'
    and gender = 'F';
    
## ====================================================================================
# [문제 1] 1990년 이후 입사한 남자 사원의 사원번호, 성별, 입사일 추출
select emp_no, gender, hire_date
from employees
where hire_date >= '1990-01-01' and gender = 'M';

# [문제 2] 1990년 이후부터 연봉을 60,000 이상 받는 사원의 
# 사원번호, 연봉, 연봉 시작일 추출  
select  emp_no, salary, from_date
from salaries
where from_date >= '1990-01-01' and salary >= 60000;

# [문제 3] d001 부서와 d002 부서 매니저의 사원번호, 부서번호 추출
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

# [문제 4] 직책이 staff이거나 engineer인 사원의 사원번호, 직책 추출  
select emp_no, title
from titles
where title = 'staff' or title = 'engineer';

# [문제 5] d003 부서 소속(담당)이 아닌 매니저의 사원번호, 부서번호 추출 
select emp_no, dept_no
from dept_manager
where not dept_no = 'd003';

## 범위 연산자  : between A and B ----------------------------------------------------  
# 연봉이 60,000 이상  70,000 이하인 사원의 사번, 연봉 추출
select emp_no, salary
from salaries
where salary between 60000 and 70000;

## 집합 연산자  : in (값1, 값2, ...), not in (값1, 값2, ...) -------------------------
## d001 부서와 d002 부서 매니저의 사번, 부서번호 추출
## << or 연산자 >>
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

## << 집합 연산자 - in >>  
select emp_no, dept_no
from dept_manager     
where dept_no in ('d001', 'd002');

## d001 부서와 d002 부서가 아닌 매니저의 사번, 부서번호 추출
## << and 연산자 >>
select emp_no, dept_no
from dept_manager
where dept_no <> 'd001' and dept_no <> 'd002';

## << 집합 연산자 - not in >>  
select emp_no, dept_no
from dept_manager     
where dept_no not in ('d001', 'd002');

## 문자열 연산자 : like ------------------------------------------------------------ 
##   			   not like
##				   와일드 카드 - % (모든), _ (하나)

select * 
from departments
where dept_name = 'Marketing';

select *
from departments
where dept_name like 'Marketing';

## R로 시작하는 부서명
select *
from departments
where dept_name like 'R%';  

## S로 끝나는 부서명
select *
from departments
where dept_name like '%S';  

## S가 포함된 부서명
select *
from departments
where dept_name like '%s%';   

select * 
from employees
where emp_no like 10001;

select * 
from employees
where binary first_name like '%g%'
	and binary gender like 'm';
    
## 이름의 두 번째 글자가 r인 데이터 추출
select *
from employees
where first_name like '_r%';  

## ==============================================================================
# 1) 이름이 B로 시작하는 사원의 사번, 이름
select emp_no, first_name
from employees
where binary first_name like 'B%';

# 2) 이름이 i로 끝나는 사원의 사번, 이름
select emp_no, first_name
from employees
where binary first_name like '%i';

# 3) 이름의 두 번째 글자가 r인 사원의 사번, 이름 (단, 이름 글자 수가 3개인 이름만)
select emp_no, first_name
from employees
where binary first_name like '_r_';

# 4) 이름이 B로 시작하지 않는 직원의 이름과 사번(조회)  
select emp_no, first_name
from employees
where binary first_name not like 'B%';

## ==================================================================================
## - NULL 연산자   : is null		null과 같다, null이다
##  			   : is not null    null과 같지 않다, null이 아니다  

show tables;
desc departments;
desc dept_emp;
desc dept_manager;
desc employees;
desc salaries;
desc titles;

select * from titles
where to_date is null;

## [titles table] ===================================================================  
## emp_no가 10001인 사원의 to_date를 null로 변경
update titles
set to_date = null
where emp_no = '10001';

select * from titles;

select * 
from titles
where to_date is not null;