SELECT err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts
	FROM catco_owner.err_rec_info where cat_rprtr_id=44 order by cat_rprtr_imid;
	
SELECT err_roe_id, cat_rprtr_id, cat_rprtr_imid, count(*) as abc
	FROM catdd_owner.err_rec_info group by err_roe_id, cat_rprtr_id, cat_rprtr_imid  having count(*)=1 ;
	
Update catdd_owner.err_rec_info set err_type='Warning' where err_roe_id=99995

INSERT INTO catdd_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by)
	VALUES ('99995', 79, 'D', 79, 123, 'fileName', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2');

INSERT INTO catco_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts)
	VALUES ('500001', 44, 'A', 44, 123, 'fileName', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2', 'Corrected1', '2019-11-11', 'dummyRepair1', '2019-12-22 11:36:44');
	
INSERT INTO catco_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts)
	VALUES ('500002', 44, 'B', 44, 123, 'fileName2', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2', 'Corrected2', '2019-11-13', 'dummyRepair2', '2019-12-22 11:36:44');
	
INSERT INTO catco_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts)
	VALUES ('500003', 44, 'C', 44, 123, 'fileName3', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2', 'Corrected3', '2019-11-15', 'dummyRepair3', '2019-12-22 11:36:44');
	
INSERT INTO catco_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts)
	VALUES ('500004', 44, 'D', 44, 123, 'fileName4', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2', 'Corrected4', '2019-11-11', 'dummyRepair4', '2019-12-22 11:36:44');

INSERT INTO catco_owner.err_rec_info(
	err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts)
	VALUES ('500005', 44, 'D', 44, 123, 'fileName4', 'fileformat', '2019-01-01', '2019-01-01', 'MENO', 'Options', 'R', 'Rejection', 'aaaa', '20191218_101-MONO-No-Error', 'errList', 'messag', '2019-08-22 11:36:44', 'user1', '2019-08-22 11:36:44', 'user2', 'Corrected4', '2019-11-11', 'dummyRepair4', '2019-12-22 11:36:44');

update catco_owner.err_rec_info set rprd_st='P' where err_roe_id=500003

SELECT err_roe_id, cat_rprtr_id, cat_rprtr_imid, cat_sbmtr_id, sbmtr_3rd_prty, file_nm, file_frmt, prcsg_dt, trd_dt, event_type, prdct_type, rprd_st, err_type, actn_type, firm_roe_id, err_list, msg_type, crtd_ts, crtd_by, updtd_ts, updtd_by, rpr_type_cd, rpr_ts, rpr_user_id, crctn_due_ts
	FROM catco_owner.err_rec_info order by err_roe_id;
	
Delete from catco_owner.err_rec_info where err_roe_id=500003