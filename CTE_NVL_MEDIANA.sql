with w_arr as (select regexp_substr(trim(str), '[^,]+', 1, level) as val, level as lvl
             from (select replace('1,2,3,4,5,6,7,8,9,10', ' ', '') str from dual) t
    connect by regexp_substr(str,'[^,]+', 1, level) is not null
      order by level
      )
select LISTAGG(val, ',') WITHIN GROUP(order by lvl) as n_val
from w_arr
where w_arr.lvl = (select min(lvl) from w_arr)
or w_arr.lvl = (select max(lvl) from w_arr)
or w_arr.lvl = round((select max(lvl) from w_arr)/2);


with w_arr as (select regexp_substr(trim(str), '[^,]+', 1, level) as val, level as lvl
             from (select replace('1,2,3,4,5', ' ', '') str from dual) t
    connect by regexp_substr(str,'[^,]+', 1, level) is not null
      order by level
      )
select val
from w_arr
where w_arr.lvl = (select min(lvl) from w_arr)
or w_arr.lvl = (select max(lvl) from w_arr)
or w_arr.lvl = round((select max(lvl) from w_arr)/2);
