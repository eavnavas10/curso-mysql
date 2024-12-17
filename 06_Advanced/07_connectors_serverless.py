# Clever Cloud, Host gratuito para bases de datos
import mysql.connector

config = {
    "host": "bmdk7xdxwnel0gyjrrzz-mysql.services.clever-cloud.com",
    "port": "3306",
    "database": "bmdk7xdxwnel0gyjrrzz",
    "user": "uvng3kevrzysmbct",
    "password": "XFchTtQmXFdt1fnhxdZC"
}

connection = mysql.connector.connect(**config)
cursor = connection.cursor()

query = "SELECT * FROM users WHERE user_id = 6;"
print(query)
cursor.execute(query)
result = cursor.fetchall()

for row in result:
    print(row)
    
cursor.close()
connection.close()