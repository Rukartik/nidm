<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/favicon.ico">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!--Material Icon -->
<link rel="stylesheet" type="text/css"
	href="css/materialdesignicons.min.css" />

<link rel="stylesheet" type="text/css" href="css/fontawesome.css" />

<!-- selectize css -->
<link rel="stylesheet" type="text/css" href="css/selectize.css" />

<link rel="stylesheet" type="text/css" href="css/nice-select.css" />

<!-- Custom  Css -->
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Application Form</title>

</head>

<body>
	<!-- Loader -->
	<div id="preloader">
		<div id="status">
			<div class="spinner">
				<div class="double-bounce1"></div>
				<div class="double-bounce2"></div>
			</div>
		</div>
	</div>
	<!-- Loader -->

	<!-- Navigation Bar-->
	<header id="topnav" class="defaultscroll scroll-active scroll">
		<div style="text-align: center;">
			<h1>Application Saved Successfully</h1>
		</div>
	</header>
	
	<section class="section" style="padding-top: 150px;">
        <div class="container">
            <div class="row">
            	<p>
            		Dear ${application.applicant.applicantName },<br/><br/>

					Your online application for ${application.appliedPosition} at NIDM has been successfully submitted.<br/> 
					You can view your application from the following link.<br/><br/>

					<a href="${baseUrl}/applicationDetails/${application.jobApplicationId}">Click Here</a><br/><br/>
            		
            		Regards,<br/>
					Administration Section,<br/>
					NIDM, Delhi
            	</p>
            </div>
		</div>
	</section>
	
	<a href="#" class="back-to-top rounded text-center" id="back-to-top">
		<i class="mdi mdi-chevron-up d-block"> </i>
	</a>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/plugins.js"></script>

	<!-- selectize js -->
	<script src="js/selectize.min.js"></script>

	<script src="js/jquery.nice-select.min.js"></script>

	<script src="js/app.js"></script>


</body>
</html>