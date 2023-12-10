<a name="readme-top"></a>
# Vehicle Sales Performance Dashboard with Excel
Welcome to my first **Excel project**. The primary objective of this project is to explore and analyze the vehicle sales data, to uncover insightful trends and meaningful patterns.
I aim to showcase my skills in data cleaning, pivot tables, and visualization creation.

## Table of Contents
- [Tools Used](#Tools-Used)
- [Data Source](#Data-Source)
- [Sheet Navigation](#Sheet-Navigation)
- [Dashboard Navigation](#Dashboard-Navigation)
- [Interpretation](#Interpretation)
- [Summary of Findings](#Summary-of-Findings)
- [Acknowledgments](#Acknowledgments)
- [Contact](#Contact)

## Tools Used
- Excel (Pivot Tables, Pivot Charts, Slicers, XLookups)

## Data Source
Source: https://www.kaggle.com/datasets/kyanyoga/sample-sales-data/code?datasetId=435&sortBy=voteCount

This sales dataset records from **January 2003** to **May 2005**.

| Columns | Description |
| --- | --- |
| ORDERNUMBER	| Unique order number for each customer. |
| QUANTITYORDERED	|  Number of the quantity ordered from a product. | 
| PRICEEACH	| Cost of the product. |
| ORDERLINENUMBER	| Unique number of orders. |
| SALES	| Total sales of the product. | 
| ORDERDATE	|  Order date of the product. | 
| QTR_ID	| Quarter of the year. |
| MONTH_ID	| Month number. |
| MONTH	| Month. |
| YEAR_ID	| Year. |
| PRODUCTLINE	| Type of vehicle. |
| MSRP	| Manufacturer's suggested retail price. |
| PRODUCTCODE	| Product code. |
| CUSTOMERNAME	|  Company name of the customer. | 
| PHONE	| Customer phone number. |
| ADDRESSLINE1	| Customer address. |
| ADDRESSLINE2	| Customer address. |
| CITY	|  City of residence of the customer. | 
| STATE	| State of residence of the customer. | 
| POSTALCODE	| Postal code of every customer. | 
| COUNTRY	|  Country of residence of the customer. | 
| TERRITORY	| Region of the customer. |
| CONTACTLASTNAME	|  Customer last name. | 
| CONTACTFIRSTNAME	|  Customer first name. | 
| DEALSIZE | Deal size. |

## Sheet Navigation
- Before sheet - raw dataset extracted from Kaggle
- Changes sheet - demonstrates the data cleaning process.
- After sheet - refined data ready for analysis, including pivot tables and dashboard creation.
- Pivot Tables - contains pivot tables derived from the 'After' data.
- Dashboard - interactive dashboard.
- XLookup - customer lookup information.

## Dashboard Navigation
- Use the filters on the top to select the deal size, customer name, country, product line, and/or specific time periods.

![image](https://github.com/Jessymac96/Data-analyst-projects-by-Jessy-MacIsaac/assets/139941688/e3ea8b4d-0f20-4327-864a-870259007f94)


## Interpretation
- The line chart displays monthly and yearly sales trends.
- Pie charts show total sales by deal size and quantity.
- Bar charts that show the top customers and top countries.
- Statistics show the sum of sales and number of quantities.

## Summary of Findings
### Dashboard Overview
#### Monthly Sales Trend
- This line chart shows consistent sales growth throughout the year, with a significant increase in sales every **fall** followed by a subsequent drop.

#### Top Countries
- The US leads the sales market with **over 3.5 million**, followed by Spain and France in 2nd and 3rd place, each close to the **1.25 million** mark. Australia surpasses **500k**, while other countries like the UK, Italy, Finland, Norway, Singapore, and Denmark hover just under the **500k** mark.

#### Top Customers
- The Euro Shopping Channel leads the sales market with **over 900k**, followed by Mini Gifts Distributors Ltd. with **over 650k**. Other companies, such as Austrian Collectors, Muscle Machine Inc, La Rochelle Gifts, Dragon Souveniers, Land of Toys, Sharp Gifts, AV Stores, and Anna's Decorations, fall just under the **200k** mark.

#### Total Sales by Deal Size
- Most customers prefer to buy medium sizes at **nearly 6.1 million**, followed by small sizes at **over 2.6 million**, and large sizes at **over 1.3 million**. 

#### Total Quantity by Year
- In 2005, the total quantity was **46,824 units**, compared to **34,612 units** in 2004 and **17,631** units in 2003.
<br>


### Year-over-Year Comparison: First 5 Months of 2004 vs. First Five Months of 2005

#### Top Countries
  - US: **39% increase**.
    - *Possible Reason*: Large deal sizes have **tripled**.
  
  - Spain: **87% increase**.
    - *Possible Reason*: Growing interest in **different** vehicle types.

  - Finland: **Staggering 260% increase**.
    - *Possible Reason*: Similar to Spain, an emerging trend in **different** vehicle types.
  
  - Australia: **Staggering 292% increase**.
    - *Possible Reason*: went from **1** customer to **4** customers.

#### Deal Sizes
- Large Sizes: **51% increase**.
    - *Possible Reason*: Consumers shifted from buying vintage cars in only **March and April of 2004** to purchasing them consistently in the **first four months of 2005**.

- Medium Sizes: **34% increase**.
    - *Possible Reason*: Consumers shifted from buying in other **different** vehicle types.

- Small Sizes: **8% increase**.
    - *Possible Reason*: Growing interest from other countries like **Australia, Finland, and France**.

#### Top Customers
- Euro Shopping Channel: **Staggering 242% increase**
    - *Possible Reason:* 
    - Consumers growing interest in **different** vehicle types.
    - Large Size Deals: **Over 900%** growth.
    - Small Size Deals: **Nearly 300%** growth.
    - Medium Size Deals: **Nearly 200%** growth.

- Mini Gifts Distributors: **Staggering 436% increase**
    - *Possible Reason:* 
    - Consumers growing interest in **different** vehicle types.
    - Large Size Deals: **0** to **24,160$**.
    - Small Size Deals: **Over 530% growth**.
    - Medium Size Deals:  **Nearly 350% growth**.

#### Sales and Quantity
- For both sales and quantity: **36% increase**

## Acknowledgments
I would like to extend my gratitude to **Phobia42** and **Shimmer97** who are members of SeattleDataGuy's Data Server for their guidance and support in building the README file.

## Contact
https://www.linkedin.com/in/jessy-macisaac/

<p align="right">(<a href="#readme-top">back to top</a>)</p>
