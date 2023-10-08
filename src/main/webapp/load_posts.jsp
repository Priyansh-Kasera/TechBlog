<%@page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.entities.User" %>
<%
User user = (User)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login.jsp");
}

%>
<div class="row">
<%
	Thread.sleep(1000);
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;
	if(cid==0){
	posts = d.getAllPosts();
	}
	else{
		posts = d.getPostByCatId(cid);
	}
	if(posts.size()==0)
	{
		out.println("<h3 class='display-3 text-center'>No Post in this category..</h3>");
		return;
	}
	for(Post p : posts)
	{
%>

<div class="col-md-6 mt-2">
	<div class="card">
		<img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
		<div class="card-body">
			<b><%= p.getpTitle() %></b>
			<p><%= p.getpContent() %></p>
			
			
		</div>
		
		<div class="card-footer primary-background text-center">
			<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
			%>
			<button type="button" onClick="doLike(<%=user.getId()%>,<%=p.getPid()%>)"
						data-uid="<%=user.getId()%>" data-pid="<%=p.getPid()%>"
						class="btn btn-outline-light btn-sm">
						<i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ld.countLikes(p.getPid())%></span>
					</button>
			<a href="show__blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
			<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>
		</div>
	
	</div>
</div>
		
<% 
	}

%>
</div>