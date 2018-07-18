package org.study.todo;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.study.todo.model.Todo;
import org.study.todo.persistance.TodoDAO;
import org.study.todo.persistance.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class TodoDAOTest {
	
	@Autowired
	private TodoDAO dao;
	@Autowired
	private UserDAO udao;
	private static Logger logger = LoggerFactory.getLogger(TodoDAOTest.class);

	@Test
	public void testCreate() throws Exception {
		Todo todo = new Todo();
		todo.setContent("밥먹기");
		todo.setTarget_date("2018.06.28");
		todo.setCategory(1);
		dao.create(todo);
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(dao.read(13).toString());
		Assert.assertNotNull(dao.read(13));
	}
	
	@Test
	public void testUpdate() throws Exception {
		Todo todo = new Todo();
		todo.setIdx(10);
		todo.setContent("스쿼트10셋");
		todo.setTarget_date("2018-09-01");
		todo.setCategory(3);
		todo.setDone(true);
		dao.update(todo);
	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(10);
	}
	
	@Test
	public void testGetCate() throws Exception {
		logger.info(dao.getCate().toString());
	}
	
	@Test
	public void testIsOverLap() throws Exception {
		Assert.assertTrue(udao.isOverLap("momo"));
	}

}
