CREATE TABLE sales (
    InvoiceID NVARCHAR(50),  
    Branch NVARCHAR(10),
    City NVARCHAR(50),
    Customer_type NVARCHAR(20),
    Gender NVARCHAR(10),
    Product_line NVARCHAR(50),
    Unit_price FLOAT,
    Quantity INT,
    Tax FLOAT,
    Total FLOAT,
    Date NVARCHAR(20),       
    Time NVARCHAR(20),
    Payment NVARCHAR(20),
    cogs FLOAT,
    gross_margin_percentage FLOAT,
    gross_income FLOAT,
    Rating FLOAT
);

bulk insert sales
from 'D:\DataAnalysis\projects\supermarket_sales\supermarket_sales.csv'
with (
fieldterminator= ',',
rowterminator= '\n',
firstrow= 2
);

select
  MONTH(Date) as month,
  SUM(Quantity * gross_income) as total_sales
from sales
group by MONTH(Date)
order by month;

