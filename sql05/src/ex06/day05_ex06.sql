create index idx_1 on pizzeria(rating);

set enable_seqscan = off;

EXPLAIN ANALYSE
    SELECT pizza_name, 
        max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
    FROM menu
    INNER JOIN pizzeria ON pizzeria_id = pizzeria.id
    ORDER BY 1,2;
