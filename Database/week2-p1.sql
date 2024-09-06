--Add a task with these attributes: title, description, created, updated, due_date, status_id, user_id
insert into task (title, description, created, updated, due_date, status_id) values ('finish Homework', 'Title says it all.', now(), '2017-10-15 13:05:09', null, 2);
-- Change the title of a task
UPDATE task
set title="change the task"
WHERE id="4";
-- Change a task due date

UPDATE task
set due_date=now()
where id= "4";

-- change a task status
update task
set status_id= "3"
where id= "4";
--Change a task status to done

update task
set status_id = (
    select id from status where name="Not started"
)
where id = "4";

select * from task;
Delete a task
DELETE FROM task where id = "3";