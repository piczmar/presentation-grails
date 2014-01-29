<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap" />
<title>Welcome to Grails</title>

</head>
<body>
	 <div class="row" id="content">
      
      </div>

<script>
$.ajax({
	url: "${createLink(controller: 'blogPost', action: 'indexAjax.json')}",
	dataType: "json",
	success: function(d){ 
				console.log(d);
				var div = $('<div/>',{});
				
				
				d.forEach(
					function(e){
						var itemDiv = $('<div/>',{class: "col-lg-4"});
						itemDiv.append("<h2>"+e.title+"</h2>");
						itemDiv.append("<p>"+e.text+"</p>");
						itemDiv.append("<p><a class='btn btn-primary' href='#' role='button'>View details &raquo;</a></p>")
						div.append(itemDiv);
					}
				)
				div.appendTo('#content');
			  }
});
</script>
</body>
</html>
