import os
import json
# import mysql.connector


def handler(event, context):
    # db_host = os.environ.get("DB_HOST")
    # db_user = "test"
    # db_password = "Qwerty123!"
    # db_name = "test"
    #
    # # Connect to the database
    # connection = mysql.connector.connect(
    #     host=db_host,
    #     user=db_user,
    #     password=db_password,
    #     database=db_name
    # )
    #
    # # Execute your query
    # cursor = connection.cursor()
    # cursor.execute("SELECT * FROM users")
    # data = cursor.fetchall()
    #
    # # Close the connection
    # connection.close()
    #
    # # Convert data to JSON
    # json_data = json.dumps(data)

    # Return the JSON data
    return {
        "statusCode": 200,
        "body": {'test': 'test'},
        "headers": {
            "Content-Type": "application/json"
        }
    }
