-- using 1472396759 as a seed to the RNG


SELECT ps_partkey, 
       Sum(ps_supplycost * ps_availqty) AS value 
FROM   partsupp, 
       supplier, 
       nation 
WHERE  ps_suppkey = s_suppkey 
       AND s_nationkey = n_nationkey 
       AND n_name = 'SAUDI ARABIA' 
