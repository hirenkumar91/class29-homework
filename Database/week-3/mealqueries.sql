
--Get all meals
--Add a new meal
--Get a meal with any id, fx 1
--Update a meal with any id, fx 1. Update any attribute fx the title or multiple attributes
--Delete a meal with any id, fx 1

SELECT * from meal;

-- add meal

INSERT INTO meal (
  title,
  description, 
  location, 
  `when`, 
  max_reservations, 
  price, 
  created_date
) VALUES 
('Spaghetti A.', 'Classic Italian pasta dish with rich meat sauce.', 'Restaurant A', '2024-09-15 18:30:00', 50, 12.50, NOW()),
('Pizza B.', 'Wood-fired pizza with tomato, mozzarella, and basil.', 'Restaurant B', '2024-09-16 12:00:00', 40, 10.00, NOW()),
('Caesar Salad C.', 'Fresh romaine lettuce with Caesar dressing and croutons.', 'Restaurant C', '2024-09-17 19:00:00', 30, 8.00, NOW()),
('Grilled Salmon D.', 'Perfectly grilled salmon fillet with a lemon butter sauce.', 'Restaurant D', '2024-09-18 20:00:00', 25, 15.00, NOW());

--select meal with id

SELECT * from meal WHERE id = 2;

-- update meal

UPDATE meal
SET title = 'Vegan Burger',
DESCRIPTION = 'Burger with Fries',
price = 19.99
WHERE id = 1;

DELETE from meal WHERE id = 2;

--Get all reservations
--Add a new reservation
--Get a reservation with any id, fx 1
--Update a reservation with any id, fx 1. Update any attribute fx the title or multiple attributes
--Delete a reservation with any id, fx 1


select * from Reservation

INSERT INTO Reservation (
  number_of_guests, 
  meal_id, 
  created_date, 
  contact_phonenumber, 
  contact_name, 
  contact_email
) VALUES 
(4, 1, '2024-09-15 18:30:00', '+1234567890', 'Alice A.', 'alice.a@example.com'),
(2, 4, '2024-09-16 12:00:00', '+0987654321', 'Bob B.', 'bob.b@example.com'),
(6, 1, '2024-09-17 19:00:00', '+1122334455', 'Carol C.', 'carol.c@example.com'),
(3, 3, '2024-09-18 20:00:00', '+1223344556', 'David D.', 'david.d@example.com');


SELECT * FROM Reservation WHERE id = 14;

UPDATE Reservation
SET contact_name = 'spider man'
WHERE id = 14;

DELETE FROM Reservation WHERE id = 12;


--Get all reviews
--Add a new review
--Get a review with any id, fx 1
--Update a review with any id, fx 1. Update any attribute fx the title or multiple attributes
--Delete a review with any id, fx 1

select * from Review;

INSERT INTO Review (
    title,
    description,
    meal_id,
    stars,
    created_date
) VALUES (
    'Amazing Meal!',
    'The meal was absolutely super',
    1,
    5,
    NOW()
);

SELECT * FROM Review WHERE id = 4;

UPDATE Review
SET title = 'bad food', stars = 0
WHERE id = 5;


DELETE FROM Review WHERE id = 1;

--Get meals that has a price smaller than a specific price fx 90
--Get meals that still has available reservations
--Get meals that partially match a title. Rød grød med will match the meal with the title Rød grød med fløde
--Get meals that has been created between two dates
--Get only specific number of meals fx return only 5 meals
--Get the meals that have good reviews
--Get reservations for a specific meal sorted by created_date
--Sort all meals by average number of stars in the reviews

SELECT * FROM meal
WHERE price < 40;

SELECT m.*
FROM meal m
JOIN (
    SELECT meal_id, COUNT(*) AS reserved_count
    FROM Reservation
    GROUP BY meal_id
) r ON m.id = r.meal_id
WHERE m.max_Reservations > r.Reserved_count;

SELECT * FROM meal
WHERE title LIKE '%burg%';

SELECT * FROM meal
WHERE created_date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM meal
LIMIT 7;

SELECT DISTINCT m.*
FROM meal m
JOIN Review r ON m.id = r.meal_id
WHERE r.stars >= 4;

SELECT * FROM Reservation
WHERE meal_id = 1
ORDER BY created_date;

SELECT m.*, COALESCE(AVG(r.stars), 0) AS average_stars
FROM meal m
LEFT JOIN Review r ON m.id = r.meal_id
GROUP BY m.id
ORDER BY average_stars DESC;
