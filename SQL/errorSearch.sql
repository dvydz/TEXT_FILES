select date, info.err_roe_id, erd.firm_roe_id, info.err_list as err_cd, info.err_type,  info.rprd_smry,
info.cat_rprtr_id, info.cat_rprtr_imid, info.cat_sbmtr_id,  erd.sym, erd.event_ts,  erd.seq_nb,  erd.qty,  erd.sndr_imid,
erd.odr_id, erd.odr_key_dt, erd.trd_id , erd.trd_key_dt , erd.flmnt_id , erd.prior_fill_key_dt , erd.quote_id , erd.quote_key_dt ,
erd.optn_id , erd.msg_type , erd.rcvr_imid , erd.dstnt_type , erd.rtd_odr_id , erd.sssn , erd.tape_trd_id , erd.prnt_odr_id ,
erd.prnt_odr_key_dt , erd.prior_odr_id , erd.prior_odr_key_dt , erd.prior_flmnt_id , erd.prior_fill_key_dt , erd.prior_quote_id ,
erd.prior_quote_key_dt, info.rpr_ts , info.rpr_user_id , info.rpr_type_cd , info.crctn_due_ts, info.file_nm from (
	SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid,
	eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, eri.rpr_ts rpr_ts, eri.rpr_user_id rpr_user_id,
	eri.rpr_type_cd rpr_type_cd, eri.crctn_due_ts crctn_due_ts, eri.file_nm file_nm, case when eri.rprd_st = 'R' then 'R'
	when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, eri.err_type err_type,
	eri.err_list err_list FROM catco_owner.err_rec_info eri LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st 
	from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id )
	WHERE  (eri.cat_rprtr_id=44 OR eri.cat_sbmtr_id=44)) info JOIN  catco_owner.err_rec_dtl erd ON ( info.err_roe_id = erd.err_roe_id)
LEFT JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd::text = info.err_list)  LIMIT 20 OFFSET 0


select date, info.err_roe_id, firm_roe_id, info.err_list as err_cd, info.err_type, L2.err_ds as err_rsn, info.rprd_smry,
info.cat_rprtr_id, info.cat_rprtr_imid, info.cat_sbmtr_id,  erd.sym, erd.event_ts,  erd.seq_nb,  erd.qty,  erd.sndr_imid,
erd.odr_id, erd.odr_key_dt, erd.trd_id , erd.trd_key_dt , erd.flmnt_id , erd.prior_fill_key_dt , erd.quote_id , erd.quote_key_dt ,
erd.optn_id , erd.msg_type , erd.rcvr_imid , erd.dstnt_type , erd.rtd_odr_id , erd.sssn , erd.tape_trd_id , erd.prnt_odr_id ,
erd.prnt_odr_key_dt , erd.prior_odr_id , erd.prior_odr_key_dt , erd.prior_flmnt_id , erd.prior_fill_key_dt , erd.prior_quote_id ,
erd.prior_quote_key_dt, info.rpr_ts , info.rpr_user_id , info.rpr_type_cd , info.crctn_due_ts, info.file_nm from [
	
]
info JOIN  catco_owner.err_rec_dtl erd ON ( info.err_roe_id = erd.err_roe_id)
LEFT JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd::text = info.err_list)  LIMIT 20 OFFSET 1


select info.cat_rprtr_imid from (SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid, eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, eri.rpr_ts rpr_ts, eri.rpr_user_id rpr_user_id, eri.rpr_type_cd rpr_type_cd, eri.crctn_due_ts crctn_due_ts, eri.file_nm file_nm, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, eri.err_type err_type, eri.err_list err_list FROM catco_owner.err_rec_info eri LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id ) WHERE  (eri.cat_rprtr_id=44 OR eri.cat_sbmtr_id=44))
info JOIN  catco_owner.err_rec_dtl erd ON ( info.err_roe_id = erd.err_roe_id)



SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid, eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, eri.rpr_ts rpr_ts, eri.rpr_user_id rpr_user_id, eri.rpr_type_cd rpr_type_cd, eri.crctn_due_ts crctn_due_ts, eri.file_nm file_nm, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, eri.err_type err_type, eri.err_list err_list FROM catco_owner.err_rec_info eri LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id ) WHERE  (eri.cat_rprtr_id=44 OR eri.cat_sbmtr_id=44)