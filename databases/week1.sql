-- Find out how many tasks are in the task table
SELECT COUNT(*) AS total_tasks
FROM task;

--Find out how many tasks in the task table do not have a valid due date

SELECT COUNT(*) AS invalid_due_date_count
FROM task
WHERE due_date IS NULL;

--Find all the tasks that are marked as done
SELECT *
FROM task
JOIN status  ON task.status_id = status.id
WHERE status.name = 'done';

--Find all the tasks that are marked as not done

SELECT *
FROM task
JOIN status  ON task.status_id = status.id
WHERE status.name <> 'done';