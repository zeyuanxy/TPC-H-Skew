-- using 1472396759 as a seed to the RNG


SELECT l_orderkey, 
       SUM(l_extendedprice * ( 1 - l_discount )) AS revenue, 
       o_orderdate, 
       o_shippriority 
FROM   customer, 
       orders, 
       lineitem 
WHERE  c_mktsegment = 'HOUSEHOLD' 
       AND c_custkey = o_custkey 
       AND l_orderkey = o_orderkey 
       AND (o_orderdate < DATE '1995-03-21') 
       AND (l_shipdate > DATE '1995-03-21'); 
