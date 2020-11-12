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
	//xml문서로부터 객체를 주입받아야하니까 절대로 단독으로 인스턴스화(sqlMapper=new Sql-Factory) 하면 안됨.
	public SqlSessionFactory sqlSessionFactory = null;
	//오라클 서버에 요청할때(DML)
	//SqlSessionFactory와 의존관계에 있다.
	public SqlSession session = null;
	//생성자
	public SqlSessionFactory getsqlSessionFactory() {
		init(); //객체생성이 일어남.
		return sqlSessionFactory; //null
	}
	//초기화
	public void init() {
		try {
//			String resource = "oracle/mybatis/MapperConfig.xml"; 
			String resource = "com/util/Configuration.xml"; 
//Mapperconfig.xml문서에서 오라클 서버에 대한 정보를 스캔해와야함 
			Reader reader = Resources.getResourceAsReader(resource);
//물리적으로 떨어져있는 오라클과 연결통로 만들기 - java의 connection --여기 필요한 클래스는??? SqlSessionFactory
//SqlSessionFactory와 SqlSession중 어느 클래스를 먼저 인스턴스화 해야할까요? -전자
// SqlSessionFactory가 인스턴스화 되어야 SqlSession을 인스턴스화 할 수 있다고 할 때 이 둘은 의존관계(스프링의 핵심키워드)에 있다 말할 수 있다.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development3");
			session = sqlSessionFactory.openSession();
			System.out.println("SqlSessionFactory(Spring에선 SqlSessionFactoryBean" + sqlSessionFactory);
			//----------------------------------------------------todo-----------------
		} catch (FileNotFoundException fe) {
			fe.printStackTrace();
			System.out.println("Filenotfound: " + fe.getMessage());
		} catch (IOException ie) {
			ie.printStackTrace();
		} catch (Exception ce) {
			System.out.println("Exception: " + ce.getMessage());
			ce.printStackTrace();
		} 
	}
	//싱글톤 패턴으로 개발을 전개해야 할 때는 메소드로 객체 주입 받도록 한다.
	public SqlSessionFactory getSqlSessionFactory() {
		init();
		return sqlSessionFactory; //null인상태... init()을 경유해야 객체생성
	}
	
}
