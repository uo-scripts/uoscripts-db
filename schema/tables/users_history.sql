CREATE TABLE users_history (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
	email VARCHAR NOT NULL,
	password TEXT NOT NULL,
    verified BOOLEAN DEFAULT FALSE,
	reset_password_uuid uuid DEFAULT NULL,
	reset_password_requested_at TIMESTAMP DEFAULT NULL,
	created_at TIMESTAMP DEFAULT NULL,
    updated_at TIMESTAMP DEFAULT NOW()
);