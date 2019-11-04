package kimyongtae.ums.user.service;

import java.util.List;

import kimyongtae.ums.user.domain.User;

public interface UserService {
	List<User> listUsers();
	User findUser(int userNo);
	boolean join(String userName);
	boolean correctUser(User user);
	boolean secede(int userNo);
}
