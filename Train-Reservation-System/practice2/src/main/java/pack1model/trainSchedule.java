package pack1model;

//declare public class trainSchedule
public class trainSchedule {

	//declare variables
	private int trainId;
	private String trainName;
	private String arrivalTime;
	private String depatureTime;
	private String availability;
	
	//declare overloaded constructor named trainSchedule
	public trainSchedule(int trainId, String trainName, String arrivalTime, String depatureTime, String availability) {
		
		//assign values to the variables
		this.trainId = trainId;
		this.trainName = trainName;
		this.arrivalTime = arrivalTime;
		this.depatureTime = depatureTime;
		this.availability = availability;
	}
	
	//declare overloaded constructor named trainSchedule
	public trainSchedule(String trainName, String arrivalTime, String depatureTime, String availability) {
		
		//assign values to the variables
		this.trainName = trainName;
		this.arrivalTime = arrivalTime;
		this.depatureTime = depatureTime;
		this.availability = availability;
	}

	//declare setters and getters
	public int getTrainId() {
		return trainId;
	}

	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getDepatureTime() {
		return depatureTime;
	}

	public void setDepatureTime(String depatureTime) {
		this.depatureTime = depatureTime;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}
	
}
