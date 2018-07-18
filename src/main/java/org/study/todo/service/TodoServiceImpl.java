package org.study.todo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.study.todo.model.Category;
import org.study.todo.model.Todo;
import org.study.todo.persistance.TodoDAO;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDAO dao;
	
	@Override
	public void add(Todo todo) throws Exception {
		dao.create(todo);
	}

	@Override
	public Todo read(int idx) throws Exception {
		return dao.read(idx);
	}

	@Override
	public void modify(Todo todo) throws Exception {
		dao.update(todo);
	}

	@Override
	public void remove(int idx) throws Exception {
		dao.delete(idx);
	}

	@Override
	public List<Todo> listCriteria(Map<String, String> params) throws Exception {
		return dao.listCriteria(params);
	}

	@Override
	public List<Todo> listByCate(Map<String, String> params) throws Exception {
		return dao.listByCate(params);
	}

	@Override
	public int getTotalTodoNum(String user_id) throws Exception {
		return dao.getTotalTodoNum(user_id);
	}

	@Override
	public int getTotalByCategory(Map<String, String> params) throws Exception {
		return dao.getTotalByCategory(params);
	}
	
	@Override
	public List<Category> getCate() throws Exception {
		return dao.getCate();
	}



}
