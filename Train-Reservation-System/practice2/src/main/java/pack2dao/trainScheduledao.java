package pack2dao;

//import java packages
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pack1model.trainSchedule;

public class trainScheduledao {
	
	//create database connection
	private String jdbcURL = "jdbc:mysql://localhost:3306/practice2?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "pasindu1234";
	
	private static final String INSERT_TRAINSCHEDULE_SQL = "INSERT INTO trainschedule" + " (arrivalTime,depatureTime, trainName, availability) VALUES "
			+ "" + " (?, ?, ?, ?);";
	private static final String SELECT_TRAINSCHEDULE_BY_TRAINID = "select trainId,arrivalTime, depatureTime, trainName,availability from trainschedule where trainId = ?";
	private static final String SELECT_ALL_TRAINSCHEDULE = "select * from trainschedule;";
	private static final String DELETE_TRAINSCHEDULE_SQL = "delete from trainschedule where trainId = ?;";
	private static final String UPDATE_TRAINSCHEDULE_SQL = "update trainschedule set trainName = ?, arrivalTime = ?, depatureTime = ?, availability = ? where trainId = ?;";

	
	protected Connection getConnection() {
		
		Connection connection = null;
		//declare try catch block
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection; //return the connection
	}
	
	//insert trainSchedule
	public boolean inserttrainShedule(trainSchedule trainSchedule) throws SQLException {
		boolean issucces = false;
		System.out.println(INSERT_TRAINSCHEDULE_SQL);
		
	    //declare try catch block
		try(Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TRAINSCHEDULE_SQL);){
			
			preparedStatement.setString(1, trainSchedule.getArrivalTime());
			preparedStatement.setString(2, trainSchedule.getDepatureTime());
			preparedStatement.setString(3, trainSchedule.getTrainName());
			preparedStatement.setString(4, trainSchedule.getAvailability());
			
			System.out.println(preparedStatement);
			//preparedStatement.executeUpdate();
			
			if(preparedStatement.executeUpdate() == 1) {
				issucces = true;
			}
		}catch (Exception e) { //catch the exception
			e.printStackTrace();
		}
		return issucces; //return value
	}
	
	//update trainSchedule
	public boolean updatetrainShedule(trainSchedule trainSchedule) throws SQLException {
		
		boolean rowUpdated=false;
		
		try (Connection connection = getConnection();
			
			PreparedStatement statement = connection.prepareStatement(UPDATE_TRAINSCHEDULE_SQL);){
			
			statement.setString(1, trainSchedule.getTrainName());
			statement.setString(2, trainSchedule.getArrivalTime());
			statement.setString(3, trainSchedule.getDepatureTime());
			statement.setString(4, trainSchedule.getAvailability());
			statement.setInt(5, trainSchedule.getTrainId());
			
			//declare if condition
			if(statement.executeUpdate() > 0) {
				rowUpdated = true;
			}
			
		}
		
		System.out.println(rowUpdated);
		return rowUpdated; //return value
	}
	
	//select trainShedule by id
	public trainSchedule selecttrainSchedule(int trainId) {
		trainSchedule trainSchedule = null;
			
		//declare try catch block
		try {
			Connection connection = getConnection();	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRAINSCHEDULE_BY_TRAINID);		
			preparedStatement.setInt(1, trainId);
			
			System.out.println(preparedStatement);
				
			ResultSet rst = preparedStatement.executeQuery();
				
			while (rst.next()) { //declare while method
				int traiNId = rst.getInt("trainId");
				String trainName = rst.getString("trainName");
				String arrivalTime = rst.getString("arrivalTime");
				String depatureTime = rst.getString("depatureTime");
				String availability = rst.getString("availability");
				
				
				System.out.println(traiNId);
				trainSchedule = new trainSchedule(traiNId, trainName, arrivalTime, depatureTime, availability);
				System.out.println(trainSchedule.getTrainName());
			}
		}catch (SQLException e) { //catch the exception
			e.printStackTrace();
		}
		return trainSchedule; //return value
	}
	
	//select trainSchedule
	public List<trainSchedule> selectAlltrainSchedules() {
		//declare ArrayList
		List<trainSchedule> trainSchedule = new ArrayList<>();
		
		//declare try catch block
		try {
			Connection connection = getConnection();
			//declare prepare statement
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRAINSCHEDULE);
			System.out.println(preparedStatement);
				
			ResultSet rst = preparedStatement.executeQuery();
				
			while (rst.next()) { //declare while statement
				int trainId = rst.getInt("trainId");
				String trainName = rst.getString("trainName");
				String arrivalTime = rst.getString("arrivalTime");
				String depatureTime = rst.getString("depatureTime");
				String availability = rst.getString("availability");
				
				trainSchedule.add(new trainSchedule(trainId, trainName, arrivalTime, depatureTime, availability));
			}
		}catch (SQLException e) {//catch the exception
			e.printStackTrace();
		}
		return trainSchedule; //return value
	}
	

	//delete trainSchedule
	public boolean deletetrainSchedule(int trainId) throws SQLException {
		boolean rowDeleted;
		
		try (Connection connection = getConnection();
				//declare prepare statement
				PreparedStatement statement = connection.prepareStatement(DELETE_TRAINSCHEDULE_SQL);){
			statement.setInt(1, trainId);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted; //return value 
	}
	
}
