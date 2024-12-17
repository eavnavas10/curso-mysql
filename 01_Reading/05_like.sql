SELECT * FROM users WHERE email LIKE '%outlook.com';        -- Indica que mostrará todos los correos que terminen con 'outlook.com'

SELECT * FROM users WHERE email LIKE 'ernesto%';        -- Indica que mostrará todos los correos que empiezen con 'ernesto'

SELECT * FROM users WHERE email LIKE '%@%';     -- Indica que mostrará todos los correos que enmedio lleven un simbolo de '@'