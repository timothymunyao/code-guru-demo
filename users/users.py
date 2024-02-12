import os
import json
import pymysql


def handler(event, context):
    db_host = os.environ.get("DB_HOST")
    db_user = os.environ.get("DB_USER")
    db_password = os.environ.get("DB_PASSWORD")
    db_name = os.environ.get("DB_NAME")

    # Connect to the database
    connection = pymysql.connect(
        host=db_host,
        user=db_user,
        password=db_password,
        database=db_name
    )

    # Execute your query
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM users")
    data = cursor.fetchall()

    # Close the connection
    connection.close()

    # Convert data to JSON
    json_data = json.dumps(data)

    # Return the JSON data
    return {
        "statusCode": 200,
        "body": json_data,
        "headers": {
            "Content-Type": "application/json"
        }
    }
