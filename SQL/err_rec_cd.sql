SELECT err_roe_id, err_cd, err_value, crtd_ts, crtd_by, updtd_ts, updtd_by
	FROM catdd_owner.err_rec_cd order by err_roe_id desc;
	
INSERT INTO catdd_owner.err_rec_cd(
	err_roe_id, err_cd, err_value, crtd_ts, crtd_by, updtd_ts, updtd_by)
	VALUES ('99995', 2001, 'Missing or Invalid accountHolderType', '2019-04-04', 'user1', '2019-04-04', 'user2');

Update catdd_owner.err_rec_cd set err_cd=2015 where err_roe_id=99995
Update catdd_owner.err_rec_cd set err_value='Missing or Invalid capacity' where err_roe_id=99995

