package pack1model;



public class User {
	int userID;
	String name;
	String address;
	String email;
	String nic;
	String username;
	String password;
	



	public User(int userID, String name, String address, String email, String nic, String username, String password) {
		super();
		this.userID = userID;
		this.name = name;
		this.address = address;
		this.email = email;
		this.nic = nic;
		this.username = username;
		this.password = password;
	}
	
	public User(String name, String address, String email, String nic, String username, String password) {
		super();
		this.name = name;
		this.address = address;
		this.email = email;
		this.nic = nic;
		this.username = username;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public int getUserID() {
		return userID;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getNic() {
		return nic;
	}
	public String getUserName() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	
	
	
}
