-- using 1472396759 as a seed to the RNG

CREATE VIEW revenue0 
(supplier_no, total_revenue) 
AS 
  SELECT l_suppkey, 
         SUM(l_extendedprice * ( 1 - l_discount )) 
  FROM   lineitem 
  WHERE  l_shipdate >= DATE '1997-05-01' 
         AND l_shipdate < DATE '1997-05-01' + interval '3' month 
  GROUP  BY l_suppkey; 

SELECT s_suppkey, 
       s_name, 
       s_address, 
       s_phone, 
       total_revenue 
FROM   supplier, 
       revenue0 
WHERE  s_suppkey = supplier_no 
       AND total_revenue = (SELECT Max(total_revenue) 
                            FROM   revenue0) 