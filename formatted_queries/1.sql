-- using 1472396759 as a seed to the RNG


SELECT   l_returnflag, 
         l_linestatus, 
         Sum(l_quantity)                                       AS sum_qty, 
         Sum(l_extendedprice)                                  AS sum_base_price, 
         Sum(l_extendedprice * (1 - l_discount))               AS sum_disc_price, 
         Sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge, 
         Avg(l_quantity)                                       AS avg_qty, 
         Avg(l_extendedprice)                                  AS avg_price, 
         Avg(l_discount)                                       AS avg_disc, 
         Count(*)                                              AS count_order 
FROM     lineitem 
WHERE    (l_shipdate <= date '1998-12-01' - interval '117' day);

