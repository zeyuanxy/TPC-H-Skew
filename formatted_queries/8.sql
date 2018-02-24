-- using 1472396759 as a seed to the RNG


SELECT Extract(year FROM o_orderdate)       AS o_year, 
       l_extendedprice * ( 1 - l_discount ) AS volume, 
       n2.n_name                            AS nation 
FROM   part, 
       supplier, 
       lineitem, 
       orders, 
       customer, 
       nation n1, 
       nation n2, 
       region 
WHERE  p_partkey = l_partkey 
       AND s_suppkey = l_suppkey 
       AND l_orderkey = o_orderkey 
       AND o_custkey = c_custkey 
       AND c_nationkey = n1.n_nationkey 
       AND n1.n_regionkey = r_regionkey 
       AND r_name = 'ASIA' 
       AND s_nationkey = n2.n_nationkey 
       AND (o_orderdate BETWEEN DATE '1995-01-01' AND DATE '1996-12-31') 
       AND p_type = 'LARGE BRUSHED NICKEL' 
