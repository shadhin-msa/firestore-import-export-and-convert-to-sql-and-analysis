-- ################# View creation code for get_query_code_for_projects_hours_by_users_column ####################

-- need to generate view query code through another sql query. 
-- write that query result in another table field. 
-- copy the query code from that table field make the view creation code,
-- run view creation code. 

-- 1: create table for storing generated query
drop table if Exists storedQueries;
CREATE TABLE storedQueries (`title` VARCHAR(20), `query` VARCHAR(10000));

-- #### run these query all together to create and save view creation code in table  ####
SET @sql = NULL;
SELECT
  GROUP_CONCAT(
    DISTINCT CONCAT(
      'max(case when col = ''',
      col,
      ''' then value end) as `',
      col,
      '`'
    )
  ) INTO @sql
FROM
  (
    select
      concat('', `user`) col
    from
      projectwiseuserworktime
  ) as tmp1;
SET
  @sql = CONCAT(
    'SELECT project, ',
    @sql,
    ' 
                  from
                  (
                    select project, concat('''', user) col, total_hour value
                    from projectwiseuserworktime
                  ) as tmp2
                  group by project'
  );
INSERT into
  storedQueries (title, query)
values
  ('projects_work_hour_by_users_collumn', @sql);
-- ### end of code block that need to run all together ###




-- continue final report view sql file
