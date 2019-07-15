PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies ;
DROP TABLE IF EXISTS question_likes ;
DROP TABLE IF EXISTS question_follows ;
DROP TABLE IF EXISTS questions ;
DROP TABLE IF EXISTS users ;

CREATE TABLE users
(
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT
);

CREATE TABLE questions
(
    id INTEGER PRIMARY KEY,
    title TEXT,     --"Whats gonna be on A03"
    body TEXT,
    author_id INTEGER UNIQUE,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows 
(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies
(
    id INTEGER PRIMARY KEY,
    parent_user_id INTEGER NOT NULL,
    question_id TEXT,
    parent_reply INTEGER ,


    FOREIGN KEY (parent_user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,
    -- likes BOOLEAN DEFAULT false,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES 
    ('Rick', 'Sanchez'),
    ('Morty', 'Smith');

INSERT INTO questions 
    (title, body, author_id) --user_id wuz here
VALUES 
    ('Ricks Question','I know all and have no questions', (SELECT id FROM users WHERE fname = 'Rick')),
    ('Mortys Question','Where are my pants oaaohaoaha', (SELECT id FROM users WHERE fname = 'Morty'));
    

INSERT INTO question_follows 
    (user_id, question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Rick'), (SELECT id FROM questions WHERE title LIKE 'Ricks%')),
    ((SELECT id FROM users WHERE fname = 'Morty'), (SELECT id FROM questions WHERE title LIKE 'Morty%'));
    

INSERT INTO replies 
    (parent_user_id, question_id, parent_reply)
VALUES 
    (
     (SELECT id FROM users WHERE fname = 'Rick'), 
     (SELECT id FROM questions WHERE title LIKE 'Rick%'), 
     NULL
    ),

    (
     (SELECT id FROM users WHERE fname = 'Morty'),
     (SELECT id FROM questions WHERE title LIKE 'Morty%'),
     NULL
    );

    

INSERT INTO question_likes
    (user_id, question_id)
VALUES 
    (
     (SELECT id FROM users WHERE fname = 'Rick'), 
     (SELECT id FROM questions WHERE title LIKE 'Rick%')
    ),

    (
     (SELECT id FROM users WHERE fname = 'Morty'),
     (SELECT id FROM questions WHERE title LIKE 'Morty%')
    );




