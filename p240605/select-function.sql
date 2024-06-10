# [함수] 숫자 ====================================================
# 절댓값 abs
select abs(100), abs(-100); 

# 소수점 이하 올림
select ceil(10.423), ceil(10.5), ceil(10.6); 

# 소수점 이하 내림
select floor(10.423), floor(10.5), floor(10.6); 

# 반올림
select round(10.432), round(10, 5), round(10.6);

select round(166.555, 0), round(166.555, 1);

select round(166.555, 0), round(166.555, -1);

# 버림
select truncate(166.555, 0), truncate(166.555, 1), truncate(166.555, -1); 

# [함수] 문자 ====================================================
## 이어주기
select concat('one', 'two', 'three');

select concat(first_name, ' 님') as '이름', 
	concat('성별 : ', gender) as '성별'
from employees;  

select * from employees;

## 직원의 사번, 이름 조회
## 단, 이름은 first_name, last_name을 한 컬럼으로 표시
## ex) Georgi Facello
select emp_no as '사번', concat(first_name,' ', last_name) as '이름'
from employees;

## [문법] insert('문자', 시작위치, 삭제할 문자 개수, '추가문자')
## 특정 위치에 추가 (1)
## 시작위치 숫자는 왼쪽에서 1부터 
select insert('abcdefg', 2, 1, 'wow');   

## 특정 위치에 추가 (2) : 2번째 자리에서 0개를 wow로 변경
select insert('abcdefg', 2, 0, 'wow');

## 2번째 자리에서 'bcd' 삭제
select insert('abcdefg', 2, 3, '');