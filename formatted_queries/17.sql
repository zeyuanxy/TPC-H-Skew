-- using 1472396759 as a seed to the RNG

SELECT Sum(l_extendedprice) / 7.0 AS avg_yearly 
FROM   lineitem, 
       part, 
       (SELECT l_partkey             AS agg_partkey, 
               0.2 * Avg(l_quantity) AS avg_quantity 
        FROM   lineitem as lineitem2
        GROUP  BY l_partkey) part_agg 
WHERE  p_partkey = l_partkey 
       AND agg_partkey = l_partkey 
       AND p_brand = 'brand#33' 
       AND p_container = 'wrap jar' 
       AND l_quantity < avg_quantity; 

