package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import models.BeanUser;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.println("RegisterController.");
		
	   try {
	
		   BeanUser user = new BeanUser();
		   BeanUtils.populate(user, request.getParameterMap());
		
		   if (user.isComplete()) {
			   int result = 0;
			   try {
				   DAO dao = new DAO();
				   String query2="INSERT INTO users (user, name, middleName, lastName, mail, password, birthdate, profilePicture) VALUES ('"+user.getUser()+"', '"+user.getName()+"', '"+user.getMiddleName()+"','"+user.getLastName()+"','"+user.getMail()+"','"+user.getPassword()+"','"+user.getBirthdate()+"','"+user.getProfilePicture()+"')";
				   result = dao.executeInsert(query2);
				   if(result !=0) {
					   //request.setAttribute("llista",listUsers());
					  // RequestDispatcher requestDispatcher = request.getRequestDispatcher("ShowDatabase.jsp");
					   //requestDispatcher.forward(request,response);
				   }
				   
					  
				   } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLoginForm.jsp");
			   dispatcher.forward(request, response);
		   
		   } 
		   else {
		
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("ViewRegisterForm.jsp");
			   dispatcher.forward(request, response);
		   
		   }
	   
	   } catch (IllegalAccessException | InvocationTargetException e) {
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
