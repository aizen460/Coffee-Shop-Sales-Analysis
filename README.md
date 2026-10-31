# Coffee Shop Sales Analysis | MySQL & Power BI

> End-to-end sales analysis of three coffee shop stores (Jan–Jun 2023): raw CSV → relational MySQL database → SQL business analysis → 3-page interactive Power BI report.

![Sales Overview](https://github.com/user-attachments/assets/fd7d4814-d0e1-4395-b9c4-056e62a91c7d)



---

## At a Glance

| Metric | Value |
|---|---:|
| Analysis period | 1 Jan – 30 Jun 2023 |
| Total revenue | $691,918.94 |
| Total quantity sold | 214,470 |
| Transactions | 149K |
| Average transaction value | $4.64 |
| Average items per transaction | ~1.4 |
| Store locations | 3 |
| Distinct products | 80 |

*Currency assumed to be USD (New York store locations); the dataset has no currency field.*

---

## Key Findings

1. **Revenue roughly doubled.** Monthly revenue grew from ~$81K in January to ~$165K in June (about 2x), after a dip to ~$75K in February.
2. **Growth is slowing.** Month-over-month growth was ~31% in May but only ~6% in June, so the steep climb may be levelling off. Six months of data cannot show whether this is seasonal.
3. **Two categories carry the business.** Coffee and Tea together generate about two-thirds of revenue.
4. **A few product types dominate.** Barista Espresso ($89.35K), Brewed Chai tea ($77.08K) and Hot chocolate ($72.42K) contribute about $238.9K, roughly 35% of total revenue.
5. **The revenue leader is not the volume leader.** Barista Espresso leads on revenue, Brewed Chai tea leads product types on quantity (26,250 units), and Earl Grey Rg is the best-selling individual product (4,708 units).
6. **Stores are balanced.** Hell's Kitchen $234K, Astoria $231K and Lower Manhattan $227K are within about 3% of each other.
7. **Demand peaks in the morning.** Transactions are highest around 8–10 AM and fall sharply afterwards.
8. **Baskets are small.** Customers buy about 1.4 items per transaction at a $4.64 average transaction value.

### Recommendations
*These are hypotheses from the data, not tested interventions.*
- Test breakfast and bakery bundles with morning coffee to raise basket size.
- Align staffing and preparation with the 8–10 AM peak.
- Test promotions in quieter hours and compare against a baseline.
- Promote Bakery and Drinking Chocolate to reduce dependence on Coffee and Tea.
- Focus on product mix and timing rather than store-level fixes, since the stores perform almost equally.

---

## Tools & Technologies

| Tool | Used for |
|---|---|
| **MySQL** | Database creation, relational table design, data quality checks, validation, exploratory data analysis, business analysis |
| **Power BI** | Data modelling, DAX measures, KPI cards, interactive dashboards, slicers, drill-through |
| **CSV** | Source dataset of coffee shop sales records |

---

## Dataset

Coffee shop sales records with:
- Transaction identifiers, dates and times
- Product identifiers, categories, types, details and unit prices
- Store identifiers and locations
- Transaction quantities

---

## Project Workflow

1. Imported the raw sales dataset into MySQL.
2. Created related tables for transactions, products and stores.
3. Converted dates and times to appropriate data types.
4. Established primary key and foreign key relationships.
5. Performed data quality checks and validation.
6. Conducted exploratory data analysis with SQL.
7. Wrote SQL queries to answer business questions.
8. Built a 3-page interactive Power BI report.

### Data Model

![Data Model](https://github.com/user-attachments/assets/91c388ba-578b-4266-92ae-a8dc60ac3afe)
- **transactions:** transaction ID, date, time, quantity, store ID, product ID
- **products:** product ID, category, type, detail, unit price
- **stores:** store ID, store location

Calculated columns for time analysis: **Month Name** (from the transaction date) and **Transaction Hour**.

---

## SQL Analysis

[View MySQL Scripts](https://github.com/aizen460/Coffee-Shop-Sales-Analysis/tree/main/SQL_Scripts)



                              

**Concepts used:** SELECT, WHERE, ORDER BY · INNER JOIN · SUM, AVG, COUNT · GROUP BY and HAVING · subqueries · CASE statements · date and time functions · Common Table Expressions (CTEs) · window functions and ranking · LIMIT

The scripts contain 31 numbered business questions covering revenue, products, stores, time trends and conditional classification.

| Business question | Analysis focus | 
|---|---|
| What is the total revenue generated? | Overall revenue |
| Which products generate the highest revenue? | Product revenue ranking |
| Which product categories perform best? | Category comparison |
| How does revenue compare across stores? | Store performance |
| What are the monthly and daily sales trends? | Time-based analysis |
| During which hours are transactions most frequent? | Hourly patterns |
| Which products sell the highest quantities? | Product demand |
| Which products perform above or below average? | Product comparison |
| How do stores compare by transactions and quantity? | Store operations |
| How can products and stores be classified by revenue? | Conditional business rules |

---

## Power BI Report

| Page | What it shows |
|---|---|
| **1. Sales Overview** | Revenue, transactions, quantity sold and average transaction value; monthly revenue trend; revenue by product category and by store; date, store, category and product type slicers |
| **2. Product Analysis** | Top 10 products by revenue, top 10 product types by quantity, and a product type performance table (revenue, quantity, average unit price) |
| **3. Product Demand** | A drill-through page. Right-click any product (for example in the Top 10 Products chart) → **Drill through** → **Product Demand** to see its monthly demand, quantity by store and demand by hour, with its best-selling month, top store and peak sales hour |

![Product Analysis](https://github.com/user-attachments/assets/0a277e4a-a641-45a8-bd3e-87cc4411873c)
![Product Demand](https://github.com/user-attachments/assets/800b9c33-798a-460a-a24f-50166b5a931d)

### Key DAX Measures

```dax
Total Revenue =
SUMX(
    'coffee_shop transactions',
    'coffee_shop transactions'[transaction_qty] * RELATED('coffee_shop products'[unit_price])
)

Total Quantity Sold = SUM('coffee_shop transactions'[transaction_qty])

Total Transactions = COUNTROWS('coffee_shop transactions')

Average Transaction Value = DIVIDE([Total Revenue], [Total Transactions])

Average Unit Price = AVERAGE('coffee_shop products'[unit_price])
```

Other measures: Best-Selling Product, Best-Selling Month, Top Store, Peak Sales Hour.

---

## Assumptions & Limitations

- **Currency:** Assumed USD based on the New York store locations. The dataset does not specify one.
- **Transactions** are counted as rows in the transactions table.
- **Average Unit Price** is the average list price, not total revenue divided by total quantity.
- **Six months of data**, so year-over-year comparison and full seasonality can't be evaluated.
- **No cost data**, so profit and margin analysis is out of scope. All figures are revenue.
- Chart values are rounded.

---

## Skills Demonstrated

| Skill | Evidence in this project |
|---|---|
| Relational data modelling | Three-table MySQL schema with primary and foreign keys |
| SQL | Joins, aggregation, subqueries, CTEs, CASE logic, window functions |
| Data quality | Data checks and validation queries |
| DAX | Revenue measure using SUMX and RELATED, plus KPI and time measures |
| Data visualisation | Three-page themed report with slicers and drill-through |
| Business reasoning | Findings tied to recommendations on product mix, timing and basket size |

---

## Repository Structure

```text
Coffee-Shop-Sales-Analysis/
├── Dataset/
│   └── Coffee Shop Sales.csv
├── SQL_Scripts/
│   ├── 01_Create_Tables.sql
│   ├── 02_Data_Quality_Checks.sql
│   ├── 03_Data_Validation.sql
│   ├── 04_EDA.sql
│   └── 05_Business_Analysis.sql
├── PowerBI/
│   └── Coffee_Shop_Sales.pbix
├── Screenshots/
│   ├── Sales_Overview.png
│   ├── Product_Analysis.png
│   ├── Product_Demand.png
│   └── Data_Model.png
└── README.md
```

## How to Reproduce

1. Download the dataset from the [Dataset folder](https://github.com/aizen460/Coffee-Shop-Sales-Analysis/tree/main/Dataset).
2. Import the CSV dataset into MySQL.
3. Run all five SQL scripts in the [MySQL Scripts folder](https://github.com/aizen460/Coffee-Shop-Sales-Analysis/tree/main/SQL_Scripts) in numbered order.
4. Download the [Power BI Dashboard (.pbix)](https://github.com/aizen460/Coffee-Shop-Sales-Analysis/blob/main/PowerBI/Coffee_Shop_Sales.pbix).
5. Open the downloaded file in Power BI Desktop.
6. Refresh the data source and explore the interactive dashboard.

---

## Author

**Tanmay Chawan** | B.Sc. Data Science student (graduating 2027) | Navi Mumbai, India
Seeking Data Analyst and Business Analyst internships (Mumbai, Navi Mumbai, Thane, remote)

📧 [Email](mailto:chavantanmay37@gmail.com) · 🔗 [LinkedIn](https://www.linkedin.com/in/tanmaychawan/)
