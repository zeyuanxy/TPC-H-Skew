-- using 1472396759 as a seed to the RNG


SELECT n_name, 
       SUM(l_extendedprice * ( 1 - l_discount )) AS revenue 
FROM   customer, 
       orders, 
       lineitem, 
       supplier, 
       nation, 
       region 
WHERE  c_custkey = o_custkey 
       AND l_orderkey = o_orderkey 
       AND l_suppkey = s_suppkey 
       AND c_nationkey = s_nationkey 
       AND s_nationkey = n_nationkey 
       AND c_nationkey = n_nationkey
       AND n_regionkey = r_regionkey 
       AND r_name = 'AMERICA' 
       AND (o_orderdate >= DATE '1995-01-01'
       AND o_orderdate < DATE '1995-01-01' + interval '1' year); 
