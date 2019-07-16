
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "captcha.jsp",
			dataType:"json",
			success : function(data) {
				console.log(data.key);
				$("#key").val(data.key);
				$("#div01").html("<img src='captchaImage/"+data.captchaImageName+"'>");
				

			}
		});
		$("#btn01").on("click",function(){
			alert("asd");
			var form01Data = $("#form01").serialize();
			console.log(form01Data);
			$.ajax({
				url : "captcha.jsp",
				data : form01Data,
				dataType:"json",
				success : function(data) {
				}
			});
		});
	});
</script>
<body>
	<div id="div01">
	</div>
	<form id="form01">
		
		<input type="hidden" id="key" name="key">
		<input type="text" name="value">
		<button type="button" id="btn01">Go</button>
	</form>
</body>
</html>