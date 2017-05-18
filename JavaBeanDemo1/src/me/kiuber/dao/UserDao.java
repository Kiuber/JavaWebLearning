package me.kiuber.dao;

import me.kiuber.Users;

public class UserDao {

	public boolean login(Users users) {
		if (users.getUsername().equals("admin1")
				&& users.getPassword().equals("admin1")) {
			return true;

		} else {
			return false;
		}
	}

}
