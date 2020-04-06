select 
	sum(valid_files_sbmtd) valid_files_sbmtd,
	sum(data_files_rcvd) data_files_rcvd,
	sum(data_files_rej) data_files_rej,
	sum(data_files_acpt) data_files_acpt,
	sum(meta_files_rcvd) meta_files_rcvd,
	sum(meta_files_rej) meta_files_rej,
	sum(invl_files) invl_files
from (	
select 
	coalesce(d.submitter_id,m.submitter_id) submitter_id,
	coalesce(d.reporter_id,m.reporter_id) reporter_id,
	coalesce(d.data_files_rcvd,0) + coalesce(m.meta_files_rcvd,0) valid_files_sbmtd,
	coalesce(d.data_files_rcvd,0) data_files_rcvd,
	coalesce(d.data_files_rej,0) data_files_rej,
	coalesce(d.data_files_acpt,0) data_files_acpt,
	coalesce(m.meta_files_rcvd,0) meta_files_rcvd,
	coalesce(m.meta_files_rej,0) meta_files_rej,   
	coalesce(d.data_files_invl,0) + coalesce(m.meta_files_invl,0) invl_files
from
(
SELECT 
	submitter_id,
	reporter_id,
	SUM(CASE WHEN acknowledge_result = 'Success' THEN 1 ELSE 0 END) data_files_rcvd,
	SUM(coalesce(full_file_reject,0)) data_files_rej,
	SUM(CASE WHEN acknowledge_result = 'Success' THEN 1 ELSE 0 END) - SUM(coalesce(full_file_reject, 0)) data_files_acpt,
	SUM(CASE WHEN acknowledge_result = 'Failure' THEN 1 ELSE 0 END) data_files_invl
FROM 
	IM_OWNER.file_status_data
WHERE 
	process_date = DATE '2020-02-11'
	AND (submitter_id = '79' OR derived_reporter_crd = '79')
GROUP BY
	submitter_id,
	reporter_id   
) d
full outer join
(
SELECT 
	submitter_id,
	reporter_id,
	SUM(CASE WHEN acknowledge_result = 'Success' THEN 1 ELSE 0 END) meta_files_rcvd,
	SUM(coalesce(full_file_reject,0)) meta_files_rej,
	SUM(CASE WHEN acknowledge_result = 'Failure' THEN 1 ELSE 0 END) meta_files_invl
FROM 
	IM_OWNER.file_status_meta
WHERE 
	process_date = DATE '2020-02-11'
	AND (submitter_id = '79' OR derived_reporter_crd = '79')
GROUP BY
	submitter_id,
	reporter_id  
) m on d.submitter_id = m.submitter_id and d.reporter_id = m.reporter_id
) X;SELECT event_statistics_row_id, file_id, base_filename, cat_prcsg_dt, trd_dt, sbmtr_id, cat_rprtr_imid, cat_rprtr_org_id, acptd_rjctd_ind, third_party_id, actn_type, event_type_cd, prdct_type, ttl_rcrds, late_acptd_rcrds, rprd_rcrds, create_ts, update_ts
	FROM im_owner.event_statistics;
	
	
select count(upl_bus_objct_bdata_id) from im_owner.file_status_data WHERE 
	process_date = '2020-02-11'
	AND (submitter_id = '79' OR derived_reporter_crd = '79')
	
select count(upl_bus_objct_bdata_id) from im_owner.file_status_meta WHERE 
	process_date = '2020-02-11'
	AND (upload_org_id = '79' OR derived_reporter_crd = '79')
	
	
	