

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

import com.mysql.cj.Session;
import com.project.cdao.BookingDAO;
import com.project.icls.Booking;

/**
 * Servlet implementation class BookingSer
 */
public class BookingSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		String c_id = (String) session.getAttribute("userid");
		String tour = (String) request.getParameter("tour");
		String nvisitors = (String) request.getParameter("nvisitors");
		String vdate = (String) request.getParameter("vdate");
		

		
//		String[] arrdate = vdate.split("-");
//		
//		String odate = arrdate[2]+"-"+arrdate[1]+"-"+arrdate[0];
//		
//		System.out.println(c_id + " " + tourid + " " + nvisitors + " " + odate);
		
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/mesProject";
		String dbUsername = "root";
		String dbPassword = "3435";
		
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbURL,dbUsername,dbPassword);
			PreparedStatement insertbook = con.prepareStatement("insert into booked(c_id,tour_name,nvisitors,vdate,totalprice) values(?,?,?,?,?)");
			PreparedStatement gettourinfo = con.prepareStatement("select * from tours where tour_name = ?");
			
			gettourinfo.setString(1, tour);
			ResultSet rs = gettourinfo.executeQuery();
			rs.next();
			
			String otourname = rs.getString(1);
			String oprice = rs.getString(2);
			
			
			int visitorsn = Integer.parseInt(nvisitors);
			double pricepv = Double.parseDouble(oprice);
			double totalprice = visitorsn*pricepv;
			String tp = ""+totalprice;
			
			insertbook.setString(1, c_id);
			insertbook.setString(2, otourname);
			insertbook.setString(3, nvisitors);
			insertbook.setString(4, vdate);
			insertbook.setString(5, tp);
		
			insertbook.executeUpdate();
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		response.sendRedirect("bookedtours.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
