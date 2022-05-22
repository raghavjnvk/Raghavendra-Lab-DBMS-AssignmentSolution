
/* 3.Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */
select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from
(select od.*, cs.cus_gender, cs.cus_name from `order`od, customer cs 
where od.cus_id=cs.cus_id
having od.ord_amount>=3000) as t2
 group by t2.cus_gender;


/* 4.Display all the orders along with product name ordered by a customer having Customer_Id=2 */
select pd.pro_name, od.* from `order` od, supplier_pricing sp, product pd
where od.cus_id=2 and
od.pricing_id=sp.pricing_id and sp.pro_id=pd.pro_id;

/* 5.Display the Supplier details who can supply more than one product. */

SELECT sp.* from supplier sp where sp.supp_id in
(SELECT sc.supp_id from supplier_pricing sc,product pd
 GROUP BY sc.supp_id 
 HAVING count(sc.pro_id)>1) 


/*6.Find the least expensive product from each category and print the 
table with category id, name, product name and price of the product */

SELECT cg.cat_id "categoryid",cg.cat_name "name",min(supp_price) price  
FROM category cg, product pd,supplier_pricing sp
WHERE cg.cat_id= pd.cat_id
AND pd.pro_id=sp.pro_id
GROUP BY categoryid,name;

/*7.Display the Id and Name of the Product ordered after “2021-10-05”.*/

SELECT product.pro_id,product.pro_name FROM `order` inner join supplier_pricing
 ON supplier_pricing.pricing_id=`order`.pricing_id inner join product
ON product.pro_id=supplier_pricing.pro_id WHERE `order`.ord_date>"2021-10-05";

/*8.Display customer name and gender whose names start or end with character 'A'.*/
SELECT customer.cus_name,customer.cus_gender 
FROM customer 
WHERE customer.cus_name LIKE 'A%' or customer.cus_name LIKE '%A';
