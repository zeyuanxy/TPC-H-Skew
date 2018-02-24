-- using 1472396759 as a seed to the RNG


SELECT o_orderpriority, 
       Count(*) AS order_count 
FROM   orders 
WHERE  (o_orderdate >= DATE '1996-03-01')
       AND (o_orderdate < DATE '1996-03-01' + interval '3' month)
       AND EXISTS (SELECT * 
                   FROM   lineitem 
                   WHERE  l_orderkey = o_orderkey 
                          AND l_commitdate < l_receiptdate); 