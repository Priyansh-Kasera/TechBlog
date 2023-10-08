package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String operation= request.getParameter("operation");
		int uid= Integer.parseInt(request.getParameter("uid"));
		int pid= Integer.parseInt(request.getParameter("pid"));
//		out.println("data from server");
//		out.println(operation);
//		out.println(uid);
//		out.println(pid);
		LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			ldao.insertLike(pid, uid);
			
			out.println(ldao.countLikes(pid));
		}
		
	}

	

}
