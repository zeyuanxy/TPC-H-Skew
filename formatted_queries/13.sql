-- using 1472396759 as a seed to the RNG


SELECT c_custkey, 
       Count(o_orderkey) 
FROM   customer, orders 
WHERE c_custkey = o_custkey 
                       AND (o_comment NOT LIKE '%pending%packages%');
