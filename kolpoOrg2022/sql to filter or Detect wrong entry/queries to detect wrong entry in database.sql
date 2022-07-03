-- ## to get wrong time Entries
-- query to get List of largest time entries
SELECT 
Round((te.duration/3600000), 1 )as hour,
tasks.title, 
name as user ,
FROM_UNIXTIME(startTime/1000) 'Start Time', 
SubTaskId, 
taskId,
te.fid as 'TE Firebase Id'
FROM `timeentries` as te
LEFT JOIN users on te.userId = users.fid
LEFT JOIN tasks on te.taskId = tasks.fid
ORDER BY te.duration DESC;


-- To get wrong sessions
SELECT s.fid, name, entryTime, exitTime, createdLater, (exitTime - entryTime) duration,
FROM_UNIXTIME(entryTime/1000) 'Entry Time' 
FROM `sessions` as s
LEFT JOIN users on s.userId = users.fid
ORDER by exitTime;

-- found wrong time entries
-- fid name entryTime exitTime Ascending 1 createdLater duration Entry Time 
-- 7e0G8Srk3G9I6em9LCHK Ratul 1588611035014 NULL NULL NULL 2020-05-04 22:50:35.0140 
-- 98gYCSRw1tmSRzfpr5gJ Shadhin 1649095200000 NULL NULL NULL 2022-04-05 00:00:00.0000 
-- D9xihkWmE70k1KTKyPRS Md Riaz 1645355262000 NULL NULL NULL 2022-02-20 17:07:42.0000 
-- OdTunjuFNSC13vn8vNI4 Md Riaz 1644390962000 NULL NULL NULL 2022-02-09 13:16:02.0000 
-- MnNfnvzyJ4fyqYMpvJIg Md Riaz 1641890190000 NULL NULL NULL 2022-01-11 14:36:30.0000 
-- ZDdK4CtlxLM2GacxtaEh Rashid Zaman 1635833725000 NULL NULL NULL 2021-11-02 12:15:25.0000 
-- YtpN31lO3JM0T5LC2ACc Shompa Karmoker 1646033059000 NULL NULL NULL 2022-02-28 13:24:19.0000 
-- YF9NqkvZYT5kxv8pGo1x Hasib 1633223191349 NULL NULL NULL 2021-10-03 07:06:31.3490


-- to get sessions with highest duration, previously a session can be more than 24 hours, but in later 2021 software updated to make sure it doesn't exit 24 hours limit.
SELECT s.fid, entryTime, exitTime, createdLater, (exitTime - entryTime) duration, ( (exitTime - entryTime)/ 3600000) 'duration Hour',
FROM_UNIXTIME(entryTime/1000) 'Entry Time' 
FROM `sessions` as s
ORDER by duration Desc
-- check also with ascending for negative value

-- found few entries that crosses 24 hours
-- but can't decide what action needed to be taken

-- fid                      User          entryTime         exitTime      createdLater duration  duration Hour   Entry Time 
-- chmXIFDCRCGhJ9GHtXmy      Sujon           1624594755185    1624773561689   NULL    178806504     49.6685    2021-06-25 10:19:15.1850
-- jHp0zDYp9xstR6oBFnL5      Sujon           1624773547483    1624949165157   NULL    175617674     48.7827    2021-06-27 11:59:07.4830
-- JNRcK7Yu4ZQYuJ2TQjEy      Rashid Zaman    1624518000021    1624692422257   NULL    174422236     48.4506    2021-06-24 13:00:00.0210
-- 3xFauMvBQyxd3rnVFZfN      Rashid Zaman    1624850799163    1624952514197   NULL    101715034     28.2542    2021-06-28 09:26:39.1630
-- CZgXXQgK3ls2iWsgNxNz      Rashid Zaman    1617509534065    1617609732648   NULL    100198583     27.8329    2021-04-04 10:12:14.0650
-- 2iwqOaxS50eNnu8dC7vg      Sujon           1619863200000    1619961687560   NULL    98487560      27.3577    2021-05-01 16:00:00.0000
-- Xk4SnukqQuKpqS133efD      Prince          1618191570885    1618286879224   NULL    95308339      26.4745    2021-04-12 07:39:30.8850
