

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

/**
 * Servlet implementation class SignupSer
 */
public class SignupSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupSer() {
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
		
		String iname = request.getParameter("fname");
		String iemail = request.getParameter("femail");
		String ipass = request.getParameter("fpass");
		
		
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/mesProject";
		String dbUsername = "root";
		String dbPassword = "3435";
		
		
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
			PreparedStatement ins = con.prepareStatement("insert into customers(c_name,c_email,c_pass) values(?,?,?)");
			PreparedStatement findexisting = con.prepareStatement("select * from customers where c_email = ?");
			
			ins.setString(1, iname);
			ins.setString(2, iemail);
			ins.setString(3, ipass);
			findexisting.setString(1,iemail);
			ResultSet rs = findexisting.executeQuery();
			
			if(rs.next()) {
				response.sendRedirect("signup.jsp");
				
			}
			else {
				ins.executeUpdate();
				response.sendRedirect("login.jsp");
			}
			con.close();
			
			}
		catch (Exception e) {
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
