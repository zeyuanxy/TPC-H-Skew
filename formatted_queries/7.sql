-- using 1472396759 as a seed to the RNG


SELECT n1.n_name                            AS supp_nation, 
       n2.n_name                            AS cust_nation, 
       Extract(year FROM l_shipdate)        AS l_year, 
       l_extendedprice * ( 1 - l_discount ) AS volume 
FROM   supplier, 
       lineitem, 
       orders, 
       customer, 
       nation n1, 
       nation n2 
WHERE  s_suppkey = l_suppkey 
       AND o_orderkey = l_orderkey 
       AND c_custkey = o_custkey 
       AND s_nationkey = n1.n_nationkey 
       AND c_nationkey = n2.n_nationkey 
       AND ( ( n1.n_name = 'RUSSIA' 
               AND n2.n_name = 'INDIA' ) 
              OR ( n1.n_name = 'INDIA' 
                   AND n2.n_name = 'RUSSIA' ) ) 
       AND (l_shipdate BETWEEN DATE '1995-01-01' AND DATE '1996-12-31');
