import boto3
import os
import pandas as pd
import io
from dotenv import load_dotenv
# Carregar variáveis de ambiente do arquivo .env
load_dotenv()

# Criar cliente S3
s3 = boto3.client(
    "s3",
    region_name=os.getenv("AWS_REGION"),
    endpoint_url=os.getenv("S3_ENDPOINT_URL"),
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
)

# Nome do bucket e do arquivo
bucket_name = os.getenv("BUCKET_NAME")

# Gerar parquet de dos dados
for archive in os.listdir("../data"):
    if archive.endswith(".csv"):
        df = pd.read_csv(f"../data/{archive}")
        parquet_buffer = io.BytesIO()
        df.to_parquet(parquet_buffer, index=False)
        parquet_buffer.seek(0)
        name_archive = archive.split(".")[0]
        s3.upload_fileobj(parquet_buffer, bucket_name, f"{name_archive}.parquet")