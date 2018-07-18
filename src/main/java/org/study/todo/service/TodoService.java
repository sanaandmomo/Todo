package org.study.todo.service;

import java.util.List;
import java.util.Map;

import org.study.todo.model.Category;
import org.study.todo.model.Todo;

public interface TodoService {
	
	public void add(Todo todo) throws Exception;
	
	public Todo read(int idx) throws Exception;
	
	public void modify(Todo todo) throws Exception;
	
	public void remove(int idx) throws Exception;
	
	public List<Todo> listCriteria(Map<String, String> params) throws Exception;
	
	public List<Todo> listByCate(Map<String, String> params) throws Exception;
	
	public int getTotalTodoNum(String user_id) throws Exception;
	
	public int getTotalByCategory(Map<String, String> params) throws Exception;
	
	public List<Category> getCate() throws Exception;
}
