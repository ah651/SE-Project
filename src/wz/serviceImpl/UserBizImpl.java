package wz.serviceImpl;

import java.util.List;

import wz.dao.UserDao;
import wz.model.User;
import wz.service.UserBiz;

/**
 * @author 张建浩、卜凡、卢静、余莎、姚文娜
 * @version 1.0 2016年3月16日下午2:44:35
 */
public class UserBizImpl implements UserBiz{
	private UserDao userDao;

	
	/**
	 * 框架自动注入userDao
	 * @param userDao the userDao to set
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	/* (non-Javadoc)
	 * @see wz.biz.UserBiz#regist(wz.model.User)
	 */
	@Override
	public int regist(User user) {
		userDao.regist(user);
		return 0;
	}


	/* (non-Javadoc)
	 * @see wz.biz.UserBiz#login(wz.model.User)
	 */
	@Override
	public int login(String username,String password) {
		List<User> users = userDao.login(username);
		if (users != null && users.size() > 0){
			if (users.get(0).getPassword().equals(password))
				return users.get(0).getId();
			return -1;
		}else 
			return 0;
	}


	/* (non-Javadoc)
	 * @see wz.biz.UserBiz#isExist(wz.model.User)
	 */
	@Override
	public int isExist(User user) {
		return userDao.isExist(user);
	}


	
	


	/* (non-Javadoc)
	 * @see wz.biz.UserBiz#activeUser(java.lang.String)
	 */
	@Override
	public int activeUser(String code) {
		return userDao.activeUser(code);
	}


	/* (non-Javadoc)
	 * @see wz.biz.UserBiz#updateCode(java.lang.String, java.lang.String)
	 */
	@Override
	public void updateCode(String username, String code) {
		// TODO Auto-generated method stub
		userDao.updateCode(username,code);
		
	}
	
	public void update(User user){
		userDao.update(user);
	}


	@Override
	public int getUserIdByUsername(String username) {
		return userDao.getUserIdByUsername(username);
	}


	@Override
	public User getUserById(Integer integer) {
		return userDao.getUserById(integer);
	}


	@Override
	public int getUserIdByEmail(String email) {
		return userDao.getUserByEmail(email);
	}


	@Override
	public List<User> getUserLike(String like) {
		return userDao.getUserLike(like);
	}

	
	

}
