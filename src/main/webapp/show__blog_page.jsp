<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.User"%>
<%@ page errorPage="ErrorPage.jsp"%>
<%@ page import="com.tech.blog.entities.Post"%>
<%@ page import="com.tech.blog.entities.Category"%>
<%@ page import="com.tech.blog.dao.PostDao"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.dao.LikeDao"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%> || Tech Blog by Priyansh</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-info {
	font-size: 20px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}
</style>



</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="profile.jsp"><span
			class="fa fa-asterisk"></span> Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fa fa-home"></span> Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-drivers-license"></span> Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span> Do Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile-Modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-user-plus"></span> Log Out</a></li>
			</ul>
		</div>
	</nav>

	<!-- end of navbar -->


	<!-- Main Content of the body -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card-header primary-background text-white">
					<h4 class="post-title"><%=p.getpTitle()%></h4>
				</div>

				<div class="card-body ">

					<img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>"
						alt="Card image cap">

					<div class="row my-3 row-user">
						<div class="col-md-8 my-3">
							<p class="post-info">
								<a href="#"> Priyansh kasera</a> has posted
							</p>
						</div>
						<div class="col-md-4 my-3">
							<p class="post-date"><%=p.getpDate().toLocalDateTime()%></p>
						</div>
					</div>
					<p class="post-content"><%=p.getpContent()%></p>
					<br> <br>
					<div class="post-code">
						<pre><%=p.getpCode()%></pre>
					</div>

				</div>
				<div class="card-footer primary-background">
					<%
					LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
					%>
					<button type="button" onClick="doLike(<%=user.getId()%>,<%=p.getPid()%>)"
						data-uid="<%=user.getId()%>" data-pid="<%=p.getPid()%>"
						class="btn btn-outline-light btn-sm">
						<i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ld.countLikes(p.getPid())%></span>
					</button>
					<a href="#" class="btn btn-outline-light btn-sm"><i
						class="fa fa-commenting-o"></i> <span>20</span></a>
				</div>


			</div>
		</div>
	</div>

	<!--  end of main content of body -->


	<!--  start of profile Modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src=<%="pics/" + user.getProfile()%> class="img-fluid"
							style="border-radius: 50%; max-width: 100px;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- Details -->
						<div id="profile-detail">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>
									</tr>
									</tr>
									<tr>
										<th scope="row">Registered On</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!--  profile edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><%=user.getEmail()%></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>

									<tr>
										<td>About :</td>
										<td><textarea class="form-control" name="user_about"
												rows="3"><%=user.getAbout()%>
								</textarea></td>
									</tr>

									<tr>
										<td>New Profile</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-primary">Save</button>
								</div>

							</form>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!--  end of profile Modal -->


	<!-- Add Post Modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						Post detail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">

							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value=<%=c.getCid()%>><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title"
								class="form-control" />
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control"
								placeholder="Enter your Content" style="height: 200px;"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								placeholder="Enter your Program if any" style="height: 200px;"></textarea>
						</div>
						<div class="form-group">
							<label>Select your Pic</label> <br> <input name="pic"
								type="file">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- End Post Modal -->

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/myjs.js"
		type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$('#profile-detail').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$('#profile-detail').show();
					$('#profile-edit').hide();
					$(this).text("Edit");
					editStatus = false;
				}
			});
		});
	</script>

	<!-- Now add Post JS -->

	<script>
		$(document)
				.ready(
						function(e) {
							//
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												// this code is called when form is submitted
												event.preventDefault();
												console
														.log("You have clicked on submit")
												let form = new FormData(this);

												// now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStaus,
																	jqXHR) {
																// success..
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Saved successfully!",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong try again..",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																// error..
																swal(
																		"Error!",
																		"Something went wrong try again..",
																		"error");
															},
															processData : false,
															contentType : false
														})
											})
						})
	</script>

	<!--  Loading Posts using ajax -->
	<script>
		function getPosts(catId, temp) {
			$(document).ready(function(e) {
				$("#loader").show();
				$("#post-container").hide();
				$(".c-link").removeClass('active')

				$.ajax({
					url : "load_posts.jsp",
					data : {
						cid : catId
					},
					success : function(data, textStatus, jqXHR) {

						console.log(catId);
						$("#loader").hide();
						$("#post-container").show();
						$("#post-container").html(data);
						$(temp).addClass('active')
					}
				})
			})
		}

		$(document).ready(function(e) {
			let allPostRef = $('.c-link')[0]
			getPosts(0, allPostRef)
		})
	</script>


</body>
</html>