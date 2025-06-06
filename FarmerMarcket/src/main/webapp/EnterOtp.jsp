<!-- EnterOtp.jsp -->
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
.form-gap { padding-top: 70px; }
</style>
</head>
<body>
<div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="text-center">
						<h3><i class="fa fa-lock fa-4x"></i></h3>
						<h2 class="text-center">Enter OTP</h2>
						<% if(request.getAttribute("message") != null) { %>
							<p class='text-danger'><%= request.getAttribute("message") %></p>
						<% } %>
						<div class="panel-body">
							<form action="ValidateOtp" method="post">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-envelope color-blue"></i>
										</span>
										<input name="otp" placeholder="Enter OTP" class="form-control" type="text" required>
									</div>
								</div>
								<div class="form-group">
									<input class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
								</div>
							</form>
						</div> <!-- panel-body -->
					</div> <!-- text-center -->
				</div> <!-- panel-body -->
			</div> <!-- panel -->
		</div>
	</div>
</div>
</body>
</html>
