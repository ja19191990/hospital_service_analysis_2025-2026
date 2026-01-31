from pathlib import Path
from sqlalchemy import create_engine, text
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

# Raíz del proyecto
PROJECT_ROOT = Path(__file__).resolve().parent.parent
SQL_DIR = PROJECT_ROOT / "sql"

# Lista ordenada de scripts SQL
sql_scripts = [
    # Limpieza de vistas analíticas (dependientes)
    SQL_DIR / "ddl" / "cleanup" / "drop_kpi_views.sql",
    
    # Tablas base
    SQL_DIR / "ddl" / "generales_create_table.sql",
    SQL_DIR / "ddl" / "satisfaccion_create_table.sql",

    # Vistas estables (modelo semántico)
    SQL_DIR / "ddl" / "views" / "vw_average_patient_per_procedure.sql",

    # Quality checks
    SQL_DIR / "quality" / "generales_quality_checks.sql",
    SQL_DIR / "quality" / "satisfaccion_quality_checks.sql",
]

# Ejecutar scripts
with engine.connect() as conn:
    for script_path in sql_scripts:
        print(f"\nEjecutando {script_path.name} ...")

        sql = script_path.read_text(encoding="utf-8")
        result = conn.execute(text(sql))

        if result.returns_rows:
            for row in result.fetchall():
                print(row)

        conn.commit()

print("Pipeline SQL ejecutado correctamente")