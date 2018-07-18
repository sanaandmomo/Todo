package org.study.todo.persistance;

import java.util.List;
import java.util.Map;

import org.study.todo.model.Category;
import org.study.todo.model.Todo;

public interface TodoDAO {

	public void create(Todo todo) throws Exception;
	
	public Todo read(int idx) throws Exception;
	
	public void update(Todo todo) throws Exception;
	
	public void delete(int idx) throws Exception;
	
	public List<Todo> listCriteria(Map<String, String> params) throws Exception;
	
	public List<Todo> listByCate(Map<String, String> params) throws Exception;
	
	public int getTotalTodoNum(String user_id) throws Exception;
	
	public int getTotalByCategory(Map<String, String> params) throws Exception;
	
	public List<Category> getCate() throws Exception;
}
