package org.study.todo.model;

import java.util.Date;

public class Todo {

	private int idx;
	private String user_id;
	private String content;
	private String target_date;
	private Date create_date;
	private boolean done;
	private int category;
	private String name;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTarget_date() {
		return target_date;
	}
	public void setTarget_date(String target_date) {
		this.target_date = target_date;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public boolean isDone() {
		return done;
	}
	public void setDone(boolean done) {
		this.done = done;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Todo [idx=" + idx + ", user_id=" + user_id + ", content=" + content + ", target_date=" + target_date
				+ ", create_date=" + create_date + ", done=" + done + ", category=" + category + ", name=" + name + "]";
	}




}
