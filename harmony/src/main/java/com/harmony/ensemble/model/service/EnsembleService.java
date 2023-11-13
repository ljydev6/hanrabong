package com.harmony.ensemble.model.service;

import java.sql.Connection;
import java.util.List;

import com.harmony.ensemble.model.dao.EnsembleDao;
import com.harmony.ensemble.model.dto.Genre;

import static com.harmony.common.JDBCTemplate.*;


public class EnsembleService {

	private EnsembleDao dao = new EnsembleDao();
	
	public List<Genre> searchAllGenre(){
		Connection conn=getConnection();
		List<Genre> result=dao.searchAllGenre(conn);
		close(conn);
		return result;
	}
	
}
