-- using 1472396759 as a seed to the RNG


SELECT p_brand, 
       p_type, 
       p_size, 
       Count(DISTINCT ps_suppkey) AS supplier_cnt 
FROM   partsupp, 
       part 
WHERE  p_partkey = ps_partkey 
       AND (p_brand <> 'Brand#53' 
       AND p_type NOT LIKE 'LARGE ANODIZED%' 
       AND p_size IN ( 45, 37, 43, 7, 
                       18, 13, 22, 12 ))
       AND (ps_suppkey NOT IN (SELECT s_suppkey 
                              FROM   supplier 
                              WHERE  s_comment LIKE '%Customer%Complaints%'))