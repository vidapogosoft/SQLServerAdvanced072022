--indexes (Index usage)
SELECT OBJECT_NAME(ix.object_ID) AS TableName, 
       ix.name AS IndexName, 
       ixs.user_seeks, 
       ixs.user_scans, 
       ixs.user_lookups, 
       ixs.user_updates
FROM sys.dm_db_index_usage_stats ixs
     INNER JOIN sys.indexes ix ON ix.object_id = ixs.object_id
                                  AND ixs.index_id = ixs.index_id
--WHERE OBJECTPROPERTY(ixs.object_id, 'Factura')  = 1
--      AND ixs.database_id = DB_ID();
WHERE  ixs.database_id = DB_ID();


select * from sys.indexes
select * FROM sys.dm_db_index_usage_stats