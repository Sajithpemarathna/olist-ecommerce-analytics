# Olist E-commerce Analytics

This repository contains an end-to-end analytics project based on the Olist Brazilian e-commerce dataset.  
The objective is to build a complete analytics workflow: ingesting raw CSV files into PostgreSQL, transforming them into clean analytical tables, and developing Tableau dashboards for business insights.

---

## Project Goals

- Centralise all raw Olist CSV files in PostgreSQL  
- Clean and standardise the dataset for analysis  
- Build DIM and FACT tables for BI consumption  
- Create two Tableau dashboards:
  - Executive Sales & Customer Overview  
  - Product, Seller & Delivery Performance  

---

## Tech Stack

- PostgreSQL – raw → staging → analytics modelling  
- SQL – cleaning, transformations, feature creation  
- Python – ingestion of CSV files into PostgreSQL  
- Tableau Public – data visualisation & dashboards  
- Git & GitHub – version control and project management  

---

## Folder Structure

```
olist-ecommerce-analytics/
│
├── data/
│   └── raw/                         # Raw Olist CSV files
│
├── sql/
│   ├── staging/                     # Cleaned & standardised STG tables
│   ├── analytics/                   # DIM & FACT tables for BI
│   └── *.sql                        # Individual transformation scripts
│
├── src/
│   └── load_raw_to_postgres.py      # Python ingestion script
│
├── tableau/
│   ├── README.md                    # Dashboard documentation
│   ├── dashboard_1_executive_overview.png
│   └── dashboard_2_product_seller_delivery.png
│
├── .env                             # Local DB credentials (not committed)
├── .gitignore
└── README.md                        # Main project documentation
```

---

## End-to-End Data Pipeline

### 1. Raw Data Ingestion (Python → PostgreSQL)
- All Olist CSV files are loaded into PostgreSQL schema `raw` using `load_raw_to_postgres.py`.

### 2. STAGING Layer (SQL)
Scripts in `sql/staging/` perform:
- Data type corrections  
- Basic cleaning (trimming, lowercasing, deduplication)  
- Normalising key formats  

### 3. Analytics Layer – DIM & FACT Tables
Scripts in `sql/analytics/` create:
- `dim_customers`, `dim_products`, `dim_sellers`, `dim_date`  
- `fct_orders`, `fct_order_items`  

### 4. Tableau Dashboards
Two public dashboards were created using the analytics tables.

---

## Dashboard 1: Executive Sales & Customer Overview

Link:  
https://public.tableau.com/shared/9Y5269RD9?:display_count=n&:origin=viz_share_link

Purpose: High-level overview of revenue, orders, customer distribution and product performance.

Key Metrics:
- Total Orders  
- Total Revenue  
- Total Customers  
- Average Order Value per Customer  
- Repeat Customer Rate  
- Average Order Value  

Main Visuals:
- Monthly Revenue & Orders Trend  
- Sales by State (Map)  
- Top Product Categories by Revenue  
- Orders by Status  
- Customer Concentration by State  

---

## Dashboard 2: Product, Seller & Delivery Performance

Link:  
https://public.tableau.com/views/ProductSellerDeliveryPerformance/ProductSellerDeliveryPerformance

Purpose: Operational monitoring focusing on sellers, delivery performance and logistics.

Key Metrics:
- Total Sellers  
- Total Products Sold  
- Average Revenue per Seller  
- Average Delivery Time  
- Late Delivery Percentage  
- Average Freight Cost  

Main Visuals:
- Delivery Time Distribution  
- Shipping Cost by State  
- Price vs Freight vs Delivery Delay  
- Top 10 Products by Revenue  
- Seller Revenue Treemap  
- Top 10 Sellers by Revenue  

Global Filters:
- Date  
- Product Category  
- Seller  
- Late Delivery Flag  

---

## Business Insights (Examples)

- Late deliveries average around 6–7%, concentrated in high-volume states  
- Revenue growth peaks in early 2018 and then stabilises  
- A small number of sellers accounts for a large share of total revenue  
- Higher freight cost correlates with higher product price and longer delivery delay  

---

## How to Run the Project Locally

1. Create a PostgreSQL database.  
2. Add DB credentials to a `.env` file.  
3. Run `src/load_raw_to_postgres.py` to ingest CSVs into schema `raw`.  
4. Execute SQL scripts in `sql/staging/` to build STG tables.  
5. Execute SQL scripts in `sql/analytics/` to build DIM and FACT tables.  
6. Connect Tableau to PostgreSQL and build dashboards or load the existing `.png` files.  

---

## What This Project Demonstrates

- Practical SQL analytics on multi-table e-commerce data  
- Proper modelling using RAW → STAGING → DIM/FACT layers  
- Python + PostgreSQL data pipeline skills  
- BI storytelling and dashboard design using Tableau  
- Professional GitHub workflow with branches and project board  

