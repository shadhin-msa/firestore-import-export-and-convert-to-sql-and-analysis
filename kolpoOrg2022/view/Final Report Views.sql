 -- ################################## Query Report ##############################
 
-- #    user Work hour reort 
    -- [user	WorkHour	BreakTime	OfficeHour	ActiveDays(1h office)]

Drop VIEW fr___user_Active_Hours;
CREATE VIEW fr___user_Active_Hours AS
SELECT WH.user,
ROUND((WorkHour/3600000)) WorkHour,
ROUND((OfficeHour - WorkHour)/3600000)BreakTime,
ROUND(OfficeHour/3600000)OfficeHour,
noOfDays as 'ActiveDays(1h office)'
FROM  WorkHour as WH
LEFT JOIN officeHour ON WH.userId = officeHour.userId
LEFT JOIN userOfficeDays1hrOfficeTime ON WH.userId = userOfficeDays1hrOfficeTime.userId
ORDER BY WorkHour DESC;



-- ##   User working days report
    --  [ name	planningActive	Planned	OnTime	Late	reviewed	planningIgnored ]

DROP VIEW fr___user_working_days;
CREATE VIEW fr___user_working_days AS
select users.name,
Offce_all.noOfDays as daysRecorded,
Offce1h.noOfDays as 'ActiveDays(1h office)',
count(planningDeadline) as  planningActive,
count(planningFinishTime) as Planned, 
count(CASE WHEN planningDeadline >= planningFinishTime THEN 1 END) as OnTime,
count(CASE WHEN planningDeadline < planningFinishTime THEN 1 END) as Late,
count(reviewFinishTime) as reviewed,
sum(planningIgnored) as planningIgnored
from days as d
LEFT JOIN users ON d.userId = users.fid
LEFT JOIN userOfficeDays1hrOfficeTime as Offce1h ON d.userId = Offce1h.userId
LEFT JOIN days_recored_for_each_user as Offce_all ON d.userId = Offce_all.userId
WHERE planningDeadline IS NOT NULL
GROUP BY d.userId
ORDER BY planningActive DESC;



-- ##   project work hour by user wise
    --  [project	Ashish	Gigi zaman	Hamim	Hasan	Hasib	Maksud ....]

DROP VIEW fr__projects_hours_by_users_column;
CREATE VIEW fr__projects_hours_by_users_column AS
SELECT project, 
max(case when col = 'Ratul' then value end) as `Ratul`,
max(case when col = 'Gigi zaman' then value end) as `Gigi zaman`,
max(case when col = 'Rashid Zaman' then value end) as `Rashid Zaman`,
max(case when col = 'Shadhin' then value end) as `Shadhin`,
max(case when col = 'Hasan' then value end) as `Hasan`,
max(case when col = 'Hasib' then value end) as `Hasib`,
max(case when col = 'Md Riaz' then value end) as `Md Riaz`,
max(case when col = 'Prince' then value end) as `Prince`,
max(case when col = 'Saiful' then value end) as `Saiful`,
max(case when col = 'Shead Ashraf' then value end) as `Shead Ashraf`,
max(case when col = 'Shompa Karmoker' then value end) as `Shompa Karmoker`,
max(case when col = 'Sujon' then value end) as `Sujon`,
max(case when col = 'Trina' then value end) as `Trina` 
from
(
select project, concat('', user) col, total_hour value
from projectwiseuserworktime
) as tmp2
group by project;


-- query for all users, above one only have users that has data in this time range (year)
-- SELECT project, max(case when col = 'Ashish' then value end) as `Ashish`,max(case when col = 'Gigi zaman' then value end) as `Gigi zaman`,max(case when col = 'Hamim' then value end) as `Hamim`,max(case when col = 'Hasan' then value end) as `Hasan`,max(case when col = 'Hasib' then value end) as `Hasib`,max(case when col = 'Maksud' then value end) as `Maksud`,max(case when col = 'Masud Haque' then value end) as `Masud Haque`,max(case when col = 'Md Riaz' then value end) as `Md Riaz`,max(case when col = 'old Sujon' then value end) as `old Sujon`,max(case when col = 'Prince' then value end) as `Prince`,max(case when col = 'Rakibul Foysal' then value end) as `Rakibul Foysal`,max(case when col = 'Rashid Zaman' then value end) as `Rashid Zaman`,max(case when col = 'Ratul' then value end) as `Ratul`,max(case when col = 'Saiful' then value end) as `Saiful`,max(case when col = 'Sakib' then value end) as `Sakib`,max(case when col = 'Shadhin' then value end) as `Shadhin`,max(case when col = 'Shead Ashraf' then value end) as `Shead Ashraf`,max(case when col = 'Shompa Karmoker' then value end) as `Shompa Karmoker`,max(case when col = 'Sujon' then value end) as `Sujon`,max(case when col = 'Trina' then value end) as `Trina`
--                  from
--                  (
--                    select project, concat('', user) col, total_hour value
--                    from projectwiseuserworktime
--                  ) as tmp2
--                  group by project;





