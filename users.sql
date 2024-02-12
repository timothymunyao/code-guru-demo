CREATE TABLE users
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255)        NOT NULL,
    email   VARCHAR(255) UNIQUE NOT NULL,
    country VARCHAR(255)        NOT NULL
);

INSERT INTO users (id, name, email, country)
VALUES
    (1, 'John Doe', 'johndoe@example.com', 'Kenya'),
    (2, 'Jane Doe', 'janedoe@example.com', 'Kenya'),
    (3, 'Mike Smith', 'mikessmith@example.com', 'Kenya'),
    (4, 'Mary Jones', 'maryjones@example.com', 'Kenya'),
    (5, 'David Miller', 'davidmiller@example.com', 'Kenya'),
    (6, 'Sarah Jackson', 'sarahjackson@example.com', 'Kenya'),
    (7, 'Daniel Brown', 'danielbrown@example.com', 'Kenya'),
    (8, 'Elizabeth Garcia', 'elizabethgarcia@example.com', 'Kenya'),
    (9, 'Robert Williams', 'robertwilliams@example.com', 'Kenya'),
    (10, 'Jennifer Lopez', 'jenniferlopez@example.com', 'Kenya'),
    (11, 'Mark Anderson', 'markanderson@example.com', 'Kenya'),
    (12, 'Susan Davis', 'susandavis@example.com', 'Kenya'),
    (13, 'Christopher Walker', 'christopherwalker@example.com', 'Kenya'),
    (14, 'Karen Thomas', 'karenthomas@example.com', 'South Kenya'),
    (15, 'Scott Allen', 'scottallen@example.com', 'Kenya');