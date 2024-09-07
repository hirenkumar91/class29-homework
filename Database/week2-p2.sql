CREATE INDEX idx_student_name ON student(name);


ALTER TABLE `class`
ADD COLUMN `status` ENUM('not-started', 'ongoing', 'finished') NOT NULL DEFAULT 'not-started';
