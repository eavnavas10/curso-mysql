import mysql.connector

def print_user(user):
    config = {
        "host": "127.0.0.1",
        "port": "3306",
        "database": "hello_mysql",
        "user": "root",
        "password": "Neto1523."
    }

    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()

    query = "SELECT * FROM users WHERE name = %s;"
    print(query)
    cursor.execute(query, (user,))
    result = cursor.fetchall()

    for row in result:
        print(row)
        
    cursor.close()
    connection.close()

# Ingreso normal
print_user("Ernesto")


# Ataque malicioso
#print_user("'; UPDATE users SET age = 20 WHERE user_id = 1;'")