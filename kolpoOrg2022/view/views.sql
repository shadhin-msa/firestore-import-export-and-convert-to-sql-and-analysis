
-- ######################### Project Wise DATA ####################################

-- view ##  Time Entries With Project
DROP view timeEntriesWithProject;

CREATE VIEW timeEntriesWithProject AS
SELECT te.fid, startTime, isBusy, taskId, te.duration, userId, project_id
FROM timeentries as te
LEFT JOIN tasks ON te.taskId = tasks.fid;



-- view ##  project Wise User Work Time
DROP VIEW  IF EXISTS  projectWiseUserWorkTime;
-- v1
    -- CREATE VIEW projectWiseUserWorkTime AS
    -- SELECT tep.project_id, projects.name as project, users.name as user, sum(duration) 
    -- FROM timeEntriesWithProject as tep
    -- LEFT JOIN projects ON tep.project_id = projects.fid
    -- LEFT JOIN users ON tep.userId = users.fid
    -- GROUP BY tep.project_id, tep.userId;

-- v2
    CREATE VIEW projectWiseUserWorkTime AS
    SELECT projects.name as project, users.name as user, round((sum(duration) /3600000), 1) as total_hour
    FROM timeEntriesWithProject as tep
    LEFT JOIN projects ON tep.project_id = projects.fid
    LEFT JOIN users ON tep.userId = users.fid
    GROUP BY tep.project_id, tep.userId;

    SELECT fid, name from, (SELECT) projects;




-- ## get project wise report as json
-- select GROUP_CONCAT(JSON_OBJECT( 'Project', project, 'user', user, 'total_hour', total_hour ))
-- FROM  projectWiseUserWorkTime;


------- fix wrong prject data data

-- ## check number of project exist with wrong data 

-- SELECT COUNT(*) 
-- from tasks
-- LEFT JOIN projects ON tasks.project_id = projects.fid
-- where project_id IS  NULL 
-- GROUP BY project_id;


-- ## update wrong project Ids in tasks table

-- SELECT fid, project_id from tasks where project_id = '0';
-- UPDATE tasks Set project_id = NULL where project_id = '0';



-- ######################### USER Wise DATA ####################################

-- view user work hours
DROP VIEW  IF EXISTS  WorkHour;
CREATE VIEW WorkHour AS
SELECT tep.userId, users.name as user, sum(duration) as WorkHour 
FROM timeEntriesWithProject as tep
LEFT JOIN users ON tep.userId = users.fid
GROUP BY tep.userId;

-- view user office hours

DROP VIEW  IF EXISTS  officeHour;
CREATE VIEW officeHour AS
select sessions.userId, users.name, sum(exitTime - entryTime) as OfficeHour from sessions
LEFT JOIN users ON sessions.userId = users.fid
GROUP BY sessions.userId;


-- #######################################
-- office days at least 1 hour office time



-- View - sessions with day timestamp

DROP VIEW  IF EXISTS  sessionWithDayTimestamp;
CREATE VIEW sessionWithDayTimestamp AS
SELECT fid, userId, entryTime, (exitTime - entryTime)duration, (entryTime - (entryTime%86400000) - 21600000)dayTimestamp from sessions ORDER BY entryTime DESC;


-- View - day wise office hours
DROP VIEW  IF EXISTS  dayWiseOfficeHours;
CREATE VIEW dayWiseOfficeHours AS
SELECT userId, dayTimestamp, count(*)noOfSession, Round(sum(duration)/3600000, 1) duration  from sessionWithDayTimestamp GROUP BY userId, dayTimestamp;


-- View - office days at least 1 hour office time
DROP VIEW  IF EXISTS  userOfficeDays1hrOfficeTime;
CREATE VIEW userOfficeDays1hrOfficeTime AS
Select users.fid userId, users.name, count(*)noOfDays
from dayWiseOfficeHours as dwoh
left join users ON dwoh.userId = users.fid
where dwoh.duration >= 1
 GROUP BY userId;

 
-- View - recoreded days for each users
DROP VIEW  IF EXISTS  days_recored_for_each_user;
CREATE VIEW days_recored_for_each_user AS
Select users.fid userId, users.name, count(*)noOfDays
from days as d
left join users ON d.userId = users.fid
 GROUP BY userId;

 ---- END -----------

 -- ################################## Query Report ##############################
 -- continue final report views sql file


 -- ################################# test code ####################

 
SELECT *
from `sessionwithdaytimestamp` as s
LEFT JOIN `days` ON days.timestamp = dayTimestamp
ORDER BY planningDeadline ;