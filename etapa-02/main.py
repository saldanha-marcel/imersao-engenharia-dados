import io
import os
import pandas as pd
import boto3
from sqlalchemy import create_engine
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

# Listar arquivos no bucket
response = s3.list_objects(Bucket=os.getenv("BUCKET_NAME"))
arquivos = [obj["Key"] for obj in response["Contents"]]

TABLE_NAME = []

for archive in arquivos:
    if archive.endswith(".parquet"):
        name_archive = archive.split(".")[0]
        TABLE_NAME.append(name_archive)


dataframes = {}

for table in TABLE_NAME:

    file_key = f"{table}.parquet"

    response = s3.get_object(Bucket=os.getenv("BUCKET_NAME"), Key=file_key)
    parquet_bytes = response["Body"].read()

    dataframes[table] = pd.read_parquet(io.BytesIO(parquet_bytes))

    print(f"✅ {table}: {len(dataframes[table])} linhas carregadas")


# CONECTAR COM POSTGRESQL

engine = create_engine(os.getenv("DATABASE_HOST"))

for table, df in dataframes.items():

    print(f"🚀 Carregando tabela {table} para PostgreSQL...")
    df.to_sql(
        table,
        engine,
        if_exists="replace",
        index=False
    )

# Fechar conexão
engine.dispose()