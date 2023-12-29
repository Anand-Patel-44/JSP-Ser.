

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class LoginSer
 */
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String iemail = request.getParameter("femail");
		String ipass = request.getParameter("fpass");
		
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/mesProject";
		String dbUsername = "root";
		String dbPassword = "3435";
		
		
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
			PreparedStatement check = con.prepareStatement("select * from customers where c_email = ?");
			PreparedStatement getusername = con.prepareStatement("select c_name from customers where c_email=?");
			check.setString(1, iemail);
			getusername.setString(1, iemail);
			
			ResultSet rs = check.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(4).equals(ipass)) {
					ResultSet urs = getusername.executeQuery();
					urs.next();
					String u = urs.getString(1);
					String userid = rs.getString(1);
					HttpSession session = request.getSession();
					session.setAttribute("status", 1);
					session.setAttribute("userid", userid);
					session.setAttribute("username", u);
					
					response.sendRedirect("Home");
					
				}
				
				else {
					response.sendRedirect("login.jsp");
				}
			}
			else {
				response.sendRedirect("signup.jsp");
			}
			
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
