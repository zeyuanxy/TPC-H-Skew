-- using 1472396759 as a seed to the RNG


SELECT Substring(c_phone FROM 1 FOR 2) AS cntrycode, 
       c_acctbal 
FROM   customer 
WHERE  Substring(c_phone FROM 1 FOR 2) IN ( '11', '18', '15', '20', 
                                            '12', '29', '30' ) 
       AND c_acctbal > (SELECT Avg(c_acctbal) 
                        FROM   customer 
                        WHERE  c_acctbal > 0.00 
                               AND Substring(c_phone FROM 1 FOR 2) IN ( 
                                   '11', '18', '15', '20', 
                                   '12', '29', '30' )) 
       AND NOT EXISTS (SELECT * 
                       FROM   orders 
                       WHERE  o_custkey = c_custkey) 
