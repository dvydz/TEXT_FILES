SELECT upl_bus_objct_bdata_id, upload_user_name, bucket_name, s3_prefix, base_filename, filename, upload_source, upl_file_size_bytes, process_date, upload_org_id, submitter_id, reporter_id, derived_reporter_crd, upload_timestamp, acknowledge_bdata_id, acknowledge_create_ts, acknowledge_result, integrity_bdata_id, integrity_result, associated_meta_file_bdata_id, associated_meta_file_usage_cd, associated_upl_meta_file_bdata_id, integrity_timeout_warn_usage_cd, integrity_timeout_warn_bdata_id, integrity_timeout_error_usage_cd, integrity_timeout_error_bdata_id, integrity_duplicate_usage_cd, integrity_duplicate_bdata_id, integrity_start_ts, integrity_end_ts, full_file_reject
	FROM im_owner.file_status_meta where submitter_id='79' and process_date='2020-01-07' and reporter_id='BBC';

SELECT upl_bus_objct_bdata_id, upload_user_name, bucket_name, s3_prefix, base_filename, filename, upload_source, upl_file_size_bytes, process_date, upload_org_id, submitter_id, reporter_id, derived_reporter_crd, upload_timestamp, acknowledge_bdata_id, acknowledge_create_ts, acknowledge_result, integrity_bdata_id, integrity_result, associated_meta_file_bdata_id, associated_meta_file_usage_cd, associated_upl_meta_file_bdata_id, integrity_timeout_warn_usage_cd, integrity_timeout_warn_bdata_id, integrity_timeout_error_usage_cd, integrity_timeout_error_bdata_id, integrity_duplicate_usage_cd, integrity_duplicate_bdata_id, integrity_start_ts, integrity_end_ts, full_file_reject
	FROM im_owner.file_status_meta where associated_meta_file_bdata_id in ('4644026','4644229');
	
SELECT upl_bus_objct_bdata_id, upload_user_name, bucket_name, s3_prefix, base_filename, filename, upload_source, upl_file_size_bytes, process_date, upload_org_id, submitter_id, reporter_id, derived_reporter_crd, upload_timestamp, acknowledge_bdata_id, acknowledge_create_ts, acknowledge_result, integrity_bdata_id, integrity_result, associated_meta_file_bdata_id, associated_meta_file_usage_cd, associated_upl_meta_file_bdata_id, integrity_timeout_warn_usage_cd, integrity_timeout_warn_bdata_id, integrity_timeout_error_usage_cd, integrity_timeout_error_bdata_id, integrity_duplicate_usage_cd, integrity_duplicate_bdata_id, integrity_start_ts, integrity_end_ts, full_file_reject
	FROM im_owner.file_status_meta where submitter_id is null;
	
	
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
CASE WHEN D.ACKNOWLEDGE_RESULT = 'SUCCESS' 
THEN CASE  
		WHEN D.INTEGRITY_RESULT IS NOT NULL THEN D.INTEGRITY_RESULT 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'TIMEOUT' 
		WHEN D.INTEGRITY_RESULT IS NULL AND D.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'DUPLICATE' 
	 END 
ELSE D.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
D.INGESTION_END_TS, 
D.INGESTION_ACCEPTED_RECORDS + D.INGESTION_REJECTED_RECORDS RECEIVED_RECORDS, 
D.INGESTION_ACCEPTED_RECORDS ACCEPTED_RECORDS, 
D.INGESTION_REJECTED_RECORDS REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_DATA D
LEFT JOIN IM_OWNER.FILE_STATUS_META M ON D.ASSOCIATED_META_FILE_BDATA_ID = M.ASSOCIATED_META_FILE_BDATA_ID 
WHERE  D.PROCESS_DATE = '2020-01-07' AND D.SUBMITTER_ID = '79' and D.REPORTER_ID = 'GSCO' 
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
CASE WHEN M.ACKNOWLEDGE_RESULT = 'SUCCESS' 
THEN CASE  
WHEN M.INTEGRITY_RESULT IS NOT NULL THEN M.INTEGRITY_RESULT 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NOT NULL THEN 'TIMEOUT' 
WHEN M.INTEGRITY_RESULT IS NULL AND M.INTEGRITY_TIMEOUT_ERROR_USAGE_CD IS NULL THEN 'DUPLICATE' 
END 
ELSE M.INTEGRITY_RESULT END AS INTEGRITY_RESULT, 
NULL INGESTION_END_TS, 
NULL RECEIVED_RECORDS, 
NULL ACCEPTED_RECORDS, 
NULL REJECTED_RECORDS 
FROM IM_OWNER.FILE_STATUS_META M 
WHERE  M.PROCESS_DATE = '2020-01-07' AND M.SUBMITTER_ID = '79' and M.REPORTER_ID = 'GSCO' ) X 
 ORDER BY UPLOAD_TIMESTAMP DESC