package beiyou.java.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beiyou.java.web.vo.Game;
import beiyou.java.web.vo.GameShop;
import beiyou.java.web.vo.User;

public class DBUtils {


	public static Connection getConn() {
		try {
			Class.forName(DBInfo.JDBC_DRIVER);
			Connection conn = DriverManager.getConnection(DBInfo.JDBC_URL, DBInfo.JDBC_NAME, DBInfo.JDBC_PASSWORD);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public static void close(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if(null != rs) {
				rs.close();
			}
			if(null != ps) {
				ps.close();
			}
			if(null != conn && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static List<User> findUser(String sql) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<User> users = new ArrayList<User>();
		Connection conn = DBUtils.getConn();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setIdentity(rs.getInt("identity"));
				user.setAddress(rs.getString("address"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return users;
	}
	

	public static List<Game> findGame(String sql) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<Game> games = new ArrayList<Game>();
		Connection conn = DBUtils.getConn();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {

				Game game = new Game();
				game.setSid(rs.getInt("sid"));
				game.setSname(rs.getString("sname"));
				game.setDetails(rs.getString("details"));
				game.setMaker(rs.getString("maker"));
				game.setCount(rs.getInt("count"));
				game.setType(rs.getString("type"));
				game.setDesc(rs.getString("desc"));
				game.setSrc(rs.getString("src"));
				game.setPrice(rs.getDouble("price"));
				
				games.add(game);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return games;
	}
	

	public static boolean findShop(String sql) {
		boolean isExist = false;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = DBUtils.getConn();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			isExist = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return isExist;
	}
	
	public static List<GameShop> findGameShop(String sql) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<GameShop> gameShops = new ArrayList<GameShop>();
		Connection conn = DBUtils.getConn();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {

				GameShop gameShop = new GameShop();
				gameShop.setSid(rs.getInt("sid"));
				gameShop.setSname(rs.getString("sname"));
				gameShop.setDetails(rs.getString("details"));
				gameShop.setMaker(rs.getString("maker"));
				gameShop.setCount(rs.getInt("count"));
				gameShop.setType(rs.getString("type"));
				gameShop.setDesc(rs.getString("desc"));
				gameShop.setSrc(rs.getString("src"));
				gameShop.setPrice(rs.getDouble("price"));
				gameShop.setNum(rs.getInt("num"));
				
				gameShops.add(gameShop);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,rs);
		}
		return gameShops;
	}
	
	// 增删改
	public static int updateTable(String sql) {
		int updateRows = 0;
		PreparedStatement ps = null;
		Connection conn = DBUtils.getConn();
		try {
			ps = conn.prepareStatement(sql);
			updateRows = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,ps,null);
		}
		return updateRows;
	}
}




















































