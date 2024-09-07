SELECT task.*
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN user ON user_task.user_id = user.id
WHERE user.email LIKE '%@spotify.com';

SELECT task.*
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN user ON user_task.user_id = user.id
WHERE user.name = 'Donald Duck'
  AND task.status_id= (select id from status where name="Not started");


SELECT task.*
FROM task
JOIN user_task ON task.id = user_task.task_id
JOIN user ON user_task.user_id = user.id
WHERE user.name = 'Maryrose Meadows'
  AND MONTH(task.created) = 9
  AND YEAR(task.created) = 2024;  -- Adjust the year as needed

SELECT 
    EXTRACT(YEAR FROM created) AS year,
    EXTRACT(MONTH FROM created) AS month,
    COUNT(*) AS task_count
FROM 
    task
GROUP BY 
    EXTRACT(YEAR FROM created),
    EXTRACT(MONTH FROM created)
ORDER BY 
    year, 
    month;
