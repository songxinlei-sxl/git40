package beiyou.shop.service;

import java.util.List;

import beiyou.shop.dao.DBHelper;
import beiyou.shop.vo.Game;
import beiyou.shop.vo.User;

public class GameService {

	DBHelper helper = new DBHelper();
	public User findUserByName(String uname){
		return helper.findUserByName(uname);
	}
	
	public boolean isRightUser(String uname, String password) {
		User user = findUserByName(uname);
		if(null == user || !user.getPassword().equals(password)) {
			System.out.println("用户名或者密码错误");
			return false;
		}
		return true;
	}
	
	public boolean isAdmin(String uname) {
		User user = findUserByName(uname);
		if(null != user && user.getIdentity() == 1) {
			return true;
		}
		return false;
	}
	public List<Game> findAllGame(){
		return helper.findAllGame();
	}
	
	public Game findGameById(int sid) {
		return helper.findBookById(sid);
	}
	
	
	public static void main(String[] args) {
		GameService bs = new GameService();
		List<Game> games = bs.findAllGame();
		for(Game game: games) {
			System.out.println(game);
			
		}
		
	}
}



