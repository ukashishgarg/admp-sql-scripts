USE LotaDoors

-- Identify the metrics of the problems
select * from tblBranch
select * from tblProduct
select * from tblSales

-- Business Question 01: What was the total value of sales per branch and product in each month of 2002?
create table dimBranch(
