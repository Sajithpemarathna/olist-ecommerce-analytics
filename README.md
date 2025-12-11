# Olist E-commerce Analytics

This repository contains an end-to-end analytics project based on the Olist Brazilian e-commerce dataset.  
The objective is to build a complete analytics workflow: ingesting raw CSV files into PostgreSQL, transforming them into clean analytical tables, and developing Tableau dashboards for business insights.

---

## Table of Contents

1. [Project Goals](#project-goals)
2. [Tech Stack](#tech-stack)
3. [Folder Structure](#folder-structure)
4. [End-to-End Data Pipeline](#end-to-end-data-pipeline)
   - [Raw Data Ingestion (Python → PostgreSQL)](#raw-data-ingestion-python--postgresql)
   - [STAGING Layer (SQL)](#staging-layer-sql)
   - [Analytics Layer – DIM & FACT Tables](#analytics-layer--dim--fact-tables)
   - [Tableau Dashboards](#tableau-dashboards)
5. [Dashboard 1: Executive Sales & Customer Overview](#dashboard-1-executive-sales--customer-overview)
6. [Dashboard 2: Product, Seller & Delivery Performance](#dashboard-2-product-seller--delivery-performance)
7. [Business Insights (Examples)](#business-insights-examples)
8. [Key Results & Insights](#key-results--insights)
9. [How to Run the Project Locally](#how-to-run-the-project-locally)
10. [What This Project Demonstrates](#what-this-project-demonstrates)
11. [Roadmap (Future Enhancements)](#roadmap-future-enhancements)




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

![Executive Dashboard](tableau/dashboard_1_executive_overview.png)

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

![Product Seller Dashboard](tableau/dashboard_2_product_seller_delivery.png)

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

## Key Results & Insights

### Dashboard 1 – Executive Sales & Customer Overview

- **Total revenue:** \$13.6M generated from **99,441 orders**.
- **Customer base:** **96,096 unique customers**.
- **Average order value (AOV):** **\$136.70** per order.
- **Average revenue per customer:** **\$141.40**.
- **Repeat customer rate:** only **3.12%** → Olist behaves more like a marketplace with many one-time buyers than a loyalty-driven store.
- **Top product categories:** Revenue is dominated by **Health & Beauty, Watches_Gifts, Bed_Bath_Table, Sports_Leisure, Computers_Accessories** (Top Product Categories by Revenue).
- **Geographic concentration:**
  - **São Paulo (SP)** ≈ **41.7k** customers  
  - **Rio de Janeiro (RJ)** ≈ **12.9k** customers  
  - **Minas Gerais (MG)** ≈ **11.6k** customers  
  These three states account for the majority of the total customer base (Customer Concentration by State).
- **Order status performance:** The vast majority of orders are **delivered successfully**; cancelled, returned or unavailable orders are only a very small fraction (Orders by Order Status).
- **Growth trend:** Monthly Revenue & Orders Trend shows steady growth from mid-2016 to early 2018, with a peak in early 2018 and a drop at the end corresponding to the end of the dataset.

---

### Dashboard 2 – Product, Seller & Delivery Performance

- **Total sellers:** **3,095** active sellers.
- **Total products sold:** **112,650** products.
- **Average revenue per seller:** **\$4,391**.
- **Average delivery time:** **12.5 days**.
- **Late delivery rate:** **6.57%** of orders are delivered late.
- **Average freight (shipping) cost:** **\$19.99** per order.
- **Delivery time distribution:** Most orders are delivered between **7–15 days**, with a long right tail of late deliveries extending beyond **40–60 days** (Delivery Time Distribution).
- **Shipping cost by state:** Freight spend is highest in **high-volume states** (especially **SP**) and tends to increase for more distant regions (Shipping Cost by State).
- **Price vs freight vs delay:** Higher-priced orders generally have **higher freight costs**; late deliveries are more likely when **freight cost and distance increase** (Price vs Freight vs Delivery Delay).
- **Revenue concentration by product and seller:**
  - The **Top 10 Products by Revenue** contribute a large share of total product revenue, with the best-selling product earning around **\$63.9k**.
  - The **Top 10 Sellers by Revenue** significantly outperform the long tail of sellers; the leading seller generates about **\$229k** in revenue, showing a strong concentration of sales among a few key sellers.


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

---

## Roadmap (Future Enhancements)

Here are several improvements that can be added to extend the project further:

- **Automate the entire pipeline** using Airflow or dbt for scheduled refreshes.
- **Deploy dashboards** using Tableau Online, Power BI, or a web-based BI solution.
- **Add anomaly detection** for identifying abnormal spikes in delivery time, price, or freight cost.
- **Improve customer analytics** by building RFM segmentation and lifetime value (LTV) models.
- **Add machine learning models** to predict:
  - Delivery delays  
  - Product return probability  
  - Customer churn likelihood  
- **Extend the data model** with additional dimensions (geography details, product hierarchy, seller attributes).
- **Containerize the project** using Docker for easier reproducibility.
- **Implement CI/CD** for SQL checks, style checks, and automated testing.
- **Build API endpoints** to expose cleaned or aggregated data for other applications.

---

