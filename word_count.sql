/*
it can be work on PostgreSQL.
*/
rollback;
select * from (select count(column_word) as awt ,column_word as clmw2 , column_cimment as clmc2 , as column_name as clmn2 from (select 
past.relname as table_name
,pa.attname as column_name
,regexp_split_to_table(pa.attname , ‘_’ )  as column_word
,pd.description as column_comment
from
pg_stat_all_tables psat
,pg_description pd
.pg_attribute pa
where
past.schemaname = ‘sample1’
and past.relid = pd.objoid
and pd.objoid = pa.attrelid
and pd.objsuid = pa.attnum
and (
	past.relname like ‘m_%’
	or past.relname like ’t_%’
	or past.relname like ’h_%’
)
) as le_tbl
group by clmw2,clmc2,clmn2 
) as le_tbl1
inner join (select max(ri_tbl1.mx ) as mx2 ,ri_tbl1.clm2 as clm3 from 
(select count(column_word) as mx , column_word as clm2 , column_comment as clmc1 , column_name as clmn1 from
(select count(column_word) as awt ,column_word as clmw2 , column_cimment as clmc2 , as column_name as clmn2 from (select 
past.relname as table_name
,pa.attname as column_name
,regexp_split_to_table(pa.attname , ‘_’ )  as column_word
,pd.description as column_comment
from
pg_stat_all_tables psat
,pg_description pd
.pg_attribute pa
where
past.schemaname = ‘sample1’
and past.relid = pd.objoid
and pd.objoid = pa.attrelid
and pd.objsuid = pa.attnum
and (
	past.relname like ‘m_%’
	or past.relname like ’t_%’
	or past.relname like ’h_%’
)
) as ri_tbl 
group by clm2,column_comment,column_name
) as ri_tbl1
group by clm3
)  as ri_tbl2 on le_tbl1.awt = ri_tbl2.mx2 and le_tbl1.clmw2 = ri_tbl2.clm3
order by clmw2
