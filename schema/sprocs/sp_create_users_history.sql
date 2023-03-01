CREATE OR REPLACE FUNCTION sp_create_users_history (user_id INT)
RETURNS TABLE(
	state TEXT,
	message TEXT
)
AS $BODY$
BEGIN
	IF NOT EXISTS(SELECT id FROM users WHERE id = user_id)
	THEN
		RETURN QUERY SELECT 'error' AS state, 'User does not exist.' AS message;
		RETURN;
	END IF;

    INSERT INTO users_history (
        user_id
        ,email
        ,password
        ,verified
        ,reset_password_uuid
        ,reset_password_requested_at
        ,created_at
    )
    SELECT
        id
        ,email
        ,password
        ,verified
        ,reset_password_uuid
        ,reset_password_requested_at
        ,created_at
    FROM users
    WHERE id = user_id;

    RETURN QUERY SELECT 'success' AS state, 'User history created.' AS message;
END;
$BODY$ LANGUAGE plpgsql;