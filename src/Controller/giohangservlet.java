package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bo.giohangbo;
import bo.loaibo;

/**
 * Servlet implementation class giohangservlet
 */
@WebServlet("/giohangservlet")
public class giohangservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohangservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String masach = request.getParameter("ms");
		String tensach = request.getParameter("ts");
		long gia = Long.parseLong(request.getParameter("gia"));
		giohangbo gh = null;
		HttpSession session = request.getSession();

		if(session.getAttribute("gio")==null){
			gh = new giohangbo();	//Cap vung nho		
			session.setAttribute("gio", gh);	//Tao session
		}

		gh = (giohangbo)session.getAttribute("gio");
		
		gh.them(masach, tensach, gia, (long)1);
		session.setAttribute("gio", gh);
		
		

		
		
		response.sendRedirect("htgioservlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
