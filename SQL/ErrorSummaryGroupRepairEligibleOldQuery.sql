SELECT date, abc.cat_rprtr_imid catImid, abc.cat_sbmtr_id catSubmitterId, abc.rprd_smry repairedStatus, abc.grp_rpr_fl groupRepairFlag, abc.err_type errorType, abc.err_cd errorCode, l2.err_ds errorReason, abc.rpr_type_cd repairedType, COUNT(*) errorCount FROM (SELECT eri.prcsg_dt date, eri.err_roe_id err_roe_id, eri.cat_rprtr_org_id cat_rprtr_org_id, eri.cat_rprtr_imid cat_rprtr_imid, eri.cat_sbmtr_id cat_sbmtr_id, eri.prdct_type prdct_type, case when eri.rprd_st = 'R' then 'R' when eri.rprd_st = 'U' and pnd.err_roe_id is null then 'U' else pnd.rprd_st end as rprd_smry, case when eri.rprd_st = 'R' then 'N' WHEN eri.rprd_st = 'U'  AND pnd.err_roe_id IS NULL AND eri.grp_rpr_elgbl = 'Y' THEN 'Y' else 'N'  end  as grp_rpr_fl, eri.err_type err_type, eri.rpr_type_cd rpr_type_cd, trim (unnest(regexp_split_to_array(eri.err_list, ','))) err_cd FROM catco_owner.err_rec_info eri LEFT JOIN (select err_roe_id, max(rprd_st) as rprd_st from catdd_owner.pndng_rec where err_roe_id is not null group by err_roe_id) pnd ON ( eri.err_roe_id = pnd.err_roe_id )  WHERE (eri.cat_rprtr_org_id=? OR eri.cat_sbmtr_id=?) AND eri.prcsg_dt = ? ) ABC JOIN catdd_owner.err_cd_lk L2 ON (L2.err_cd = ABC.err_cd)  WHERE abc.err_cd=? GROUP BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd, L2.err_ds, abc.rpr_type_cd   ORDER BY date, abc.cat_rprtr_imid, abc.cat_sbmtr_id, abc.rprd_smry, abc.grp_rpr_fl, abc.err_type, abc.err_cd LIMIT 21 OFFSET 0]; nested exception is org.postgresql.util.PSQLException: ERROR: operator does not exist: integer = text\n  Hint: No operator matches the given name and argument type(s). You might need to add explicit type casts.\n  Position: 1184",
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
               WHEN eri.rprd_st = 'U' AND L1.err_cd IS NOT NULL AND COALESCE(Q1.cnt1,0) = 1 AND pnd.err_roe_id IS NULL THEN 'Y'
               ELSE 'N'
             END AS grp_rpr_fl,
             eri.err_type err_type,
             eri.rpr_type_cd rpr_type_cd,
             erc.err_cd err_cd
      FROM catco_owner.err_rec_info eri
        JOIN catco_owner.err_rec_cd erc
          ON (eri.err_roe_id = erc.err_roe_id
         AND eri.cat_rprtr_org_id = 79
         AND eri.prcsg_dt = '2019-02-14'::date)
        LEFT JOIN (SELECT eri.err_roe_id roeid,
                          COUNT(1) cnt1
                   FROM catco_owner.err_rec_info eri
                     JOIN catco_owner.err_rec_cd erc
                       ON (eri.err_roe_id = erc.err_roe_id
                      AND eri.cat_rprtr_org_id = 79
                      AND eri.prcsg_dt = '2019-02-14'::date
                      AND eri.rprd_st = 'U')
                   GROUP BY eri.err_roe_id) Q1 ON (Q1.roeid = eri.err_roe_id)
        LEFT JOIN catdd_owner.err_cd_lk L1
               ON (L1.err_cd = erc.err_cd
              AND L1.grp_rpr_elgbl = 'Y')
        LEFT JOIN (SELECT err_roe_id,
                          MAX(rprd_st) AS rprd_st
                   FROM catdd_owner.pndng_rec
                   WHERE err_roe_id IS NOT NULL
                   GROUP BY err_roe_id) pnd ON (eri.err_roe_id = pnd.err_roe_id)) ABC
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