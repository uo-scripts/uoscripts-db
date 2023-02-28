CREATE TABLE users (
    id SERIAL PRIMARY KEY,
	email VARCHAR UNIQUE NOT NULL,
	password TEXT NOT NULL,
    verified BOOLEAN DEFAULT FALSE,
	reset_password_uuid uuid DEFAULT NULL,
	reset_password_requested_at TIMESTAMP DEFAULT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	CHECK (
		LOWER(email) ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'
	)
);