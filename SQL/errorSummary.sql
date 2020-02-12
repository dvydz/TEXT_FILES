SELECT date, abc.cat_rprtr_imid catImid, abc.cat_sbmtr_id catSubmitterId, abc.prdct_type, abc.rprd_smry repairedStatus, abc.grp_rpr_fl groupRepairFlag, abc.err_type errorType, abc.err_cd errorCode, l2.err_ds errorReason, COUNT(*) errorCount FROM (SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid, eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, case when eri.rprd_st = 'R' then 'N' when eri.rprd_st = 'U' and L1.err_cd is not null and coalesce(Q1.cnt1,0) = 1 and pnd.err_roe_id is null then 'Y' else 'N'  end  as grp_rpr_fl, eri.err_type err_type, erc.err_cd err_cd FROM catdd_owner.err_rec_info eri JOIN catdd_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (eri.cat_rprtr_id=79 OR eri.cat_sbmtr_id=79) AND eri.rprd_st='U' AND eri.prcsg_dt = '2019-01-01'  ) LEFT JOIN (SELECT eri.err_roe_id roeid, count(1) cnt1 FROM catdd_owner.err_rec_info eri JOIN catdd_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (eri.cat_rprtr_id=79 OR eri.cat_sbmtr_id=79) AND eri.prcsg_dt = '2019-01-01'  and eri.rprd_st = 'U') group by eri.err_roe_id) Q1 ON (Q1.roeid = eri.err_roe_id ) LEFT JOIN catdd_owner.err_cd_lk L1 ON (L1.err_cd = erc.err_cd and L1.grp_rpr_elgbl = 'Y') LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id )) ABC JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd = ABC.err_cd) GROUP BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.prdct_type, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd, L2.err_ds ORDER BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.prdct_type, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd LIMIT 21 OFFSET 0


SELECT  count() cnt1 FROM catdd_owner.err_rec_info

SELECT eri.err_roe_id roeid, count(1) cnt1 FROM catdd_owner.err_rec_info eri JOIN catdd_owner.err_rec_cd erc 
ON (eri.err_roe_id = erc.err_roe_id AND(eri.cat_rprtr_id=79 OR eri.cat_sbmtr_id=79) AND
	eri.prcsg_dt = '2019-01-01'  and eri.rprd_st = 'U') group by eri.err_roe_id
	
	
SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid,
eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, 
case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry,
case when eri.rprd_st = 'R' then 'N' when eri.rprd_st = 'U' and L1.err_cd is not null and coalesce(Q1.cnt1,0) = 1 and pnd.err_roe_id is null then 'Y' else 'N'  end  as grp_rpr_fl,
eri.err_type err_type, erc.err_cd err_cd FROM catco_owner.err_rec_info eri 
JOIN catco_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND (eri.cat_rprtr_id=79 OR eri.cat_sbmtr_id=79)
AND eri.prcsg_dt = '2019-12-10' ) 
	LEFT JOIN (SELECT eri.err_roe_id roeid, count(1) cnt1 FROM catco_owner.err_rec_info eri 
		JOIN catco_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND
		(eri.cat_rprtr_id=79 OR eri.cat_sbmtr_id=79) AND eri.prcsg_dt = '2019-01-01'  and eri.rprd_st = 'U')
		group by eri.err_roe_id) Q1 ON (Q1.roeid = eri.err_roe_id ) 
LEFT JOIN catdd_owner.err_cd_lk L1 ON (L1.err_cd = erc.err_cd and L1.grp_rpr_elgbl = 'Y')
LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON
( eri.err_roe_id = pnd.err_roe_id )


SELECT date, abc.cat_rprtr_imid catImid, abc.cat_sbmtr_id catSubmitterId, abc.prdct_type, abc.rprd_smry repairedStatus,
abc.grp_rpr_fl groupRepairFlag, abc.err_type errorType, abc.err_cd errorCode, l2.err_ds errorReason, COUNT(*) errorCount
FROM (SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid,
	  eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U'
	  and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, case when eri.rprd_st = 'R' then 'N' when
	  eri.rprd_st = 'U' and L1.err_cd is not null and coalesce(Q1.cnt1,0) = 1 and pnd.err_roe_id is null then 'Y' else 'N'
	  end  as grp_rpr_fl, eri.err_type err_type, erc.err_cd err_cd FROM catco_owner.err_rec_info eri JOIN
	  catco_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (cat_rprtr_id=22 OR cat_sbmtr_id=22) AND
	eri.prcsg_dt = '2019-12-10'  ) LEFT JOIN (SELECT eri.err_roe_id roeid, count(1) cnt1 FROM catco_owner.err_rec_info eri JOIN
	catco_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (eri.cat_rprtr_id=22 OR eri.cat_sbmtr_id=22)
	AND eri.prcsg_dt = '2019-12-10' and eri.rprd_st = 'U') group by eri.err_roe_id) Q1 ON (Q1.roeid = eri.err_roe_id )
LEFT JOIN catdd_owner.err_cd_lk L1 ON (L1.err_cd = erc.err_cd and L1.grp_rpr_elgbl = 'Y') LEFT JOIN (select err_roe_id,
max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON
( eri.err_roe_id = pnd.err_roe_id )) ABC JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd = ABC.err_cd) where date='2019-12-10'
GROUP BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.prdct_type, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd, L2.err_ds
Having count(*)=2 ORDER BY count(*) desc LIMIT 21 OFFSET 0

 SELECT date, abc.cat_rprtr_imid catImid, abc.cat_sbmtr_id catSubmitterId, abc.prdct_type, abc.rprd_smry repairedStatus, abc.grp_rpr_fl groupRepairFlag, abc.err_type errorType, abc.err_cd errorCode, l2.err_ds errorReason, COUNT(*) errorCount FROM (SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_id cat_rprtr_id, eri.cat_rprtr_imid cat_rprtr_imid, eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, case when eri.rprd_st = 'R' then 'N' when eri.rprd_st = 'U' and L1.err_cd is not null and coalesce(Q1.cnt1,0) = 1 and pnd.err_roe_id is null then 'Y' else 'N'  end  as grp_rpr_fl, eri.err_type err_type, erc.err_cd err_cd FROM catdd_owner.err_rec_info eri JOIN catdd_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (eri.cat_rprtr_id=22 OR eri.cat_sbmtr_id=22) AND eri.prcsg_dt = '2019-01-01'  ) LEFT JOIN (SELECT eri.err_roe_id roeid, count(1) cnt1 FROM catdd_owner.err_rec_info eri JOIN catdd_owner.err_rec_cd erc ON (eri.err_roe_id = erc.err_roe_id AND  (eri.cat_rprtr_id=22 OR eri.cat_sbmtr_id=22) AND eri.prcsg_dt = '2019-01-01'  and eri.rprd_st = 'U') group by eri.err_roe_id) Q1 ON (Q1.roeid = eri.err_roe_id ) LEFT JOIN catdd_owner.err_cd_lk L1 ON (L1.err_cd = erc.err_cd and L1.grp_rpr_elgbl = 'Y') LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id )) ABC JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd = ABC.err_cd)  WHERE date='2019-01-01' GROUP BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.prdct_type, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd, L2.err_ds   ORDER BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.prdct_type, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd LIMIT 21 OFFSET 0

