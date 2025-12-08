"""
load_raw_to_postgres.py

Small utility script to load all raw Olist CSV files from `data/raw/`
into a PostgreSQL database (schema: raw).

Usage (from project root):
    python -m src.load_raw_to_postgres
"""

import os
from pathlib import Path

import pandas as pd
from sqlalchemy import create_engine, text


# -------- 1. CONFIGURATION -------- #

# Root of the project (folder where this file lives is src/)
PROJECT_ROOT = Path(__file__).resolve().parents[1]
DATA_RAW_DIR = PROJECT_ROOT / "data" / "raw"

# PostgreSQL connection details
# You can hard-code for now OR read from environment variables / .env
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "olist")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "postgres")

# Mapping: csv file name → table name in schema raw
CSV_TO_TABLE = {
    "olist_customers_dataset.csv": "olist_customers_dataset",
    "olist_geolocation_dataset.csv": "olist_geolocation_dataset",
    "olist_order_items_dataset.csv": "olist_order_items_dataset",
    "olist_order_payments_dataset.csv": "olist_order_payments_dataset",
    "olist_order_reviews_dataset.csv": "olist_order_reviews_dataset",
    "olist_orders_dataset.csv": "olist_orders_dataset",
    "olist_products_dataset.csv": "olist_products_dataset",
    "olist_sellers_dataset.csv": "olist_sellers_dataset",
    "product_category_name_translation.csv": "product_category_name_translation",
}


# -------- 2. HELPER FUNCTIONS -------- #

def get_engine():
    """Create a SQLAlchemy engine for PostgreSQL."""
    conn_str = (
        f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}"
        f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )
    return create_engine(conn_str)


def ensure_raw_schema(engine):
    """Create schema raw if it does not exist."""
    with engine.begin() as conn:
        conn.execute(text("CREATE SCHEMA IF NOT EXISTS raw;"))


def load_csv_to_table(engine, csv_path: Path, table_name: str):
    """Load a single CSV file into raw.<table_name>."""
    print(f"→ Loading {csv_path.name} into raw.{table_name} ...")

    df = pd.read_csv(csv_path)

    # Write to Postgres, replacing the table if it already exists
    df.to_sql(
        name=table_name,
        con=engine,
        schema="raw",
        if_exists="replace",
        index=False,
    )

    print(f"   Done. Rows loaded: {len(df):,}")


# -------- 3. MAIN SCRIPT -------- #

def main():
    engine = get_engine()
    ensure_raw_schema(engine)

    # Check that data/raw exists
    if not DATA_RAW_DIR.exists():
        raise FileNotFoundError(f"Raw data folder not found: {DATA_RAW_DIR}")

    for csv_name, table_name in CSV_TO_TABLE.items():
        csv_path = DATA_RAW_DIR / csv_name
        if not csv_path.exists():
            print(f"⚠️  Skipping {csv_name} – file not found in data/raw.")
            continue

        load_csv_to_table(engine, csv_path, table_name)

    print("\n✅ All available raw CSVs have been loaded into schema `raw`.")


if __name__ == "__main__":
    main()

print("✅ Finished loading raw CSVs into Postgres.")
