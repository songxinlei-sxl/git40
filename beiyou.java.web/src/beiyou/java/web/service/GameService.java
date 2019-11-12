package beiyou.java.web.service;

import java.util.List;

import beiyou.java.web.dao.DBHelper;
import beiyou.java.web.vo.Game;
import beiyou.java.web.vo.GameShop;
import beiyou.java.web.vo.User;

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
		return helper.findGameById(sid);
	}
	
	public int updateShop(int uid,int sid,int num) {
		int updateRows = 0;

		if(helper.isExistShop(uid, sid)) {
			updateRows = helper.updateShop(uid, sid, num);
		}else {
			updateRows = helper.insertShop(uid, sid, num);
		}
		return updateRows;
	}
	
	public List<GameShop> findGameShop(int uid){
		return helper.findGameShop(uid);
	}
	
	// 添加book表
	public int insertGame(Game game) {
		return helper.insertGame(game);
	}
	
	public int deleteGame(int sid) {
		return helper.deleteGame(sid);
	}
	
	
	public static void main(String[] args) {
		GameService bs = new GameService();
		List<Game> games = bs.findAllGame();
		for(Game game: games) {
			System.out.println(game);
			
		}
		
	}
}



























