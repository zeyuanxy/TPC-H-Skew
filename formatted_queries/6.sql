-- using 1472396759 as a seed to the RNG


SELECT SUM(l_extendedprice * l_discount) AS revenue 
FROM   lineitem 
WHERE  (l_shipdate >= DATE '1995-01-01'
       AND (l_shipdate < DATE '1995-01-01' + interval '1' year)
       AND (l_discount BETWEEN 0.09 - 0.01 AND 0.09 + 0.01)
       AND l_quantity < 24); 
