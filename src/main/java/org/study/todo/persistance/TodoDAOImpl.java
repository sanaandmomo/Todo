package org.study.todo.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.study.todo.model.Category;
import org.study.todo.model.Criteria;
import org.study.todo.model.Todo;

@Repository
public class TodoDAOImpl implements TodoDAO {

	@Autowired
	private SqlSession session;
	private static String name = "org.study.spring.mapper.todoMapper";

	@Override
	public void create(Todo todo) throws Exception {
		session.insert(name + ".create", todo);
	}

	@Override
	public Todo read(int idx) throws Exception {
		return session.selectOne(name+".read", idx);
	}

	@Override
	public void update(Todo todo) throws Exception {	
		session.update(name+".update", todo);
	}

	@Override
	public void delete(int idx) throws Exception {
		session.delete(name+".delete",idx);
	}

	@Override
	public List<Todo> listCriteria(Map<String, String> params) throws Exception {
		return session.selectList(name+".listCriteria", params);
	}

	@Override
	public List<Todo> listByCate(Map<String, String> params) throws Exception {
		return session.selectList(name+".listCategory", params);
	}

	@Override
	public int getTotalTodoNum(String user_id) throws Exception {
		return session.selectOne(name+".getTotal", user_id);
	}

	@Override
	public int getTotalByCategory(Map<String, String> params) throws Exception {
		return session.selectOne(name+".getTotalByCategory", params);
	}
	
	@Override
	public List<Category> getCate() throws Exception {
		return session.selectList(name+".getCate");
	}



}
