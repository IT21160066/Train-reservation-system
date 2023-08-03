package pack3web;

//import java packages
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.List;

import pack1model.User;
import pack1model.trainSchedule;
import pack2dao.UserDAO;
import pack2dao.trainScheduledao;

/**
 * Servlet implementation class trainSheduleServlet
 */
@WebServlet("/")
	public class trainSheduleServlet extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		private trainScheduledao trainScheduledao;
		private UserDAO userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainSheduleServlet() {
   
    	this.trainScheduledao = new trainScheduledao();
    	this.userDAO = new UserDAO();
    }
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
		
		//declare switch statement
		switch (action) {
		case "/logout":
			logout(request, response);
			break;
		case "/signup":
			try {
				signup(request, response);
				break;
			} catch (IOException | SQLException | ServletException e) {
				e.printStackTrace();
			}
		case "/login":
			try {
				login(request, response);
				break;
			} catch (IOException | SQLException | ServletException e) {
				e.printStackTrace();
			}
		case "/new":
			showNewtrainShceduleForm(request, response);
			break;
			
		case "/insert":
			try {
			inserttrainSchedule(request, response);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			break;
			
		case "/delete":
			try {
				deletetrainShcedule(request, response);
				}catch(SQLException e) {
					e.printStackTrace();
				}
			break;
			
		case "/edit":
			
			try {
				edit(request, response);
				}catch(SQLException e) {
					e.printStackTrace();
				}
			break;
		case "/update":
			try {
				updatetrainSchedule(request, response);
				}catch(SQLException e) {
					System.out.println("update error");
					e.printStackTrace();
				}
			break;
			
		case "/list":
			//handle list
			try {
				gettrainScheduleList(request, response);
				}catch(SQLException e) {
					e.printStackTrace();
				}
			break;
		}
		
	}
	
	private void gettrainScheduleList(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
		
		//declare List
		List<trainSchedule> trainShduleList = trainScheduledao.selectAlltrainSchedules();
		
		request.setAttribute("trainScheduleList", trainShduleList);
		
		RequestDispatcher dis = request.getRequestDispatcher("trainsheduleList.jsp");
		dis.forward(request, response);
	}
	
	private void updatetrainSchedule(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		
		System.out.println("hello");
		int trainId = Integer.parseInt(request.getParameter("trainId"));
		System.out.println("there");
		String trainName = request.getParameter("trainName");
		String arrivalTime = request.getParameter("arrivalTime");
		String depatureTime = request.getParameter("depatureTime");
		String availability = request.getParameter("availability");
		
		trainSchedule b = new trainSchedule(trainId,trainName,arrivalTime,depatureTime,availability);
		
		boolean result = trainScheduledao.updatetrainShedule(b);
		
		if(result==true) {
			response.sendRedirect("list");
		}		
		
		System.out.println(trainId);
	}
	
	private void showNewtrainShceduleForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dis = request.getRequestDispatcher("trainScheduleUI..jsp");
		dis.forward(request, response);
	}
	
	private void inserttrainSchedule(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
	
		String trainName = request.getParameter("trainName");
		String arrivalTime = request.getParameter("arrivalTime");
		String depatureTime = request.getParameter("depatureTime");
		String availability = request.getParameter("availability");
		
		trainSchedule b = new trainSchedule(trainName,arrivalTime,depatureTime,availability);
		
		boolean result = trainScheduledao.inserttrainShedule(b);
		//declare if condition
		if(result == true) {
			response.sendRedirect("trainScheduleUI..jsp?id=success");
		}
		
	}
	
	private void deletetrainShcedule(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException {
		
		int trainId = Integer.parseInt(request.getParameter("id"));
		trainScheduledao.deletetrainSchedule(trainId);
		response.sendRedirect("list");
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response)throws IOException, SQLException, ServletException{
		
		System.out.println("hello");
		int trainId = Integer.parseInt(request.getParameter("id"));
	
		trainSchedule oldtrainShedule = trainScheduledao.selecttrainSchedule(trainId);
		
		System.out.println(trainId);
		
		RequestDispatcher dis = request.getRequestDispatcher("updatetrainSchedule.jsp");
		request.setAttribute("oldtrainShedule", oldtrainShedule);
		dis.forward(request, response);
	}
	
	// user sign up
	private void signup(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, ServletException {

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String nic = request.getParameter("nic");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User u = new User(name, address,email, nic, username, password);

		boolean result = userDAO.insertUser(u);

		if (result == true) {
			response.sendRedirect("login.jsp");
			
		} else if (result == false) {
			response.sendRedirect("error.jsp");
		}

		System.out.println(name);
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, ServletException { //throws the exception

		String uid = request.getParameter("username");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		//declare try catch block
		try {
			boolean validate = userDAO.Validate(uid, pass);
			// request.setAttribute("CustomerDetails", cusDetails);
			// System.out.println(cusDetails.get(0).getName());

			System.out.println(validate);

			if (validate == true) {

				session.setAttribute("username", uid);

				RequestDispatcher dis = request.getRequestDispatcher("adminHome.jsp");
				dis.forward(request, response);

			} else {
				response.sendRedirect("login.jsp?id=error");
			}

		} catch (Exception e) { //catch the exception
			e.printStackTrace();
		}

	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("home.jsp");
	}

}

