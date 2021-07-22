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
    <link rel="stylesheet" type="text/css" href="css/materialdesignicons.min.css" />

    <link rel="stylesheet" type="text/css" href="css/fontawesome.css" />

    <link rel="stylesheet" type="text/css" href="css/nice-select.css" />

    <!-- selectize css -->
    <link rel="stylesheet" type="text/css" href="css/selectize.css" />

    <!-- Custom  Css -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />
    
    <script src="js/jquery.min.js"></script>
    <script>
	    $(document).ready( function () {
	        $('#example').DataTable();
	    } );
    </script>
    
<title>Post List</title>
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
        <!-- Tagline STart -->
        <div class="tagline">
            <div class="container">
                <div class="float-right">
                    <ul class="topbar-list list-unstyled d-flex" style="margin: 11px 0px;">
                        <li class="list-inline-item"><a href="/viewJobs">Job List</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- Tagline End -->

        <!-- Menu Start -->
        <div class="container">
	        <div style="text-align: center;">
				<h1>NIDM Job Post List</h1>
			</div>
        </div><!--end end-->
    </header><!--end header-->
    <!-- Navbar End -->
    <!-- CANDIDATES LISTING START -->
    <section class="section" style="padding-top: 150px;">
        <div class="container">
            <div class="row">
               	<div class="col-lg-12 col-md-12" style="text-align: right; padding-bottom: 10px;">
	        		<a href="${pageContext.request.contextPath}/jobApplications/export" class="btn btn-primary btn-sm"><i class="mdi mdi-cloud-download mr-2"></i>Export All Applications</a>
	            </div>
                <div class="col-lg-12 col-md-12">
                	<table id="example" class="display" style="width:100%">
				        <thead>
				            <tr>
				                <th width="10%">Post Id</th>
				                <th width="40%">Post Name</th>
				                <th width="10%">Applied</th>
				                <th width="25%">Action</th>
				            </tr>
				        </thead>
				        <tbody>
				        <c:choose>
							<c:when test="${not empty jobs}">
								<!-- loop over and print our employees -->
							<c:forEach var="job" items="${jobs}">
							<c:set var="count" value="${count + 10}" scope="page"/>
								<tr>
									<td> ${job.key.jobId} </td>
									<td> ${job.key.jobTitle} </td>
									<td> ${job.value} </td>
									<td> 
										<a href="${pageContext.request.contextPath}/applicationByJob/${job.key.jobTitle}" class="btn btn-primary-outline btn-sm">Show Applicant List</a> |
										<a href="${pageContext.request.contextPath}/jobApplications/export/${job.key.jobTitle}" class="btn btn-primary-outline btn-sm">Export</a>
									</td>
									
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<%-- <center><h1>No Applicant Found.</h1></center> --%>
							</c:otherwise>
						</c:choose>
            			</tbody>
            		</table>
                </div>
            </div>
        </div>
    </section>
    <hr>
    <footer class="footer footer-bar">
        <div class="container text-center">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="">
                        <p class="mb-0">© 2020 -2021 NIDM Job Portal. Design with <i class="mdi mdi-heart text-danger"></i> by Webez.in</p>
                    </div>
                </div>
            </div>
        </div><!--end container-->
    </footer><!--end footer-->
    <!-- Footer End -->

    <!-- Back to top -->
    <a href="#" class="back-to-top rounded text-center" id="back-to-top"> 
        <i class="mdi mdi-chevron-up d-block"> </i> 
    </a>
    <!-- Back to top -->

    <!-- javascript -->
	<script type="text/javascript" src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/plugins.js"></script>

    <!-- selectize js -->
    <script src="js/selectize.min.js"></script>

    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/app.js"></script>
</body>
</html>