SELECT * FROM users WHERE NOT email = "ernestonavas10@outlook.com";     -- Muestra todos los correos que no sean 'ernestonavas53@gmail.com'

SELECT * FROM users WHERE NOT email = "ernestonavas10@outlook.com" AND age = 23;       -- Muestra todos los correos que no sean 'ernestonavas53@gmail.com' y que tengan edad 23

SELECT * FROM users WHERE NOT email = "ernestonavas10@outlook.com" OR age = 23;         -- Muestra todos los correos que no sean 'ernestonavas53@gmail.com' o que tengan edad 23