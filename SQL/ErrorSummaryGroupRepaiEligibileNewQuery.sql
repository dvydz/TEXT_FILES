SELECT DATE,
       abc.cat_rprtr_imid catImid,
       abc.cat_sbmtr_id catSubmitterId,
       abc.rprd_smry repairedStatus,
       abc.grp_rpr_fl groupRepairFlag,
       abc.err_type errorType,
       abc.err_cd errorCode,
       l2.err_ds errorReason,
       abc.rpr_type_cd repairedType,
       COUNT(*) errorCount
FROM (SELECT eri.prcsg_dt DATE,
             eri.err_roe_id err_roe_id,
             eri.cat_rprtr_org_id cat_rprtr_org_id,
             eri.cat_rprtr_imid cat_rprtr_imid,
             eri.cat_sbmtr_id cat_sbmtr_id,
             eri.prdct_type prdct_type,
             CASE
               WHEN eri.rprd_st = 'R' THEN 'R'
               WHEN eri.rprd_st = 'U' AND pnd.err_roe_id IS NULL THEN 'U'
               ELSE pnd.rprd_st
             END AS rprd_smry,
             CASE
               WHEN eri.rprd_st = 'R' THEN 'N'
               WHEN eri.rprd_st = 'U'  and pnd.err_roe_id IS NULL AND eri.grp_rpr_elgbl = 'Y' THEN 'Y'
               ELSE 'N'
             END AS grp_rpr_fl,
             eri.err_type err_type,
             eri.rpr_type_cd rpr_type_cd,
             trim (unnest(regexp_split_to_array(eri.err_list, ',')))::int err_cd
      FROM catco_owner.err_rec_info eri
        LEFT JOIN (SELECT err_roe_id,
                          MAX(rprd_st) AS rprd_st
                   FROM catdd_owner.pndng_rec
                   WHERE err_roe_id IS NOT NULL
                   GROUP BY err_roe_id) pnd ON (eri.err_roe_id = pnd.err_roe_id)
                             WHERE eri.cat_rprtr_org_id = 79
         AND eri.prcsg_dt = '2019-02-14'::date) ABC
  JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd = ABC.err_cd)
 GROUP BY DATE,
         abc.cat_rprtr_imid,
         abc.cat_sbmtr_id,
         abc.rprd_smry,
         abc.grp_rpr_fl,
         abc.err_type,
         abc.err_cd,
         L2.err_ds,
         abc.rpr_type_cd
ORDER BY DATE,
         abc.cat_rprtr_imid,
         abc.cat_sbmtr_id,
         abc.rprd_smry,
         abc.grp_rpr_fl,
         abc.err_type,
         abc.err_cd