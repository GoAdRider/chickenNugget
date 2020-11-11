package com.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisCommonFactory {
	//선언부
	//xml 문서로부터 객체를 주입받아야 하니까 절대로 단독으로 인스턴스화 하면 안됨.
	public SqlSessionFactory 		sqlSessionFactory = null;
	//오라클 서버에 요청할 때(DML) : S/I/U/D
	//SqlSessionFactory 와 의존관계 있다.
	public SqlSession						sqlSession				=null;
	
	//생성자
	//초기화
	public void init() {
		try {
			//MapperConfig.xml 문서에서 오라클 서버에 대한 정보를 스캔
			//SqlSessionFactory 가 인스턴스화 되어야 SqlSession 을 인스턴스화 할 수 있다고
			//할 때 이 둘은 의존관계("스프링 핵심 키워드 중 하나") 있다 말할 수 있다.
			String resource = "com/util/Configuration.xml";
			Reader reader;
				reader = Resources.getResourceAsReader(resource);
				// 리더를 박고 어디서 읽을건지?? -> (리더기, environment id = " 이곳 ")
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader,"development2");
				sqlSession = sqlSessionFactory.openSession();
				System.out.println("SqlSessionFactory(SqlSessionFactoryBean)"+sqlSessionFactory);
		}catch(FileNotFoundException fe) {
			System.out.println("Exception : "+fe.getMessage());
		}catch (IOException ie) {
			System.out.println("Exception : "+ie.getMessage());
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
	}
	//싱글톤 패턴으로 개발을 전개해야 할 때는 메소드로 객체 주입 받도록 한다.
	//한번 생성한 후 서버가 유지되는 동안에는 계속 사용할 수 있도록 함.
	//scope : application scope를 갖도록 한다.
	public SqlSessionFactory getSqlSessionFactory() {
		init();
		return sqlSessionFactory;
	}
	public static void main(String[] args) {
		
	}
}
