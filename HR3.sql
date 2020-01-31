--1. Personeli olmayan departmanlar�n isim ve �ehirlerini(lokasyon) alfabetik olarak listeleyin.
/*
select d.DEPARTMENT_NAME,l.CITY
from departments d,LOCATIONS l
where d.location_id=l.location_id and not exists (select 1 from employees e where e.department_id=d.department_id )
order by 1,2;
*/

--2. Hen�z hi� i� de�i�tirmemi� personelin isim, maa� ve departman isimlerini listeleyin.
/*
select e.first_name||' '||e.last_name EMPLOYEES,e.salary,d.department_name
from hr.employees e,departments d
Where 1=(Select Count(*) From hr.job_history Where employee_id=e.employee_id);
--where d.department_id=e.department_id and exists (select 1 from jobs j  where e.job_id=j.job_id );
*/
--3. Kendi alt�nda �al��an herhangi bir personelin, kendisininkinden farkl� bir departmana ba�l� oldu�u amirlerin(varsa) isimlerini listeleyin.
/*
--personel ve departman� g�sterir
select e.first_name||' '||e.last_name EMPLOYEE,e.DEPARTMENT_ID,d.department_name,d.DEPARTMENT_ID
from employees e,departments d
where e.department_id=d.department_id and exists(select * from employees e2 where e.manager_id=d.manager_id and e2.manager_id=e.manager_id)
order by 1;
--farkl� departmandakini g�sterir.
select e.first_name||' '||e.last_name EMPLOYEE,e.DEPARTMENT_ID,d.department_name,d.DEPARTMENT_ID
from employees e,departments d
where e.department_id=d.department_id and exists(select * from employees e2 where e.manager_id=d.manager_id and e2.manager_id=e.employee_id)
order by 1;
*/
--4. Job tan�m�ndaki limitlerin alt�nda veya �st�nde kalan personel (varsa) �nvan, maa�, �nvan maa� limitleri, isimleri ve departman isimleriyle birlikte listeleyin.
/*
select j.job_title Unvan,e.salary,j.min_salary,j.max_salary,e.first_name||' '||e.last_name EMPLOYEES,d.department_name
from employees e,departments d,jobs j,job_history h
Where e.job_id=j.job_id and d.department_id=e.department_id and j.job_id=h.job_id and h.department_id=d.department_id and e.salary<j.min_salary and e.salary>j.max_salary;
*/
--5. US d���ndaki �lkelerdeki lokasyonlardaki departmanlardan personel i� de�i�imi ya�anm��lar� listeleyin
/*
select distinct e.employee_id,e.first_name||' '||e.last_name EMPLOYEE,e.job_id
From employees e,countries c
Where not c.country_name='US' and 0<(Select Count(*) From job_history Where employee_id=e.employee_id);*/