package pack2dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




import pack1model.User;


public class UserDAO{
		private String jdbcURL = "jdbc:mysql://localhost:3306/practice2?useSSL=false";
		private String jdbcUsername = "root";
		private String jdbcPassword = "pasindu1234";
		
		private static final String INSERT_USER_SQL = "INSERT INTO users" + " (name,address,email,nic,username,password) VALUES " + " (?, ?, ?, ?, ?, ?);";
		private static final String SELECT_USER_BY_ID = "select userID, name, address, nic, class, username,password from users where userID = ?";
		private static final String SELECT_ALL_USER = "select * from users;";
		private static final String DELETE_USER_SQL = "delete from users where userID = ?;";
		private static final String UPDATE_USER_SQL = "update users set name = ?, address = ?, nic = ?, username=?,password = ? where userID = ?;";
		private static final String VALIDATE_USER_SQL = "select userID,name,address,nic,username,password from users where username = ? and password = ?;";
		
		protected Connection getConnection() {
			Connection connection = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			}catch (SQLException e) {
				e.printStackTrace();
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			return connection;
		}
		
		//insert 
		public boolean insertUser(User user) throws SQLException {
			boolean issucces = false;
			System.out.println(INSERT_USER_SQL);
			try(Connection connection = getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);){
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getAddress());
				preparedStatement.setString(3, user.getEmail());
				preparedStatement.setString(4, user.getNic());
				preparedStatement.setString(5, user.getUserName());
				preparedStatement.setString(6, user.getPassword());
				
				System.out.println(preparedStatement);
				//preparedStatement.executeUpdate();
				
				if(preparedStatement.executeUpdate()==1) {
					issucces = true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return issucces;
		}
		
		
		
		public boolean Validate(String uid, String pass){
			
			boolean res = false;
			
			try{
				Connection connection = getConnection();
				Statement stmt = connection.createStatement();
				
				String sql = "SELECT * FROM users WHERE username ='"+uid+"' and password='"+pass+"'";
				ResultSet rs = stmt.executeQuery(sql);
				
				
				/*
				 * preparedStatement.setString(1, userName); preparedStatement.setString(2,
				 * password);
				 */
				
				/*
				 * System.out.println(preparedStatement); //preparedStatement.executeUpdate();
				 * ResultSet rs = preparedStatement.executeQuery();
				 */
				
				if(rs.next()) {
					int id = rs.getInt("userID");
					System.out.println(id);	
					res = true;
					System.out.println("yakajfhi");
				}else {
					res = false;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
}

