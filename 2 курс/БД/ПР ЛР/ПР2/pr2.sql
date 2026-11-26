-- 1

SELECT
    COUNT(*) as project_count
FROM
    projects
WHERE
    user_id = 1

-- 2

SELECT
    COUNT(*) as render_count
FROM
    render
WHERE
    user_id = 1

-- 3 

SELECT
    SUM(c.amount),
	c.order_id,
	p.name
FROM
    cheques c
	INNER JOIN orders o ON c.order_id = o.id
	INNER JOIN projects p ON o.project_id = p.id
WHERE
	c.status = 'SUCCESS'
GROUP BY
    c.order_id,
	p.name

-- 4

SELECT
    status,
    COUNT(*) AS orders_count
FROM
    orders
GROUP BY
    status
ORDER BY
    orders_count DESC;

-- 5

SELECT
    u.id,
    u.name,
    u.last_name,
    COUNT(o.id) AS orders_count
FROM
    users u
    INNER JOIN orders o ON o.user_id = u.id
GROUP BY
    u.id, u.name, u.last_name
HAVING
    COUNT(o.id) > 1
ORDER BY
    orders_count DESC;

-- 6

SELECT
    user_id,
    COUNT(*) AS settings_count
FROM
    user_settings
GROUP BY
    user_id;

-- 7

SELECT
    MIN(amount) as min_amount,
    MAX(amount) as max_amount
FROM
    cheques
WHERE
    status = 'SUCCESS'

-- 8

SELECT
    MIN(created_at) as first_render,
    MAX(created_at) as last_render
FROM
    renders
WHERE
    user_id = 1

-- 9
SELECT
    COUNT(*) as count_verified
FROM
    users
WHERE
    email IS NOT NULL AND phone IS NOT NULL
    

-- 10
SELECT
    COUNT(*) as render_count
FROM
    renders
WHERE
    result_url IS NOT NULL