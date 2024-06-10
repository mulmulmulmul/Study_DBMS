## DB 선택
use world;

/*
[SQL] ======================================================================
- 정의어(DDL) : create, drop, alter
- 조작어(DML) : ***select, insert, update, delete ** 가장 많이 사용됨
- 제어어(DCL) : grant, revoke, commit, rollback
============================================================================
*/

## [조작어] select - 조회, 검색 ================================================
## << select statement >> select문
## select 필드명1, 필드명 		## << select clause >> select 절
## from 테이블명  			## << from clause >> from 절		  
## where 조건;				## << where clause >> where 절    ##(선택사항)
## =========================================================================

## DB 선택
use employees;

## table 목록
show tables;

## employees 테이블 구조(정보)
desc employees;

## employees 테이블 조회
select emp_no, birth_date, first_name, last_name, gender, hire_date 
from employees; 

select emp_no, first_name, hire_date
from employees;

select birth_date, emp_no
from employees;

select * from employees;


/*
=====================================================================
1. 사원의 이름(first_name), 성별 정보 추출
2. 부서의 부서번호, 부서명 추출
3. 사원의 사원번호, 연봉액 추출
4. 사원의 사원번호, 직책 추출
=====================================================================
*/
# 1. 사원의 이름(first_name), 성별 정보 추출
select first_name, gender from employees;

# 2.  부서의 부서번호, 부서명 추출
select dept_no, dept_name from departments;

# 3. 사원의 사원번호, 연봉액 추출
select emp_no, salary from salaries;

# 4. 사원의 사원번호, 직책 추출
select emp_no, title from titles;

/*
[LIMIT] --------------------------------------------------------------
- 문법 1: LIMIT 몇 개;
- 문법 2: LIMIT offset, 몇 개;

- offset은 0부터 시작
----------------------------------------------------------------------
*/

select *
from employees;
 
select *
from employees
limit 3;

select * 
from employees 
limit 4, 3;

select * from employees;