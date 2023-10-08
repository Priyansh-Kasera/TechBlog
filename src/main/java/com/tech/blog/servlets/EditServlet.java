package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			// fetching all data
			String userName = request.getParameter("user_name");
			System.out.println(userName);
			String userPassword = request.getParameter("user_password");
			String userAbout = request.getParameter("user_about");
			Part part = request.getPart("image");
			String imageName = part.getSubmittedFileName();
			
			
			// get the user from the session..
			HttpSession s = request.getSession();
			User user = (User)s.getAttribute("currentUser");
			
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			String oldFile=user.getProfile();
			if(imageName.length()==0) {
				user.setProfile(oldFile);
			}
			else {
			user.setProfile(imageName);
			}
			
			// update database
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean ans = userDao.updateUser(user);
			if(ans)
			{
				out.println("updated Successfully");
				String path = "C:\\Users\\priya\\eclipse-workspace\\TechBlog\\src\\main\\webapp\\pics"+File.separator+user.getProfile();
				//out.println(path);
					// delete code
				String pathOldFile = "C:\\Users\\priya\\eclipse-workspace\\TechBlog\\src\\main\\webapp\\pics"+File.separator+oldFile;
				if(!oldFile.equals("default.jfif"))	{
					Helper.deleteFile(pathOldFile);
				}	
					if(Helper.saveFile(part.getInputStream(), path)) {
						out.println("Profile Updated...");
						Message msg = new Message("Profile details updated","success","alert-success");
						s.setAttribute("msg",msg);
						
					}
					else {
						out.println("profil pic Not updated");
					}
				
				
				
			}
			else {
				out.println("Not updated");
				Message msg = new Message("Something went wrong..","error","alert-danger");
				s.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");
	}

}
