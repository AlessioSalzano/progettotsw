package it.unisa.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
				           throws ServletException, java.io.IOException {
		try
		{	    

		     UserBean user = new UserBean();
		     user.setFirstName(request.getParameter("un"));
		     user.setLastName(request.getParameter("cg"));
		     user.setIndirizzo(request.getParameter("ind"));
		     user.setPassword(request.getParameter("pw"));
		     user.setNumerocarta(Integer.parseInt(request.getParameter("carta")));
		     user.setCvv(Integer.parseInt(request.getParameter("cvv")));
		     user.setIntestatario(request.getParameter("inte"));
		     UserDAO.doUpdate(user);
		     HttpSession session = request.getSession(true);	    
	          session.setAttribute("currentSessionUser",user); 
	          response.sendRedirect("ProductView.jsp");
	}
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
		       }
			}
