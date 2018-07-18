package org.study.todo.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	@Pattern(regexp="^[A-Za-z0-9]*$")
	@Size(min=6, max=12)
	private String id;
	@Pattern(regexp="^[A-Za-z0-9]*$")
	@Size(min=6, max=12)
	private String password;
	@Size(min=2)
	private String name;
	private int enabled=1;
	private String authority="ROLE_USER";

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", enabled=" + enabled + ", authority="
				+ authority + "]";
	}

}
