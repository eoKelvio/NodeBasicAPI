USE test_db;

--TODO Crie a tabela de user;
-- Criação da tabela user
CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Criação da tabela post
CREATE TABLE IF NOT EXISTS post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(id)
);
--TODO Crie a tabela de posts;

CREATE TABLE IF NOT EXISTS persons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    gender VARCHAR(10),
    birth_date DATE NOT NULL,
    "address" VARCHAR NOT NULL,
    salary FLOAT NOT NULL,
    cpf VARCHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    status_id INTEGER NOT NULL,
    due_day INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    balance FLOAT NOT NULL,
    avaliable_balance FLOAT NOT NULL,
    CONSTRAINT fk_person
        FOREIGN KEY(person_id) 
        REFERENCES persons(id)
);

CREATE TABLE IF NOT EXISTS cards (
    id SERIAL PRIMARY KEY,
    card_number VARCHAR(16) NOT NULL,
    account_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    "limit" FLOAT NOT NULL,
    expiration_date VARCHAR NOT NULL,
    CONSTRAINT fk_account
        FOREIGN KEY(account_id) 
        REFERENCES accounts(id)
);




