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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#dob" ).datepicker({ 
    	dateFormat: 'dd-mm-yy',
    	changeMonth: true,
        changeYear: true,
        yearRange: '1945:'+(new Date).getFullYear()
    });
    
    $(".monthPicker").datepicker({
        dateFormat: 'mm-yy',
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: '1945:'+(new Date).getFullYear(),
        onClose: function(dateText, inst) {  
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
            $(this).val($.datepicker.formatDate('mm-yy', new Date(year, month, 1)));
        }
    });

    $(".monthPicker").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });    
    });
    
    $('#declaration').val(this.checked);

    $('#declaration').change(function() {
        if(this.checked) {
            $("#checkedDeclaration").show();
            $("#uncheckedDeclaration").hide();
        }else{
        	$("#checkedDeclaration").hide();
            $("#uncheckedDeclaration").show();
        }
    });
    
  });
  </script>

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
			<h1>NIDM Job Application Form</h1>
		</div>
	</header>
	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="rounded shadow bg-white p-4">
						<div class="custom-form">
							<div id="message3"></div>
							<form:form method="POST" modelAttribute="application" commandName="application" name="application-form" id="application-form" action="save">
								<div class="has-errors">
									<form:errors path="applicant.applicantName" class="text-danger" />
								</div>
								<div class="has-errors"><form:errors path="applicant.applicantFatherName" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantDOB" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantDomicile" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantNationality" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.gender" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantContactDetails.applicantContactNo" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantContactDetails.applicantEmail" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantContactDetails.applicantMailingAddress" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantContactDetails.applicantPermanentAddress" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantEducationDetails" class="text-danger" /></div>
								<div class="has-errors"><form:errors path="applicant.applicantWorkExpDetailsId" class="text-danger" /></div>
								<div class="row">
									<div class="col-md-6">
                                        <div class="form-group app-label mt-2">
                                            <label class="text-muted">Name of the Position applied for : </label>
                                            <div class="form-button">
                                                <form:select  path="appliedPosition" class="nice-select rounded">
                     								<form:options items = "${jobs}" itemValue="jobTitle" itemLabel="jobTitle" />
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Full Name : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantName" path="applicant.applicantName"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Father's Name : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantFatherName" path="applicant.applicantFatherName"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Date of Birth : </label><label class="text-danger">*</label>
											<form:input id="dob" path="applicant.applicantDOB"
												type="text" class="form-control resume" placeholder="dd-mm-yyyy" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Domicile : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantDomicile" path="applicant.applicantDomicile"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Nationality : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantNationality" path="applicant.applicantNationality"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-4">
                                        <div class="form-group app-label mt-2">
                                            <label class="text-muted">Gender : </label><label class="text-danger">*</label>
                                            <div class="form-button">
                                            	<label style="cursor: pointer; padding: 15px;" class="text-muted"><form:radiobutton path = "applicant.gender" value = "Male" />  Male</label>
                                            	<label style="cursor: pointer; padding: 15px;" class="text-muted"><form:radiobutton path = "applicant.gender" value = "Female" />  Female</label>
                                            </div>
                                        </div>
                                    </div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Mobile Number : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantContactDetails.applicantContactNo" path="applicant.applicantContactDetails.applicantContactNo"
												type="text" maxlength="10" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Email Address : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantContactDetails.applicantEmail" path="applicant.applicantContactDetails.applicantEmail"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Postal Address : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantContactDetails.applicantMailingAddress" path="applicant.applicantContactDetails.applicantMailingAddress"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Permanent Address : </label><label class="text-danger">*</label>
											<form:input id="applicant.applicantContactDetails.applicantPermanentAddress" path="applicant.applicantContactDetails.applicantPermanentAddress"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Educational Qualifications: </label>
											<table>
												<thead>
													<tr>
														<th class="text-muted">Sr. No.</th>
														<th class="text-muted">Course</th>
														<th class="text-muted">Subject/Specialization</th>
														<th class="text-muted">University/Institute</th>
														<th class="text-muted">Year of Passing</th>
														<th class="text-muted">Marks</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input value="1" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantEducationDetails[0].course" path="applicant.applicantEducationDetails[0].course" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[0].subject" path="applicant.applicantEducationDetails[0].subject" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[0].universityOrInstitute" path="applicant.applicantEducationDetails[0].universityOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[0].yearOfPassing" path="applicant.applicantEducationDetails[0].yearOfPassing" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[0].divisionOrClass" path="applicant.applicantEducationDetails[0].divisionOrClass" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="2" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantEducationDetails[1].course" path="applicant.applicantEducationDetails[1].course" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[1].subject" path="applicant.applicantEducationDetails[1].subject" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[1].universityOrInstitute" path="applicant.applicantEducationDetails[1].universityOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[1].yearOfPassing" path="applicant.applicantEducationDetails[1].yearOfPassing" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[1].divisionOrClass" path="applicant.applicantEducationDetails[1].divisionOrClass" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="3" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantEducationDetails[2].course" path="applicant.applicantEducationDetails[2].course" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[2].subject" path="applicant.applicantEducationDetails[2].subject" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[2].universityOrInstitute" path="applicant.applicantEducationDetails[2].universityOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[2].yearOfPassing" path="applicant.applicantEducationDetails[2].yearOfPassing" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[2].divisionOrClass" path="applicant.applicantEducationDetails[2].divisionOrClass" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="4" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantEducationDetails[3].course" path="applicant.applicantEducationDetails[3].course" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[3].subject" path="applicant.applicantEducationDetails[3].subject" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[3].universityOrInstitute" path="applicant.applicantEducationDetails[3].universityOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[3].yearOfPassing" path="applicant.applicantEducationDetails[3].yearOfPassing" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantEducationDetails[3].divisionOrClass" path="applicant.applicantEducationDetails[3].divisionOrClass" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Work Experience : </label>
											<table>
												<thead>
													<tr>
														<th class="text-muted">Sr. No.</th>
														<th class="text-muted">Organization/Institute</th>
														<th class="text-muted">Post held</th>
														<th class="text-muted" colspan="2" style="text-align: center;">Period</th>
														<th class="text-muted">Pay/Emoluments drawn*</th>
														<th class="text-muted">Nature of Work</th>
													</tr>
													<tr>
														<td colspan="3"></td>
														<th class="text-muted" style="text-align: center;" scope="colgroup">From</th>
														<th class="text-muted" style="text-align: center;" scope="colgroup">To</th>
														<td rowspan="3"></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input value="1" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].organizationOrInstitute" path="applicant.applicantWorkExpDetailsId[0].organizationOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].designation" path="applicant.applicantWorkExpDetailsId[0].designation" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].periodFrom" path="applicant.applicantWorkExpDetailsId[0].periodFrom" type="text" class="form-control resume monthPicker" placeholder=""/></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].periodTo" path="applicant.applicantWorkExpDetailsId[0].periodTo" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].payOrEmolumentsdrawn" path="applicant.applicantWorkExpDetailsId[0].payOrEmolumentsdrawn" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[0].natureOfWork" path="applicant.applicantWorkExpDetailsId[0].natureOfWork" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="2" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].organizationOrInstitute" path="applicant.applicantWorkExpDetailsId[1].organizationOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].designation" path="applicant.applicantWorkExpDetailsId[1].designation" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].periodFrom" path="applicant.applicantWorkExpDetailsId[1].periodFrom" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].periodTo" path="applicant.applicantWorkExpDetailsId[1].periodTo" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].payOrEmolumentsdrawn" path="applicant.applicantWorkExpDetailsId[1].payOrEmolumentsdrawn" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[1].natureOfWork" path="applicant.applicantWorkExpDetailsId[1].natureOfWork" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="3" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].organizationOrInstitute" path="applicant.applicantWorkExpDetailsId[2].organizationOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].designation" path="applicant.applicantWorkExpDetailsId[2].designation" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].periodFrom" path="applicant.applicantWorkExpDetailsId[2].periodFrom" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].periodTo" path="applicant.applicantWorkExpDetailsId[2].periodTo" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].payOrEmolumentsdrawn" path="applicant.applicantWorkExpDetailsId[2].payOrEmolumentsdrawn" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[2].natureOfWork" path="applicant.applicantWorkExpDetailsId[2].natureOfWork" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
													<tr>
														<td><input value="4" type="text" class="form-control resume" readonly="readonly"/></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].organizationOrInstitute" path="applicant.applicantWorkExpDetailsId[3].organizationOrInstitute" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].designation" path="applicant.applicantWorkExpDetailsId[3].designation" type="text" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].periodFrom" path="applicant.applicantWorkExpDetailsId[3].periodFrom" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].periodTo" path="applicant.applicantWorkExpDetailsId[3].periodTo" type="text" class="form-control resume monthPicker" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].payOrEmolumentsdrawn" path="applicant.applicantWorkExpDetailsId[3].payOrEmolumentsdrawn" type="number" class="form-control resume" placeholder="" /></td>
														<td><form:input id="applicant.applicantWorkExpDetailsId[3].natureOfWork" path="applicant.applicantWorkExpDetailsId[3].natureOfWork" type="text" class="form-control resume" placeholder="" /></td>
													</tr>
												</tbody>
											</table>
											<label class="text-muted">Note : * in case of retired, last pay/emoluments drawn</label>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Brief about
												publications/research/documentation work etc. : </label>
											<form:input id="applicantBriefOfPubResDoc" path="applicantBriefOfPubResDoc"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Additional information if
												any, which candidates would like to mention in support to
												his/her suitability for the post : </label>
											<form:input id="applicantAdditionalInfo" path="applicantAdditionalInfo"
												type="text" class="form-control resume" placeholder="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">References (upto 2 -
												Name/Affiliation and Contacts) : </label>
											<form:input id="applicantReferencesDetails" path="applicantReferencesDetails"
												type="text" class="form-control resume" placeholder="Reference Name, Contact No." />
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group app-label mt-2">
											<label class="text-muted">Declaration : </label>
											<label style="cursor: pointer;" class="text-muted"><form:checkbox path="" id="declaration" value="Declaration"/> I hereby declare that the information given in this application is true and correct to the best of my knowledge and belief. In case any information given in this application proves to be false or incorrect, I shall be responsible for the consequences.</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-12 mt-2" id="checkedDeclaration" style="display: none;">
										<input type="submit" class="btn btn-primary" value="Apply"/>
									</div>
									<div class="col-lg-12 mt-2" id="uncheckedDeclaration">
										<input type="button" style="cursor: default;" class="btn btn-secondary" title="Please check declaration." value="Apply"/>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- POST A JOB END -->

	<!-- subscribe start -->

	<!-- subscribe end -->

	<!-- footer start -->

	<!-- footer end -->
	<hr>
	<footer class="footer footer-bar">
		<div class="container text-center">
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="">
						<p class="mb-0">
							© 2020 -2021 NIDM Job Portal. Design with <i
								class="mdi mdi-heart text-danger"></i> by Webez.in
						</p>
					</div>
				</div>
			</div>
		</div>
		<!--end container-->
	</footer>
	<!--end footer-->
	<!-- Footer End -->

	<!-- Back to top -->
	<a href="#" class="back-to-top rounded text-center" id="back-to-top">
		<i class="mdi mdi-chevron-up d-block"> </i>
	</a>
	<!-- Back to top -->

	<!-- javascript -->
	<!-- <script src="js/jquery.min.js"></script> -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/plugins.js"></script>

	<!-- selectize js -->
	<script src="js/selectize.min.js"></script>

	<script src="js/jquery.nice-select.min.js"></script>

	<script src="js/app.js"></script>


</body>
</html>