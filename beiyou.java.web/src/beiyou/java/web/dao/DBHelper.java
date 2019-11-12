package beiyou.java.web.dao;
import java.util.List;

import beiyou.java.web.vo.Game;
import beiyou.java.web.vo.GameShop;
import beiyou.java.web.vo.User;
public class DBHelper {


	public User findUserByName(String uname){
		String sql = "select * from user where uname='" + uname + "'";
		List<User> users = DBUtils.findUser(sql);
		return users.size()==0?null:users.get(0);
	}
	
	// 全查book表
	public List<Game> findAllGame(){
		String sql = "select * from game";
		return DBUtils.findGame(sql);
	}
	
	// 通过bid查book
	public Game findGameById(int sid) {
		String sql = "select * from game where sid=" + sid;
		List<Game> games = DBUtils.findGame(sql);
		return games.size()==0?null:games.get(0);
	}
	public boolean isExistShop(int uid,int sid) {
		String sql = "select * from shopcart where uid=" + uid + " and bid=" + sid;
		return DBUtils.findShop(sql);
	}
	public int updateShop(int uid,int sid,int num) {
		String sql = "update shop set num=num+" + num + " where uid=" + uid + " and sid=" + sid;
		return DBUtils.updateTable(sql);
	}
	public int insertShop(int uid,int sid,int num) {
		String sql = "insert into shop values(" + uid + "," + sid + "," + num + ")";
		return DBUtils.updateTable(sql);
	}
	public List<GameShop> findGameShop(int uid){
		String sql = "select s.*,s.num from game s,shop s where s.sid=s.sid and s.uid=" + uid;
		return DBUtils.findGameShop(sql);
	}
	public int insertGame(Game game) {
		String sql = "insert into game(sname,maker,`type`,details,`count`,src,`desc`,price) values('"+game.getSname()+"','"+game.getMaker()+"','"+game.getType()+"','"+game.getDetails()+"',"+game.getCount()+",'"+game.getSrc()+"','"+game.getDesc()+"',"+game.getPrice()+")";
		return DBUtils.updateTable(sql);
	}
	public int deleteGame(int sid) {
		String sql = "delete from game where sid=" + sid;
		return DBUtils.updateTable(sql);
	}
	public static void main(String[] args) {
		DBHelper helper = new DBHelper();
		helper.updateShop(2, 2, 5);
	}
}










