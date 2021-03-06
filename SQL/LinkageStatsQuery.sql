--> Full duplicates:
SELECT sum(ttl_rcrds_ct) Sum_Full_Duplicates FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'WARNING' and rec_ct_sub_ctgry = 'REJECTED WARNING';
	
--> Key duplicates:
SELECT sum(ttl_rcrds_ct) Sum_Key_Duplicates FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'ERROR' and rec_ct_sub_ctgry = 'REJECTED';

--> Linkage warnings:
SELECT sum(ttl_rcrds_ct) SUM_LINKAGE_WARNINGS FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'WARNING' AND rec_ct_sub_ctgry IN ('ACCEPTED WARNING', 'LATE WARNING');

--> Unlinked:
SELECT sum(ttl_rcrds_ct) SUM_UNLINKED FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' AND rec_ct_ctgry = 'ERROR' AND rec_ct_sub_ctgry = 'UNLINKED';

--> OOS:
SELECT sum(ttl_rcrds_ct) SUM_OOS FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and  rec_ct_ctgry = 'ERROR' AND rec_ct_sub_ctgry = 'OOS';

Select fullDuplicates.Sum_Full_Duplicates, keyDuplicates.Sum_Key_Duplicates, linkageWarnings.SUM_LINKAGE_WARNINGS, unlinked.SUM_UNLINKED, oos.SUM_OOS
from (SELECT sum(ttl_rcrds_ct) Sum_Full_Duplicates FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'WARNING' and rec_ct_sub_ctgry = 'REJECTED WARNING'
) as fullDuplicates,
(SELECT sum(ttl_rcrds_ct) Sum_Key_Duplicates FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'ERROR' and rec_ct_sub_ctgry = 'REJECTED'
) as keyDuplicates,
(SELECT sum(ttl_rcrds_ct) SUM_LINKAGE_WARNINGS FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and rec_ct_ctgry = 'WARNING' AND rec_ct_sub_ctgry IN ('ACCEPTED WARNING', 'LATE WARNING')
) as linkageWarnings,
(SELECT sum(ttl_rcrds_ct) SUM_UNLINKED FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' AND rec_ct_ctgry = 'ERROR' AND rec_ct_sub_ctgry = 'UNLINKED'
) as unlinked,
(SELECT sum(ttl_rcrds_ct) SUM_OOS FROM im_owner.catlnkr_event_statistics where cat_rprtr_org_id = 79 and cat_prcsg_dt='2020-04-13' and  rec_ct_ctgry = 'ERROR' AND rec_ct_sub_ctgry = 'OOS'
) as oos;


