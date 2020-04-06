SELECT event_statistics_row_id, file_id, base_filename, cat_prcsg_dt, trd_dt, sbmtr_id, cat_rprtr_imid, cat_rprtr_org_id, acptd_rjctd_ind, third_party_id, actn_type, event_type_cd, prdct_type, ttl_rcrds, late_acptd_rcrds, rprd_rcrds, create_ts, update_ts
	FROM im_owner.event_statistics WHERE 
	cat_prcsg_dt = '2020-02-14'
	AND (sbmtr_id = '79');

SELECT event_statistics_row_id, file_id, base_filename, cat_prcsg_dt, trd_dt, sbmtr_id, cat_rprtr_imid, cat_rprtr_org_id, acptd_rjctd_ind, third_party_id, actn_type, event_type_cd, prdct_type, ttl_rcrds, late_acptd_rcrds, rprd_rcrds, create_ts, update_ts
	FROM im_owner.event_statistics WHERE 
	cat_prcsg_dt = '2020-02-11'
	AND (sbmtr_id = '79' OR cat_rprtr_org_id = '79') and ACPTD_RJCTD_IND in ('C','c') and rprd_rcrds != 0;
	
SELECT sum(RPRD_RCRDS)
	FROM im_owner.event_statistics WHERE 
	cat_prcsg_dt = '2020-02-11'
	AND (sbmtr_id = '79' OR cat_rprtr_org_id = '79')  and ACPTD_RJCTD_IND in ('C');
	
SELECT
	SUM(TTL_RCRDS) "Processed",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'A' THEN TTL_RCRDS ELSE 0 END) "Accepted",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'R' THEN TTL_RCRDS ELSE 0 END) "Rejected",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'R' THEN TTL_RCRDS ELSE 0 END) "Repairable Rejections",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'C' THEN COALESCE(RPRD_RCRDS, 0) ELSE 0 END) AS "Repaired",
	0 AS "Accepted Warning",
	SUM(LATE_ACPTD_RCRDS) "Late",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'A' AND actn_type IN ('COR','RPR','DEL') THEN TTL_RCRDS ELSE 0 END) "Corrections"
FROM
	IM_OWNER.EVENT_STATISTICS
WHERE
	(CAT_RPRTR_ORG_ID = '79' OR SBMTR_ID = '79' OR THIRD_PARTY_ID = '79')
	AND CAT_PRCSG_DT = DATE '2020-02-15'
;

SELECT event_statistics_row_id, file_id, base_filename, cat_prcsg_dt, trd_dt, sbmtr_id, cat_rprtr_imid, cat_rprtr_org_id, acptd_rjctd_ind, third_party_id, actn_type, event_type_cd, prdct_type, ttl_rcrds, late_acptd_rcrds, rprd_rcrds, create_ts, update_ts
	FROM im_owner.event_statistics WHERE
	(CAT_RPRTR_ORG_ID = '79' OR SBMTR_ID = '79' OR THIRD_PARTY_ID = '79')
	AND CAT_PRCSG_DT = DATE '2020-02-15' 


SELECT
	CAT_RPRTR_IMID,
	SBMTR_ID,
	SUM(TTL_RCRDS) "Processed",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'A' THEN TTL_RCRDS ELSE 0 END) "Accepted",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'R' THEN TTL_RCRDS ELSE 0 END) "Rejected",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'R' THEN TTL_RCRDS ELSE 0 END) "Repairable Rejections",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'C' THEN COALESCE(RPRD_RCRDS, 0) ELSE 0 END) AS "Repaired",
	0 AS "Accepted Warning",
	SUM(LATE_ACPTD_RCRDS) "Late",
	SUM(CASE WHEN ACPTD_RJCTD_IND = 'A' AND actn_type IN ('COR','RPR','DEL') THEN TTL_RCRDS ELSE 0 END) "Corrections"
FROM
	IM_OWNER.EVENT_STATISTICS
WHERE
	(CAT_RPRTR_ORG_ID = '79' OR SBMTR_ID = '79' OR THIRD_PARTY_ID = '79')
	AND CAT_PRCSG_DT = DATE '2020-02-15'
GROUP BY
	CAT_RPRTR_IMID,
	SBMTR_ID
;