
import pandas as pd
import boto3

# Load the cleaned dataset
df = pd.read_csv("Sales_Customer_Analytics/data/sales_data.csv")

# Data Cleaning
df.dropna(inplace=True)
df['Total_Revenue'] = df['Units_Sold'] * df['Unit_Price'] * (1 - df['Discount'])

# Save cleaned version
df.to_csv('cleaned_sales_data.csv', index=False)

# Upload to AWS S3 (example)
s3 = boto3.client('s3')
bucket_name = 'cleanedsalesdata'
s3.upload_file('cleaned_sales_data.csv', bucket_name, 'cleaned_sales_data.csv')

print("Data cleaned and uploaded to S3.")
