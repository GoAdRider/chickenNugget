package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;
import com.vo.ExBoardDTO;


public class ExBoardDAO {
	Logger logger = Logger.getLogger(ExBoardDAO.class);
	
	MyBatisCommonFactory mcf = new MyBatisCommonFactory();
	SqlSessionFactory sqlMapper = null;
	
	// 싱글톤
	private static ExBoardDAO instanceA = new ExBoardDAO();
	private ExBoardDAO() {
		sqlMapper = mcf.getSqlSessionFactory();  
	}
	public static ExBoardDAO getInstance() {
		return instanceA;
	}


	// 리스트 페이지에 보여줄 로직
	public List<Map<String,Object>> getList() {
		List<Map<String,Object>> exboardList = null;
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			exboardList = session.selectList("getExboardList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close(); // DB 연결 종료 / Connection 반환
		}
		if(exboardList==null) {
			exboardList = new ArrayList<>();
		}
		return exboardList; // list 반환
	}
	
	
	public int insertDB(ExBoardDTO board) {
		int result=0;
		SqlSession session = null;
		try {
			// 물음표에 매개변수로 전달된 데이터 매핑
			session = sqlMapper.openSession();
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("name",  board.getName());
			pMap.put("pw",   board.getPasswd());
			pMap.put("subject", board.getSubject());
			pMap.put("content", board.getContent());
			pMap.put("ip",	board.getIp()); 
			result = session.insert("exboardInsert",pMap);		
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	
	// 제목을 클릭하였을 때 조회수 증가
	public void readCount(int no){
		int result = 0;
		SqlSession sqlSession = sqlMapper.openSession();
		try {
			result = sqlSession.update("updateExboard",no);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	// 제목을 클릭하였을 때 특정 항목을 검색할 로직
	public List<Map<String,Object>> getBoard(int no){
		List<Map<String,Object>> ListbyNo = null;
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			ListbyNo = session.selectList("getListbyNo",no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(ListbyNo==null) {
			ListbyNo = new ArrayList<>();
		}
		return ListbyNo;
	}
	
	
	
	
	// update 로직
	public int updateDB(ExBoardDTO board){
		int result = 0;
		SqlSession session = sqlMapper.openSession();
		Map<String,Object> pMap = new HashMap<>();
		try {
			pMap.put("name", board.getName());
			pMap.put("subject", board.getSubject());
			pMap.put("content", board.getContent());
			pMap.put("no", board.getNo());
			result = session.update("updatebyNo",pMap);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	
	
	// 해당 데이터 삭제
	public int deleteDB(int no){
		int result=0;
		SqlSession session = null;
		try {
			session = sqlMapper.openSession();
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("deptno",no);
			result = session.delete("deleteExboard",pMap);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	//단위테스트
	public static void main(String[] args) {
//		ExBoardDAO tes = new ExBoardDAO();
//		ExBoardDTO vo = new ExBoardDTO();
//		//NOT NULL 임
//		vo.setName("이름");
//		vo.setPasswd("1234");
//		vo.setSubject("제목이외다");
//		vo.setIp("ip입니다");
//		vo.setContent("본문입니다.");
//		int a = tes.insertDB(vo);
//		System.out.println(a);
//		System.out.println(tes.getList());
		
		ExBoardDAO manager = ExBoardDAO.getInstance();
		List<Map<String,Object>> list = manager.getList();
		if(list != null){ // 데이터베이스에 데이터가 있으면
//				ExBoardDTO board = list.get(i); // 반환된 list에 담긴 참조값 할당
//				board.getNo();
//				board.getName() ;
				for(int i=0;i<list.size();i++) {
					Map<String,Object> tmap = list.get(i);
					System.out.println(tmap);
					System.out.println(tmap.get("PASSWD"));
//					Object[] keys = tmap.keySet().toArray();
//					for(int j=0;j<keys.length;j++) {
//						String key = keys[j].toString();
//						System.out.println(tmap.get(key));
//					}
				}
				
//				board.getNo();
//				board.getName() ;
			}
		ExBoardDTO board= new ExBoardDTO();
		List<Map<String,Object>> oldBoard = manager.getBoard(board.getNo());
		System.out.println(oldBoard);
		if(board.getPasswd().equals(oldBoard.get(0).get("PASSWD"))) {
			manager.updateDB(board);
		}
		
	}
}