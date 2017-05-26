package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BeanUser user = new BeanUser();
		
		try {
		   // Fill the bean with the request parmeters
		   BeanUtils.populate(user, request.getParameterMap());
		   
		   //sI SOC AFQUI
		   
		   if (user.isComplete()) {
			   int result = 0;
			   try {
				   DAO dao = new DAO();
				   String query2="INSERT INTO users (user, name, middleName, lastName, mail, password, birthdate, profilePicture) VALUES ('"+user.getUser()+"', '"+user.getName()+"', '"+user.getMiddleName()+"','"+user.getLastName()+"','"+user.getMail()+"','"+user.getPassword()+"','"+user.getBirthdate()+"','"+user.getProfilePicture()+"')";
				   result = dao.executeInsert(query2);
				   if(result !=0) {
					   request.setAttribute("llista",listUsers());
					   RequestDispatcher requestDispatcher = request.getRequestDispatcher("ShowDatabase.jsp");
					   requestDispatcher.forward(request,response);
				   }
				   
					  
				   } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   } 
		   else {
			   request.setAttribute("user",user);
			   RequestDispatcher dispatcher = request.getRequestDispatcher("/RegisterForm.jsp");
			   dispatcher.forward(request, response);
			   }
		   }
		catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getParameter("q") != null ){
			String text = request.getParameter("q");
			DAO dao;
			try {
				dao = new DAO();
				ResultSet f = dao.executeSQL("SELECT COUNT(*) FROM users WHERE user='" + text + "';");
				f.next(); 
				//int i = Integer.parseInt(f.getString(1));
				response.addIntHeader(text, 0);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else
			doGet(request, response);
	}
	
	protected List<BeanUser> listUsers()
	{		
		DAO dao;
		try {
			List<BeanUser> llista = new ArrayList<BeanUser>();
			dao = new DAO();
			String query = "SELECT * FROM practica2.users";
			ResultSet resultados = dao.executeSQL(query);
			 while(resultados.next()) {
				 	BeanUser nou = new BeanUser();
				 	nou.setUser(resultados.getString(1));
				 	nou.setName(resultados.getString(2));
				 	nou.setMiddleName(resultados.getString(3));
				 	nou.setLastName(resultados.getString(4));
				 	nou.setMail(resultados.getString(5));
				 	nou.setPassword(resultados.getString(6));
				 	nou.setBirthdate(resultados.getString(7));
				 	nou.setProfilePicture(( resultados.getString(8).length() != 0) ? resultados.getString(8) :
				 		"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVkz6wCwKomtM0UZmpsvl_SsnQtP5RaRsl4xV-FLJGchb6KUSS");
				 	llista.add(nou);
			 }
			 return llista;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

}