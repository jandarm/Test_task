--Вывести список агрегатов, у которых количество параметров больше, чем у группового агрегата
select unit_dict.Name from unit_dict
inner join unit_dict uP
    on unit_dict.Parent_ID = uP.Unit_ID
    and unit_dict.Parameter_Count > uP.Parameter_Count;


--Вывести список агрегатов, содержащих максимальней количество параметров в своем участке, отсортированный по убыванию количества параметров
select unit_dict.Name, max(unit_dict.Parameter_Count), location_dict.Name from unit_dict
inner join location_dict
    on unit_dict.Location_ID = location_dict.Location_ID
    group by location_dict.Name
order by unit_dict.Parameter_Count DESC;


--Вывести список ID участков, количество агрегатов которых меньше 3-х штук
select location_dict.Location_ID from location_dict
inner join unit_dict
    on location_dict.Location_ID = unit_dict.Location_ID
    group by unit_dict.Location_ID
    having count(unit_dict.Location_ID)<3;


--Найти список наименований участков с минимальным количеством параметров.
select Location_ID, Name, min(paramCount) from 
(select location_dict.Location_ID, location_dict.Name, sum(unit_dict.Parameter_Count) as paramCount from location_dict
    inner join unit_dict
        on location_dict.Location_ID = unit_dict.Location_ID    
        group by unit_dict.Location_ID) minAmount;



--Вывести номера труб, прошедшие обработку с 01.05.2016 по 20.05.2016 и продолжительность последней (в этом периоде) обработки
select Pipe_No, Duration from unit_passes
	inner join pipes
    on unit_passes.Mat_ID = pipes.Mat_ID
    where unit_passes.DT between '2016-05-01' AND '2016-05-20';


--Вывести номера труб, которые не прошли агрегат 22. Без использования подзапросов, только соединение таблиц
select Pipe_No from unit_passes
	inner join pipes
    on unit_passes.Mat_ID = pipes.Mat_ID
    inner join unit_dict
    on unit_passes.Unit_ID = unit_dict.Unit_ID
    where unit_dict.Name not like "Агрегат22";


--
select Pipe_No, unit_passes.DT, unit_passes.Duration from unit_passes
	inner join pipes
    on unit_passes.Mat_ID = pipes.Mat_ID
    where Pipe_No like "итз%"
    order by unit_passes.DT asc;