package com.harmony.ensemble.model.dao;

import static com.harmony.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.harmony.ensemble.model.dto.Genre;


public class EnsembleDao {
private Properties sql=new Properties();
	
	{
		String path=EnsembleDao.class
				.getResource("/sql/ensemble/ensemble_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Genre> searchAllGenre(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Genre> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAllGenre"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getGenre(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	private Genre getGenre(ResultSet rs) throws SQLException{
		return Genre.builder()
				.genreCode(rs.getString("genre_Code"))
				.genreName(rs.getString("genre_Name"))
				.build();
	}

}
