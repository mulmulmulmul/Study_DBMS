/*
[정렬] order by
order by 컬럼명 asc, 컬럼명 desc

[Select]
select 컬럼명
from 테이블명
where 조건
order by 컬럼명 asc, 컬럼명 desc;
*/

## 연봉 오름차순, 연봉 시작일 내림차순하여 사번, 연봉, 연봉 시작일 조회
select emp_no, salary, from_date
from salaries
order by salary asc, from_date desc;

## 직책을 오름차순, 업무 시작일을 내림차순하여 사번, 직책, 업무 시작일 조회
select emp_no, title, from_date
from titles
order by title asc, from_date desc;

select emp_no, title, from_date
from titles
order by 2 asc, 3 desc;

select * from departments;

select dept_no
from departments
order by dept_no asc;
  