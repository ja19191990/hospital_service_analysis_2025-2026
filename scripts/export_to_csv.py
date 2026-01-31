from pathlib import Path
from sqlalchemy import create_engine
import pandas as pd
import os
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

# Crear engine
engine = create_engine(
    f"postgresql+psycopg2://{os.getenv('DB_USER')}:"
    f"{os.getenv('DB_PASSWORD')}@"
    f"{os.getenv('DB_HOST')}:"
    f"{os.getenv('DB_PORT')}/"
    f"{os.getenv('DB_NAME')}"
)

# Rutas
PROJECT_ROOT = Path(__file__).resolve().parent.parent
EXPORT_DIR = PROJECT_ROOT / 'data' / 'export'
EXPORT_DIR.mkdir(parents=True, exist_ok=True)

tables = [
    'generales', 
    'satisfaccion',
    'vw_average_patient_per_procedure'
]

with engine.connect() as conn:
    for table in tables:
        print(f'Exportando tabla {table} ...')

        df = pd.read_sql(f'SELECT * FROM {table}', conn)
        output_path = EXPORT_DIR / f'{table}.csv'

        df.to_csv(output_path, index=False, encoding='utf-8')
        print(f'Archivo generado: {output_path}')

print('Exportación a CSV completado')