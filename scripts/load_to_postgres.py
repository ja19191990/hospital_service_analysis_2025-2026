from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

# Crear engine de PostgreSQL
engine = create_engine(
    f"postgresql+psycopg2://{os.getenv('DB_USER')}:"
    f"{os.getenv('DB_PASSWORD')}@"
    f"{os.getenv('DB_HOST')}:"
    f"{os.getenv('DB_PORT')}/"
    f"{os.getenv('DB_NAME')}"
)

# Definir rutas del proyecto
PROJECT_ROOT = Path(__file__).resolve().parent.parent
DATA_PATH = PROJECT_ROOT / "data" / "processed" / "df_sql.csv"

print("Conectando a PostgreSQL...")
print(f"Archivo CSV: {DATA_PATH}")

# Cargar CSV
df = pd.read_csv(DATA_PATH)

print(f"Filas cargadas desde CSV: {len(df)}")


# Enviar a PostgreSQL
df.to_sql(
    "df_sql",
    engine,
    if_exists="replace",
    index=False
)

print("Tabla df_sql creada correctamente en PostgreSQL")