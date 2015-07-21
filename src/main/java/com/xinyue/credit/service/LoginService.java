package com.xinyue.credit.service;

import com.xinyue.credit.model.User;

public interface LoginService {

	public User checkUser(User user);

	public boolean saveUser(User user);

	public int checkPsw(String telPhone, String password);

	public boolean updatePsw(User pswInfo);
}
