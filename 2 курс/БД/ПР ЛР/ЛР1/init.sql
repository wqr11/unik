CREATE DATABASE wqr;

-- STUDIO DB

CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    middle_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(12),
    email VARCHAR(100),
    INDEX (name),
    INDEX (middle_name),
    INDEX (last_name),
    INDEX (phone),
    INDEX (email)
);

CREATE TABLE projects (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255),
    user_id INT NOT NULL REFERENCES "users"(id),
    INDEX (user_id),
    INDEX (name)
);

CREATE TABLE renders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    result TEXT DEFAULT NULL,
    preview TEXT DEFAULT NULL,
    project_id INT NOT NULL REFERENCES "projects"(id),
    user_id INT NOT NULL REFERENCES "users"(id),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TYPE order_status AS ENUM
    ('CREATED', 'ABORTED', 'PROCESSING', 'PAID', 'IN_PROGRESS', 'ARRIVING', 'DONE');

CREATE TABLE orders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_id INT NOT NULL REFERENCES "projects"(id),
    user_id INT NOT NULL REFERENCES "users"(id),
    status order_status NOT NULL DEFAULT 'CREATED'
);

CREATE TYPE cheque_status AS ENUM
    ('CREATED', 'PROCESSING', 'ERROR', 'ABORTED', 'SUCCESS');

CREATE TABLE cheques (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT NOT NULL REFERENCES "orders"(id),
    ofd_url TEXT DEFAULT NULL,
    status cheque_status NOT NULL DEFAULT 'CREATED',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_ofd_success
        CHECK
            ((status = 'SUCCESS' AND ofd_url IS NOT NULL)
            OR
            (ofd_url IS NULL AND status != 'SUCCESS'))
);

-- CREATE TABLE user_settings (
--     id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     data JSONB DEFAULT NULL,
--     user_id INT NOT NULL REFERENCES "users"(id)
-- );

CREATE TABLE user_settings (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    data JSONB DEFAULT NULL,
    user_id INT NOT NULL REFERENCES "users"(id),
    INDEX(user_id),
    UNIQUE(name,user_id)
);

-- CREATE TABLE server_actions (
--     id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     name VARCHAR(100) NOT NULL UNIQUE,
--     default_allowed BOOL NOT NULL DEFAULT false
-- );

-- CREATE TABLE server_actions_access (
--     action_id INT NOT NULL REFERENCES "server_actions"(id),
--     user_id INT NOT NULL REFERENCES "users"(id),
--     allowed BOOL NOT NULL DEFAULT FALSE,
--     UNIQUE (action_id, user_id)
-- );


-- VALIDATION
--
--
--CHECK chk_email ~ ''
-- CHECK chk_phone ~ '8\d{10}', -- Russian phones only
-- LATER
