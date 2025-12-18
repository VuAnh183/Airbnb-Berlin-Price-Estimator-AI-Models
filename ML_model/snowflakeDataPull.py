import csv
import snowflake.connector
from dotenv import load_dotenv
import os


load_dotenv()

USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")
ACCOUNT = os.getenv("ACCOUNT")
WAREHOUSE = os.getenv("WAREHOUSE")
DATABASE = os.getenv("DATABASE")
SCHEMA = os.getenv("SCHEMA")


conn = snowflake.connector.connect(
    user= USERNAME,
    password= PASSWORD,
    account= ACCOUNT,  
    warehouse= WAREHOUSE,
    database= DATABASE,
    schema= SCHEMA
)

query = "SELECT * FROM CLEANSED_LISTINGS_HOSTS"

cursor = conn.cursor()
cursor.execute(query)

rows = cursor.fetchall()
column_names = [desc[0] for desc in cursor.description]


output_path = "Datasets/cleansed_listings_hosts_export.csv"

with open(output_path, mode="w", newline="", encoding="utf-8") as csvfile:
    writer = csv.writer(csvfile)
    
    writer.writerow(column_names)
    
    writer.writerows(rows)

cursor.close()
conn.close()

print("CSV export complete:", output_path)
