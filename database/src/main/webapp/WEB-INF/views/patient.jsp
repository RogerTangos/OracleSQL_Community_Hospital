<!-- Requirements: 

Update Patient and/or Person Table. (will do patient information first.)

Lots of information on this page...
q: json for of all patient fname, lname, and patientID
q: specific information from from the patient, person, and physician tables

PERSON_t: (associated with patient)
	Person_First_Name
	Person_Last_Name    
	Person_Address              
	Person_City         
	Person_Phone        
	Person_State        
	Person_Zip          
	Person_BirthDate

Patient_t:
	Patient_ID          
	Contact_Date
	Contact_Time
	Person_ID        
	Physician_ID
	Referral_ID  

Physician_t (associated with physician_id)
	Physician_ID

Person_T (associated with physician)
	Person_First_Name
	Person_Last_Name      

-->
<html>
	<head>
		<title>
			Search Patients
		</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/mvch.css">
		<script src="../resources/js/jquery.min.js" type="text/javascript">
</script>
<!-- 		<script src="../resources/js/PatientID.js" type="text/javascript"> -->
<!-- </script> -->
		<script src="../resources/js/FacilityJSON.js" type="text/javascript"></script>
		<script src="../resources/js/PatientParser.js" type="text/javascript">
</script>
	</head>
	<body>
		<div id="wrapper">
			<!-- start top -->
			<div id="upper-container" class="container">
				<input id="searchBox" class="rounded" size="400" placeholder=" search patient ID, first or last name">
			</div><!-- start middle -->
			<div id="middle-container" class="container">
				<table class="fixed">
					<tr>
						<td>
							<table class="fixed">
								<tr>
									<th class="title">
										First
									</th>
									<th class="title">
										Last
									</th>
									<th class="title">
										Date Admitted
									</th>
									<th class="title">
										PatientID
									</th>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<div style="width:1200px; height:200px; overflow:auto;">
								<table class="table-hover table-condensed table-bordered fixed">
									<tbody id="dataTableBody">
										<!-- patients will be inserted into rows here -->
									</tbody>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div><!-- start bottom -->
			<div id="three-column" class="container">
				<div id="tbox1">
					<div class="box-style-medium box-style01">
						<div class="content">
							<br>
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="name">Name</label>
									<div class="controls">
										<input type="text" id="name" placeholder="Name" readonly>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="Phone">Phone</label>
									<div class="controls">
										<input type="text" id="phone" placeholder="Phone">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="Address">Address</label>
									<div class="controls">
										<input type="text" id="address" placeholder="Address">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="city">city</label>
									<div class="controls">
										<input type="text" id="city" placeholder="City" readonly>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="State">State</label>
									<div class="controls">
										<select id="state">
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
									<label class="control-label" for="zip">zip</label>
									<div class="controls">
										<input type="text" id="zip" placeholder="Zipcode">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div id="tbox2">
					<div class="box-style-medium box-style02">
						<div class="content">
							<br>
							<form class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="patientID">Patient ID</label>
									<div class="controls">
										<input type="text" id="patientID" placeholder="patientID" readonly>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="referringPhysician">Referring Physician</label>
									<div class="controls">
										<input type="text" id="referringPhysician" placeholder="Referring Physician">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="inputPatientType">Patient Type</label>
									<div class="controls">
										<label class="radio"><input type="radio" name="optionsRadios" id="residentPatient" value="resident"> Resident Patient</label>
										<label class="radio"><input type="radio" name="optionsRadios" id="outpatient" value="outpatient"> Outpatient</label> <label class="radio"><input type="radio" name="optionsRadios" id="discharged" value="discharged" checked> Discharged</label>
									</div>
								</div>
								<span id="residentControls" >
									<div class="control-group">
										<label class="control-label" for="inputFacility">Facility</label>
										<div class="controls">
											<select id="facility">
												<option value="0">
													---
												</option><!-- care centers go here -->
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputRoomNo">Room No.</label>
										<div class="controls">
											<select id="room">
												<option value="0">
													---
												</option><!-- rooms go here -->
											</select> 
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputBedNo">Bed No.</label>
										<div class="controls">
											<select id="bed">
												<option value="0">
													---
												</option><!-- beds go here -->
											</select>
										</div>
									</div>
								</span>
							</form>
						</div>
					</div>
				</div>
				<div id="tbox3">
					<div class="box-style-medium box-style03">
						<div class="content">
							<br>
							<h3>
								Available Actions:
							</h3><br>
							<br>
							<div class="button-box">
								<button class="btn btn-danger btn-block" onclick="postUpdate()">Update Patient</button>
								<form action="./add">
									<button class="btn btn-block">Add New Patient</button>
								</form>
								<form action="../diagnose/" id="diagnose" method="POST">
									<button class="btn btn-block">Diagnose Patient</button>
								</form>
									<button id="deleteButton" class="btn btn-block" onClick="deletePatient()" disabled>
									Delete Patient</button>
								<form action="../">
									<button class="btn btn-block">Logout</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- end bottom -->
	</body>
</html>