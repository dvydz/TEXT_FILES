SELECT * FROM 
( 
SELECT  
D.PROCESS_DATE, 
D.SUBMITTER_ID, 
D.REPORTER_ID, 
D.DERIVED_REPORTER_CRD, 
D.UPLOAD_USER_NAME, 
D.FILENAME,  
M.FILENAME PAIRED_META_FILENAME, 
D.UPLOAD_TIMESTAMP, 
D.UPLOAD_SOURCE, 
D.ACKNOWLEDGE_CREATE_TS, 
D.ACKNOWLEDGE_RESULT, 
D.INTEGRITY_END_TS, 
CASE WHEN D.ACKNOWLEDGE_RESULT = 'Success' 
THEN CASE  
		WHEN D.INTEGRITY_RESULT IS NOT NULL THEN D.INTEGRITY_RESULT 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'Timeout' 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'Duplicate' 
	 END 
ELSE D.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
D.INGESTION_END_TS, 
D.INGESTION_ACCEPTED_RECORDS + D.INGESTION_REJECTED_RECORDS RECEIVED_RECORDS, 
D.INGESTION_ACCEPTED_RECORDS ACCEPTED_RECORDS, 
D.INGESTION_REJECTED_RECORDS REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_DATA D 
LEFT JOIN IM_OWNER.FILE_STATUS_META M ON D.ASSOCIATED_META_FILE_BDATA_ID = M.ASSOCIATED_META_FILE_BDATA_ID 
WHERE D.process_date='2020-02-06' and (D.SUBMITTER_ID = '79') and D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL and d.reporter_id='GEBJ'
UNION 
SELECT  
M.PROCESS_DATE, 
M.SUBMITTER_ID, 
M.REPORTER_ID, 
M.DERIVED_REPORTER_CRD, 
M.UPLOAD_USER_NAME, 
M.FILENAME,  
NULL PAIRED_META_FILENAME, 
M.UPLOAD_TIMESTAMP, 
M.UPLOAD_SOURCE, 
M.ACKNOWLEDGE_CREATE_TS, 
M.ACKNOWLEDGE_RESULT, 
M.INTEGRITY_END_TS, 
CASE WHEN M.ACKNOWLEDGE_RESULT = 'Success' 
THEN CASE  
WHEN M.INTEGRITY_RESULT IS NOT NULL THEN M.INTEGRITY_RESULT 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'Timeout' 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'Duplicate' 
END 
ELSE M.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
NULL INGESTION_END_TS, 
NULL RECEIVED_RECORDS, 
NULL ACCEPTED_RECORDS, 
NULL REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_META M 
WHERE M.process_date='2020-02-06' and (M.SUBMITTER_ID = '79') and M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL  and M.reporter_id='GEBJ') X 
 ORDER BY UPLOAD_TIMESTAMP DESC NULLS FIRST


SELECT * FROM 
( 
SELECT  
D.PROCESS_DATE, 
D.SUBMITTER_ID, 
D.REPORTER_ID, 
D.DERIVED_REPORTER_CRD, 
D.UPLOAD_USER_NAME, 
D.FILENAME,  
M.FILENAME PAIRED_META_FILENAME, 
D.UPLOAD_TIMESTAMP, 
D.UPLOAD_SOURCE, 
D.ACKNOWLEDGE_CREATE_TS, 
D.ACKNOWLEDGE_RESULT, 
D.INTEGRITY_END_TS, 
CASE WHEN D.ACKNOWLEDGE_RESULT = 'Success' 
THEN CASE  
		WHEN D.INTEGRITY_RESULT IS NOT NULL THEN D.INTEGRITY_RESULT 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'Timeout' 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'Duplicate' 
	 END 
ELSE D.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
D.INGESTION_END_TS, 
D.INGESTION_ACCEPTED_RECORDS + D.INGESTION_REJECTED_RECORDS RECEIVED_RECORDS, 
D.INGESTION_ACCEPTED_RECORDS ACCEPTED_RECORDS, 
D.INGESTION_REJECTED_RECORDS REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_DATA D 
LEFT JOIN IM_OWNER.FILE_STATUS_META M ON D.ASSOCIATED_META_FILE_BDATA_ID = M.ASSOCIATED_META_FILE_BDATA_ID 
WHERE D.process_date='2020-02-10' and (D.SUBMITTER_ID = '79')
UNION 
SELECT  
M.PROCESS_DATE, 
M.SUBMITTER_ID, 
M.REPORTER_ID, 
M.DERIVED_REPORTER_CRD, 
M.UPLOAD_USER_NAME, 
M.FILENAME,  
NULL PAIRED_META_FILENAME, 
M.UPLOAD_TIMESTAMP, 
M.UPLOAD_SOURCE, 
M.ACKNOWLEDGE_CREATE_TS, 
M.ACKNOWLEDGE_RESULT, 
M.INTEGRITY_END_TS, 
CASE WHEN M.ACKNOWLEDGE_RESULT = 'Success' 
THEN CASE  
WHEN M.INTEGRITY_RESULT IS NOT NULL THEN M.INTEGRITY_RESULT 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'Timeout' 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'Duplicate' 
END 
ELSE M.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
NULL INGESTION_END_TS, 
NULL RECEIVED_RECORDS, 
NULL ACCEPTED_RECORDS, 
NULL REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_META M 
WHERE M.process_date='2020-02-10' and (M.SUBMITTER_ID = '79')) X 
 ORDER BY UPLOAD_TIMESTAMP DESC NULLS FIRST



SELECT FILENAME, UPLOAD_TIMESTAMP, COUNT(UPLOAD_TIMESTAMP) 
FROM IM_OWNER.FILE_STATUS_DATA 
GROUP BY FILENAME, UPLOAD_TIMESTAMP
HAVING COUNT(UPLOAD_TIMESTAMP)>1;

select * from IM_OWNER.FILE_STATUS_DATA  where upload_timestamp='2019-10-21 18:55:24.726+00'