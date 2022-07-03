
-- days
Drop TABLE IF EXISTS days;
CREATE TABLE IF NOT EXISTS days (
	fid VARCHAR(40) NOT NULL PRIMARY KEY,
	timestamp BIGINT ,
	userId VARCHAR(40),
	tasks VARCHAR(1000),
	planningDeadline BIGINT ,
	reviewFinishTime BIGINT,
	reviewIgnored BOOLEAN,
	planningIgnored BOOLEAN,
	planningFinishTime BIGINT,
	lastWorkedTaskId VARCHAR(40),
	reactions  VARCHAR(40),
	message VARCHAR(200),
	comment VARCHAR(200)
);

-- projects
Drop TABLE IF EXISTS projects;
CREATE TABLE IF NOT EXISTS projects (
	fid VARCHAR(40) NOT NULL PRIMARY KEY,
	finished BOOLEAN,
	name VARCHAR(150),
	importance DECIMAL(4,2),
	permitedUsers VARCHAR(500),
	initial VARCHAR(10),
	color VARCHAR(10)	
);


--Sessions
Drop TABLE IF EXISTS sessions;
CREATE TABLE IF NOT EXISTS sessions (
	fid VARCHAR(40) NOT NULL PRIMARY KEY,
	userId VARCHAR(40),
	entryTime BIGINT,
	exitTime BIGINT,
	createdLater BOOLEAN
);

DELETE FROM `sessions`;

--Tasks
Drop TABLE IF EXISTS tasks;

DELETE FROM tasks;

CREATE TABLE IF NOT EXISTS tasks (
	fid VARCHAR(40) NOT NULL PRIMARY KEY,
	title VARCHAR(200),
	timestamp BIGINT,
	done_time BIGINT,
	start_date BIGINT,
	deadline BIGINT,
	duration INT,
	estimate INT,
	done BOOLEAN,
	removedFromTodo BOOLEAN,
	project_id VARCHAR(50),
	user_id VARCHAR(50),
	createdBy VARCHAR(50),
	milestone_id VARCHAR(40),
	order_id INT,
	subTask VARCHAR(400),
	priority  VARCHAR(10),
	startDate BIGINT
);



-- TimeEntries
Drop TABLE  IF EXISTS `timeentries`;
CREATE TABLE `timeentries` (
	fid VARCHAR(40) NOT NULL PRIMARY KEY,
	startTime BIGINT,
	duration INT,
	isBusy BOOLEAN DEFAULT false,
	taskId VARCHAR(40),
	SubTaskId VARCHAR(40),
	userId VARCHAR(40),
  isExtraWork BOOLEAN DEFAULT false
);

-- other queryies

-- import code structure
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

INSERT INTO `timeentries`
( fid, isBusy, taskId, userId, duration, startTime, SubTaskId, isExtraWork) VALUES 
('000BWmp6OyYV8JG8yE9I', false, 'X8v8xWiCZJw6izhFrpfh', 'myxsJVESyfPZTIPpbNRuoKJ7qHF2', 720000, 1586186700000, null, null), 
('00EBaZXdcackFJU5xtZT', false, 'aaLSj35CM6UFW6bhClsD', 'zSKW9rb4mIZLrVQK1dKu8L82y7O2', 4619000, 1632235933000, null, null);

COMMIT;

SHOW VARIABLES LIKE 'max_allowed_packet';

SET GLOBAL max_allowed_packet=16777216;