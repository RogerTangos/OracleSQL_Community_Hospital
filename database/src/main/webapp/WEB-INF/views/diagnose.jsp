<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>
			Diagnose Patient
		</title>
		<script src="../resources/js/jquery.min.js" type="text/javascript">
</script>
		<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/mvch.css">
		<script src="../resources/js/DiagnoseParser.js" type="text/javascript"></script>


</head>
	<body>
	<script type="text/javascript">
   var currentPatientId = '${patientId}';
	var currentPhysician = '${sessionScope.physician}';
	</script>
	
		<div id="wrapper">
<!-- start top -->
			<div id="upper-container" class="container">
					<input id="searchBox" class="rounded" size="400" placeholder=" search treatment name or number">
			</div><br />
<!-- start middle -->
			<div id="middle-container" class="container">
				<table class="fixed">
				<tr>
					<td>
						<table class="fixed">
							<tr>
									<th  class="title">
										Diagnosis
									</th>
									<th class="title">
										Diagnosis Number
									</th>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<div style="width:1200px; height:300px; overflow:auto;">
							<table class="table-hover table-condensed table-bordered fixed">
								<tbody id="dataTableBody">
										<!-- orders will be inserted into rows here -->
									</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
			</div>
<!-- start bottom -->
			<div id="three-column" class="container">
				<div id="tbox1">
					<div class="box-style box-style01" display="height:250">
						<div class="content">
							<h2 class="title">
								Patient Information:
							</h2>
							<ul id="personal">
								<li id="name">patient name
								</li>
								<li id="phone">patient phone
								</li>
								<li id="address">patient address
								</li>
								<li id="cityStateZip">patient zip
								</li>
							</ul>
							<ul id="patient">
								<li id="patientId">patientID
								</li>
								<li id="referringPhysician">referring physician
								</li>
								<li id="admissionType">admission type
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="tbox2">
					<div class="box-style box-style02" style="display:none" >
						<div class="content">
						<br />
						<br />
						<br />
						<br />
						<br />
						<br /><br />
						</div>
					</div>
				</div>
				<div id="tbox3">
					<div class="box-style box-style03" display="height:250">
						<div class="content">
							<h3 class="title">
								Action:
							</h3>
							<br /><br />
								<div class="button-box">
								<button id="diagnoseButton" class="btn btn-danger btn-block" onclick="diagnosePatient()" disabled>Diagnose Patient</button> 

								<form action="../patient/">
									<button id="nav-patients" class="btn btn-block">Back to All Patients</button>
								</form>
								<br /><br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- end bottom -->
	</body>
</html>