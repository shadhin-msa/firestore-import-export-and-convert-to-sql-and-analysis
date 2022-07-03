-- fyi: we have a database of all years information. but we need report for only specific time range (2021-03-01 to 2022-03-01) report.
-- how we can get it?
-- make a copy of full database, Delete data (days, sessions, timeEntries) outside of expected time range (like delete data before 2021 03 01, delete data after 2022-03-01)
-- so there will be seperate database for each year (or expected timerange), all views / reprort already created, they will show expected result

-- step 1: copy and create a new database from database of all time / years DATABASE
-- * following actions need to perform on newly copied database
-- step 2: get timestamp (in milisecons in local timezone ) of from and to date time (like for 2021-03-01 = 1614535200000 and for 2022-03-01 = 1646071200000)
-- step 3: run command to delete days

-- time range
-- delete all before  2021-03-01 = 1614535200000
-- delete all after 2022-03-01 = 1646071200000

-- ## DELETE Days
-- check query before delete
SELECT * FROM `days` 
where timestamp < 1614535200000
OR timestamp >= 1646071200000;

-- rund delete command
DELETE FROM `days` 
where timestamp < 1614535200000
OR timestamp >= 1646071200000;


-- ## DELETE Sessions


-- check query before delete
SELECT * FROM `sessions`
where entryTime < 1614535200000
OR entryTime >= 1646071200000;


-- rund delete command
DELETE FROM `sessions`
where entryTime < 1614535200000
OR entryTime >= 1646071200000;

-- ## DELETE Timestamp

-- check query before delete
SELECT * FROM `timeentries`
where startTime < 1614535200000
OR startTime >= 1646071200000;

-- rund delete command
DELETE FROM `timeentries`
where startTime < 1614535200000
OR startTime >= 1646071200000;