set cmdsep ;
delete from {id Order Details};
delete from {id Orders};
delete from {id Products};
delete from {id Categories};
delete from {id EmployeeTerritories};
delete from {id Territories};
delete from {id Region};

set echo off feedback on break off
COPY FROM FILE 'Categories' TO TABLE '{ID Categories}' CLEAR
COPY FROM FILE 'Suppliers' TO TABLE '{ID Suppliers}' CLEAR
COPY FROM FILE 'Products' TO TABLE '{ID Products}' CLEAR
COPY FROM FILE 'Region' TO TABLE '{ID Region}' CLEAR
COPY FROM FILE 'Territories' TO TABLE '{ID Territories}' CLEAR
set autocommit 1
COPY FROM FILE 'Employees' TO TABLE '{ID Employees}' CLEAR
set autocommit 100
COPY FROM FILE 'EmployeeTerritories' TO TABLE '{ID EmployeeTerritories}' CLEAR
COPY FROM FILE 'Shippers' TO TABLE '{ID Shippers}' CLEAR
COPY FROM FILE 'Customers' TO TABLE '{ID Customers}' CLEAR
COPY FROM FILE 'Orders' TO TABLE '{ID Orders}' CLEAR
COPY FROM FILE 'Order Details' TO TABLE '{ID Order Details}' CLEAR
COPY FROM FILE 'CustomerDemographics' TO TABLE '{ID CustomerDemographics}' CLEAR
COPY FROM FILE 'CustomerCustomerDemo' TO TABLE '{ID CustomerCustomerDemo}' CLEAR
