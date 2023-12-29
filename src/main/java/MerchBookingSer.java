

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class MerchBookingSer
 */
public class MerchBookingSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MerchBookingSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String c_id = (String) session.getAttribute("userid");
		String merch = (String) request.getParameter("merch");
		String quantity = (String) request.getParameter("quantity");
		
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/mesProject";
		String dbUsername = "root";
		String dbPassword = "3435";
		
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbURL,dbUsername,dbPassword);
			PreparedStatement insertorder = con.prepareStatement("insert into bookedMerge values (?,?,?,?)");
			PreparedStatement price = con.prepareStatement("select * from merch where m_name = ?");
			price.setString(1,merch);
			ResultSet rs = price.executeQuery();
			rs.next();
				
			int tPrice = Integer.parseInt(quantity) * Integer.parseInt(rs.getString(5));
			String tp = ""+ tPrice;
			insertorder.setString(1, c_id);
			insertorder.setString(2,merch);
			insertorder.setString(3, quantity);
			insertorder.setString(4, tp);
		
			insertorder.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		}
		response.sendRedirect("orders.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
