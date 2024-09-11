create DATABASE mealDB;
 use mealDB

CREATE Table meal(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  `when` DATETIME,
  max_reservations INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  created_date DATETIME NOT NULL
);

CREATE TABLE Reservation (
  id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  number_of_guests INT NOT NULL,
  meal_id BIGINT NOT NULL,
  created_date DATETIME NOT NULL,
  contact_phonenumber VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255) NOT NULL,
  contact_email VARCHAR(255) NOT NULL,
  UNIQUE KEY (meal_id, contact_email),
  FOREIGN KEY (meal_id) REFERENCES meal(id)
);



CREATE TABLE Review (
 id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 title VARCHAR(255) NOT NULL,
 description VARCHAR(255) NOT NULL,
 meal_id BIGINT NOT NULL,
 stars INT NOT NULL,
 created_date DATETIME NOT NULL,
 FOREIGN KEY (meal_id) REFERENCES meal(id)
);