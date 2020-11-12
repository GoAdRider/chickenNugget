package web.mvc;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;

public class BoardDao {
	Logger logger = Logger.getLogger(BoardDao.class);
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();
	String resource = "com/util/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	int result = 0;
	
	public List<Map<String,Object>> getBoardList(Map<String,Object> pMap){
		List<Map<String,Object>> boardList = null;
		SqlSession session = null;
		try {
		Reader reader = Resources.getResourceAsReader(resource);
		sqlMapper = new SqlSessionFactoryBuilder().build(reader, "development3");
		logger.info("sqlMapper "+sqlMapper);
		session = sqlMapper.openSession(true);
		boardList = session.selectList("getBoardList", pMap);
			logger.info("boardList : " + boardList);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		finally {
			session.close();
		}
		if(boardList==null) {
			boardList = new ArrayList<>();
		}
		return boardList;
	}
	//---------------------------------------------------------------------------INSERT
	public int insertBoard(Map<String,Object> pMap){
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader, "development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();
			result = session.insert("insertBoard", pMap);
			logger.info("result===>" + result);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			session.close();
		}
		return result;
	}
	//---------------------------------------------------------------------------UPDATE
	public int updateBoardList(Map<String,Object> pMap){
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader, "development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();
			result = session.update("updateBoardList", pMap);
			logger.info("result===>" + result);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			session.close();
		}
		return result;
	}
	public int updatePview(int b_num){
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader, "development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();
			result = session.update("updatePview", b_num);
			logger.info("result===>" + result);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			session.close();
		}
		return result;
	}
	//---------------------------------------------------------------------------DELETE
	public int deleteBoard(int b_num){
		SqlSession session = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader, "development3");
			logger.info("sqlMapper "+sqlMapper);
			session = sqlMapper.openSession();
			result = session.delete("deleteBoard", b_num);
			logger.info("result===>" + result);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			session.close();
		}
		return result;
	}
	
	//단위테스트용
	public static void main(String[] args) {
		BoardDao bDao = new BoardDao();
		/********** getBoardList 테스트
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("ubNum","B_NUM");
		pmap.put("keyword","1");
		System.out.println(bDao.getBoardList(pmap));
		***********/
		// 페이지뷰+1 테스트
		    //System.out.println(bDao.updatePview(50));
		/******************** insert 테스트
		Map<String,Object> pMap = new HashMap<>();
			pMap.put("b_class", "유머");
			pMap.put("b_contents", "insert 테스트중~~");
			pMap.put("b_title", "insert test");
			pMap.put("b_author", "testing");
		 bDao.insertBoard(pMap);
		 *********************/
		//--------------------------------------delete테스트
		//bDao.deleteBoard(61);
		
		/*============================update테스트
  		int b_num 	= 64;
  		String b_class 	= "수정";
  		String b_contents 	= "수정내용";
  		String b_title 	= "수정한제목";
     
    	 Map<String,Object> pMap = new HashMap<>();
  			pMap.put("b_num", b_num);
			pMap.put("b_class", b_class);
			pMap.put("b_contents", b_contents);
			pMap.put("b_title", b_title);
  		bDao.updateBoardList(pMap);
		*/
	}
}
