# 🌾 Harvest DWH Pipeline

An end-to-end data engineering project that extracts data from a REST API (DummyJSON), transforms it using Python, loads it into PostgreSQL staging, and builds a Snowflake-schema data warehouse using dbt.

---

## 🏗️ Architecture

```
DummyJSON API
     │
     ▼
Python Notebooks (Extract + Transform)
     │
     ▼
PostgreSQL — staging schema (raw data)
     │
     ▼
dbt (Transform + Test + Document)
     │
     ▼
PostgreSQL — dwh schema (Snowflake Schema)
```

---

## 🛠️ Tech Stack

| Layer | Tool |
|-------|------|
| Extraction & Transformation | Python, Pandas, Jupyter Notebooks |
| Data Storage | PostgreSQL (local) |
| Data Warehouse Modelling | dbt (dbt-postgres) |
| SQL Client | DBeaver |
| Version Control | Git + GitHub |

---

## 📁 Project Structure

```
DWH Project/
│
├── Json data/                  # Raw JSON files from DummyJSON API
│   ├── users/
│   ├── products/
│   ├── carts/
│   ├── recipes/
│   ├── posts/
│   ├── comments/
│   ├── todos/
│   └── quotes/
│
├── CSV outputs/                # Intermediate CSV files
│
├── Notebooks/                  # ETL Python notebooks
│   ├── users.ipynb
│   ├── products.ipynb
│   ├── carts.ipynb
│   ├── recipes.ipynb
│   ├── posts.ipynb
│   ├── comments.ipynb
│   ├── todos.ipynb
│   └── quotes.ipynb
│
└── harvest_dbt/                # dbt project
    ├── models/
    │   ├── staging/
    │   │   └── sources.yml
    │   └── dwh/
    │       ├── schema.yml
    │       ├── dim_users.sql
    │       ├── dim_user_personal.sql
    │       ├── dim_user_address.sql
    │       ├── dim_user_company.sql
    │       ├── dim_user_finance.sql
    │       ├── dim_products.sql
    │       ├── dim_product_details.sql
    │       ├── dim_product_reviews.sql
    │       ├── dim_recipes.sql
    │       ├── dim_todos.sql
    │       ├── dim_quotes.sql
    │       ├── fact_sales.sql
    │       ├── fact_cart_items.sql
    │       ├── fact_posts.sql
    │       └── fact_comments.sql
    ├── dbt_project.yml
    └── README.md
```

---

## 🗄️ Data Sources

All data sourced from [DummyJSON](https://dummyjson.com/) — a free REST API providing realistic mock data.

| Source | Staging Table | Rows |
|--------|--------------|------|
| Users | staging.users | 208 |
| Products | staging.products | 194 |
| Product Reviews | staging.product_reviews | 582 |
| Carts | staging.carts | 50 |
| Cart Items | staging.cart_items | 198 |
| Posts | staging.posts | 251 |
| Comments | staging.comments | 340 |
| Recipes | staging.recipes | 50 |
| Todos | staging.todos | 254 |
| Quotes | staging.quotes | 1454 |

---

## 🏛️ DWH Schema (Snowflake)

### Fact Tables
| Table | Description | Rows |
|-------|-------------|------|
| fact_sales | One row per cart/transaction | 50 |
| fact_cart_items | Line items per cart | 198 |
| fact_posts | User posts | 251 |
| fact_comments | Comments on posts | 340 |

### Dimension Tables
| Table | Description | Rows |
|-------|-------------|------|
| dim_users | Core user attributes | 208 |
| dim_user_personal | Personal details (bio, physical) | 208 |
| dim_user_address | Home address | 208 |
| dim_user_company | Company & work details | 208 |
| dim_user_finance | Banking & crypto details | 208 |
| dim_products | Core product attributes | 194 |
| dim_product_details | Extended product info | 194 |
| dim_product_reviews | Product reviews | 582 |
| dim_recipes | Recipes linked to users | 50 |
| dim_todos | User todo items | 254 |
| dim_quotes | Standalone quotes | 1454 |

---

## ⚙️ How to Run

### Prerequisites
- Python 3.12+
- PostgreSQL (local)
- dbt-postgres (`pip install dbt-postgres`)

### 1. Set up the database
```sql
CREATE DATABASE harvest_db;
```

### 2. Run the ETL notebooks
Open each notebook in `Notebooks/` and run all cells top to bottom.
This will push data into the `staging` schema in `harvest_db`.

### 3. Configure dbt
Edit `~/.dbt/profiles.yml`:
```yaml
harvest_dbt:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      port: 5432
      user: your_user
      password: your_password
      dbname: harvest_db
      schema: dwh
      threads: 4
```

### 4. Run dbt
```bash
cd harvest_dbt
dbt run       # builds all DWH tables
dbt test      # runs 32 data quality tests
dbt docs generate && dbt docs serve   # opens documentation
```

---

## ✅ dbt Tests

32 data quality tests covering:
- Primary key uniqueness on all dimension and fact tables
- Not-null checks on all key columns and foreign keys

All 32 tests passing.

---

## 📊 Data Lineage

Run `dbt docs serve` to view the full interactive lineage graph showing how data flows from staging sources through to each DWH table.

---

## 🗺️ Roadmap

- [ ] Add Airflow DAGs to orchestrate the full pipeline
- [ ] Add incremental dbt models for large tables
- [ ] Connect a BI tool (e.g. Metabase or Power BI) to the DWH
- [ ] Deploy to cloud (AWS RDS + managed Airflow)
