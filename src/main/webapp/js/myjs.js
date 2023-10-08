function doLike(uid,pid)
	{
		
	console.log(pid +" , "+uid);
		const d = {
				uid:uid,
				pid:pid,
				operation:'like'
		}
		$.ajax({
			url : "LikeServlet",
			data: d,
			success : function(data,textStatus,jqXHR){
				console.log(data);
				$('.like-counter').html(data);
					
				
			},
			error : function(data,textStatus,errorThrown){
				console.log(data)
			}
		})	
	
		
}
 

	
