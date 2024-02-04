-- 1. Вывести средний оклад (salary) всех сотрудников
select avg(salary) 
  from doctors;


-- 2. Вывести среднюю премию для всех сотрудников, чей доход выше среднего 
--     (взять явное значение из результата предыдущего запроса)
select avg(premium)
  from doctors
 where salary > 72767.671429;


-- 3. Вывести с сортировкой по возрастанию среднее количество дней в отпуске для 
--     каждого сотрудника — используйте функцию datediff()
  select avg(datediff(end_date, start_date)) as AvgDateVacations
    from vacations
group by doctors_id
order by AvgDateVacations;


-- 4. Вывести для каждого сотрудника самый ранний год отпуска и самый поздний год 
--     отпуска с сортировкой по возрастанию разности между этими двумя значениями
  select min(year(start_date)) as early, max(year(end_date)) as late
    from vacations
group by doctors_id
order by late - early;


-- 5. Вывести сумму пожертвований за всё время для каждого отделения с сортировкой 
--     по возрастанию номеров отделений
  select sum(amount)
    from donations
group by departments_id
order by departments_id;


-- 6. Вывести сумму пожертвований за каждый год для каждого спонсора с сортировкой 
--     по возрастанию номеров спонсоров и годов
  select sum(amount)
    from donations
group by year(date), sponsors_id
order by sponsors_id, year(date);