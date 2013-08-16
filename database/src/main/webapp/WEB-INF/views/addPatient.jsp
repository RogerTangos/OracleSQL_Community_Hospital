<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- Requirements:

Query database to see if information matches a previous patient. Check fname, lname, DOB.

List of care centers
List of rooms in selected care center
List of beds in selected room

I believe I can get this asynchronously.  For the first round, I may just develop using dummy data.
 -->

 <!-- Need to get facility, care center, and room no on the client side and display accordingly.
Ask Zihang about creating new DAO objects for this.
  -->
	<head>
		<title>
			Add Patient
		</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/mvch.css">
		<script src="../resources/js/jquery.min.js" type="text/javascript"></script>
		<script src="../resources/js/FacilityJSON.js" type="text/javascript"></script>
		<script src="../resources/js/AddPatient.js" type="text/javascript"></script>
	</head>
	<body>
	
		<script type="text/javascript">
   var currentPhysician = '${sessionScope.physician}';
	</script>
		<div id="three-column" class="container">
			<div id="tbox1">
				<div class="box-style-tall box-style01">
					<br />
					<div class="content">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="inputFName">First Name</label>
								<div class="controls">
									<input type="text" id="inputFName" placeholder="First Name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputLName">Last Name</label>
								<div class="controls">
									<input type="text" id="inputLName" placeholder="Last Name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPatientID">PatientID</label>
								<div class="controls">
									<input type="text" id="inputPatientID" placeholder="PatientID" readonly>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputAdmittingPhysician">Admitting Physician</label>
								<div class="controls">
									<input type="text" id="inputAdmittingPhysician" placeholder="Admitting Physician" readonly>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="tbox2">
				<div class="box-style-tall box-style02"><br />
					<div class="content">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="Address">Address</label>
								<div class="controls">
									<input type="text" id="inputAddress" placeholder="Street Address">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputCity">City</label>
								<div class="controls">
									<input type="text" id="inputCity" placeholder="City">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputState">State</label>
								<div class="controls">
									<!-- <input type="text" id="inputState" placeholder="State"> -->
									<select id="inputState">
											<option value="---">
												---
											</option>
											<option value="AL">
												Alabama
											</option>
											<option value="AK">
												Alaska
											</option>
											<option value="AZ">
												Arizona
											</option>
											<option value="AR">
												Arkansas
											</option>
											<option value="CA">
												California
											</option>
											<option value="CO">
												Colorado
											</option>
											<option value="CT">
												Connecticut
											</option>
											<option value="DE">
												Delaware
											</option>
											<option value="DC">
												District Of Columbia
											</option>
											<option value="FL">
												Florida
											</option>
											<option value="GA">
												Georgia
											</option>
											<option value="HI">
												Hawaii
											</option>
											<option value="ID">
												Idaho
											</option>
											<option value="IL">
												Illinois
											</option>
											<option value="IN">
												Indiana
											</option>
											<option value="IA">
												Iowa
											</option>
											<option value="KS">
												Kansas
											</option>
											<option value="KY">
												Kentucky
											</option>
											<option value="LA">
												Louisiana
											</option>
											<option value="ME">
												Maine
											</option>
											<option value="MD">
												Maryland
											</option>
											<option value="MA">
												Massachusetts
											</option>
											<option value="MI">
												Michigan
											</option>
											<option value="MN">
												Minnesota
											</option>
											<option value="MS">
												Mississippi
											</option>
											<option value="MO">
												Missouri
											</option>
											<option value="MT">
												Montana
											</option>
											<option value="NE">
												Nebraska
											</option>
											<option value="NV">
												Nevada
											</option>
											<option value="NH">
												New Hampshire
											</option>
											<option value="NJ">
												New Jersey
											</option>
											<option value="NM">
												New Mexico
											</option>
											<option value="NY">
												New York
											</option>
											<option value="NC">
												North Carolina
											</option>
											<option value="ND">
												North Dakota
											</option>
											<option value="OH">
												Ohio
											</option>
											<option value="OK">
												Oklahoma
											</option>
											<option value="OR">
												Oregon
											</option>
											<option value="PA">
												Pennsylvania
											</option>
											<option value="RI">
												Rhode Island
											</option>
											<option value="SC">
												South Carolina
											</option>
											<option value="SD">
												South Dakota
											</option>
											<option value="TN">
												Tennessee
											</option>
											<option value="TX">
												Texas
											</option>
											<option value="UT">
												Utah
											</option>
											<option value="VT">
												Vermont
											</option>
											<option value="VA">
												Virginia
											</option>
											<option value="WA">
												Washington
											</option>
											<option value="WV">
												West Virginia
											</option>
											<option value="WI">
												Wisconsin
											</option>
											<option value="WY">
												Wyoming
											</option>
										</select>



								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputZipcode">Zipcode</label>
								<div class="controls">
									<input type="text" id="inputZipcode" placeholder="Zipcode">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPhone">Phone</label>
								<div class="controls">
									<input type="text" id="inputPhone" placeholder="Phone">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="tbox3">
				<div class="box-style-tall box-style03"><br />
					<div class="content">
						<form class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="inputPatientType">Patient Type</label>
								<div class="controls">
									<label class="radio"><label class="radio"><input type="radio" name="optionsRadios" id="residentPatient" value="resident" checked> Resident Patient</label> <label class="radio"><input type="radio" name="optionsRadios" id="outpatient" value="outpatient" checked> Outpatient</label> <label class="radio"><input type="radio" name="optionsRadios" id="discharged" value="discharged"> Discharged</label></label>
								</div>
							</div>
							<span id="residentControls" >
							<div class="control-group">
								<label class="control-label" for="inputCareCenter">Care Center</label>
								<div class="controls">
									<select id="facility">
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputRoomNo">Room No.</label>
								<div class="controls">
									<select id="room">

									</select> <!-- <input type="text" id="inputRoomNo" placeholder="Room No."> -->
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputBedNo">Bed No.</label>
								<div class="controls">
									<select id="bed">
									</select>
								</div>
							</div>
						</span>
						</form>
						<div class="button-box" >
							<form>
								<button type="button" class="btn btn-block btn-danger" onclick="postNewPatient()">Add New Patient</button>
							</form>
							<form action="../patient/">
								<button class="btn btn-block">View All Patients</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>