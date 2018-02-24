-- using 1472396759 as a seed to the RNG


SELECT c_custkey, 
       c_name, 
       SUM(l_extendedprice * ( 1 - l_discount )) AS revenue, 
       c_acctbal, 
       n_name, 
       c_address, 
       c_phone, 
       c_comment 
FROM   customer, 
       orders, 
       lineitem, 
       nation 
WHERE  c_custkey = o_custkey 
       AND l_orderkey = o_orderkey 
       AND (o_orderdate >= DATE '1995-01-01'
       AND o_orderdate < DATE '1995-01-01' + interval '3' month)
       AND l_returnflag = 'R' 
       AND c_nationkey = n_nationkey 
