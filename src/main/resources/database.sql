CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    scholarship NUMERIC(100) NOT NULL
);

INSERT INTO students (name, scholarship) VALUES ('Andrey', 5000);
INSERT INTO students (name, scholarship) VALUES ('Anton', 7000);
INSERT INTO students (name, scholarship) VALUES ('Arsenii', 3000);
INSERT INTO students (name, scholarship) VALUES ('Ivan', 4000);
INSERT INTO students (name, scholarship) VALUES ('Diana', 10000);

COMMIT;

DROP TABLE students;
