drop table tablea;
CREATE TABLE TableA
	(`project` VARCHAR(20), `user` VARCHAR(20), `total_hour` int)
;
	
INSERT INTO TableA
	(`project`, `user`, `total_hour`)
VALUES
	('project_1', 'user1', 50),
	('project_1', 'user2', 60),
	('project_1', 'user3', 70),
	('project_1', 'user1', 50),
	('project_1', 'user2', 60),
	('project_1', 'user3', 70),
	('project_2', 'user1', 50),
	('project_2', 'user2', 60),
	('project_2', 'user4', 80),
	('project_2', 'user1', 50),
	('project_2', 'user2', 60),
	('project_2', 'user4', 80);


SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'max(case when col = ''',
      col,
      ''' then value end) as `', 
      col, '`')
  ) INTO @sql
FROM
(
  select concat('', `user`) col
  from tableA
)d;

SET @sql = CONCAT('SELECT project, ', @sql, ' 
                  from
                  (
                    select project, concat('''', user) col, total_hour value
                    from tableA
                  ) d
                  group by project');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

