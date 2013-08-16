# post update data to website for patient stauts:
#http://coffeescriptcookbook.com/chapters/jquery/ajax

# get data from here: patient/patientId/
# update data post to here: patient/update/{id}

# show() resident patient information when resident patient is selected.


# working on getting patient information to display on click.


input = null;
iNumber = null;
iString = '';
currentPatientKey = null;
# patients initialized in PatientJSON.js

$(document).ready ->
	do initialize

initialize = ->
	patients = $.get '/patient/patientId/'
	# this is disallowed in chrome, but will work if there is a local server running.  It's how I will get the patientID JSON.
	# right now, I am getting patients from a patientID.js file I created locally


	$('#searchBox').bind('propertychange input paste', findText)
	$('#residentControls').hide()
	$('#discharged').click(clearRoomBed)
	$('#outpatient').click(clearRoomBed)
	$('#residentPatient').click(showRoomBed)	

	do populateTable
	do populateFacility

populateTable = ->
	for key, value of patients
		fname = value.fname
		lname = value.lname
		dateAdmitted = value.dateAdmitted

		$('#dataTableBody').append('
			<tr id="'+key+'" onclick=displayInfo('+key+')>
				<td>'+fname+'</td>
				<td>'+lname+'</td>
				<td>'+dateAdmitted+'</td>
				<td>'+key+'</td>
			</tr>')

populateFacility = ->
	for key, facility of residency
		$('#facility').append('
			<option value="'+key+'">
			'+facility.facilityName+'</option>')

		# $('#'+parseInt(key)).change ->
			# do selectFacility

	$('#facility').change ->
		do showRooms


clearRoomBed = ->
	$('#residentControls').hide()

	$('#room').html('');
	$('#room').append('<option value="0">---</option>')

	$('#bed').html('');
	$('#bed').append('<option value="0">---</option>')

showRoomBed = ->
	$('#residentControls').show()
	$('#facility').val(0) #default value is zero

showRooms = ->
	selectedOption = $('#facility option:selected').attr('value')
	$('#room').html('');
	$('#room').append('<option value="0">---</option>')

	for key, facility of residency
		if key is selectedOption
			$('#room').append('
				<option value="'+facility.roomNo+'">
				'+facility.roomNo+'</option>')


	$('#room').change ->
		do showBeds

showBeds = ->
	selectedOption = $('#bed option:selected').attr('value')
	selectedFacility = $('#facility option:selected').attr('value')
	#hack. Should have passed the attribute, but couldn't make .change work properly
	
	$('#bed').html('');
	$('#bed').append('<option value="0">---</option>')

	for key, facility of residency
		if key is selectedFacility
			if facility.bedNo = selectedOption
				$('#bed').append('
					<option value="'+facility.bedNo+'">
					'+facility.bedNo+'</option>')



findText = ->
	input = $('#searchBox').val()
	iNumber = input.replace(/[a-zA-z]/g,'').toLowerCase()
	iString = input.replace(/[0-9]/g, '').toLowerCase()
	do filterTable

displayInfo = (key)->
	currentPatientKey = key
	$('tr').removeClass('highlight')
	$('#'+key).addClass('highlight')

	patient = patients[key]
	$('#name').val(patient.fname + ' ' + patient.lname)
	$('#phone').val(patient.phone)
	$('#address').val(patient.address)
	$('#city').val(patient.city)
	$('#zip').val(patient.zip)
	$('#state').val(patient.state) #need to select state from list

	$('#patientID').val(key)
	$('#referringPhysician').val(patient.referringPhysician)

	if patient.patientType is 'outpatient'
		$('#outpatient').prop('checked',true)
		do clearRoomBed

	else if patient.patientType is 'discharged'
		$('#discharged').prop('checked',true)
		# Remove all room and bed options
		do clearRoomBed

	else #residentPatient
		$('#residentPatient').prop('checked',true)
		$('#residentControls').show()
		$('#facility').val(patient.facilityNo)
		
		for key, facility of residency
			# console.log key
			if key is patient.facilityNo.toString()
				$('#room').append('
					<option value="'+facility.roomNo+'">
					'+facility.roomNo+'</option>')

				$('#bed').append('
					<option value="'+facility.bedNo+'">
					'+facility.bedNo+'</option>')

		$('#room').val(patient.roomNo)
		$('#bed').val(patient.bedNo)



	# $('#patientType') populate options
	# $('#careCenter') select from dropdown
	# room select from dropdown 
	# bed select from dropdown 


filterTable = ->	
	if input == null or input == '' 
		# console.log 'input empty'
		$('#dataTableBody tr').show()
	else 

		if iString == null or iString ==''
			regexString = null
		else
			regexString = new RegExp(iString, 'g' )


		if iNumber == null or iNumber ==''
			regexNumber = null
		else
			regexNumber = new RegExp(iNumber, 'g' )

		# #filter patients
		for key, value of patients
			fname = value.fname.toLowerCase()
			lname = value.lname.toLowerCase()

			console.log '--- ---'
			if regexNumber != null and key.match(regexNumber)
				# console.log 'match found in key:' +  key
				$('#'+key).show()

			else if regexString != null and (fname.match(regexString) or lname.match(regexString))
				# console.log 'match found in string: ' + value.fname + ' ' + value.lname
				$('#'+key).show()
			else
				# console.log 'match not found. hiding key ' + key
				$('#'+key).hide()

	# now populate the table with all of that data
	# $("#dataTable").find("tr:gt(0)").remove();

	# Hide all rows but the ones found

postUpdate = ->
	#currentPatientKey
	patientUpdate = {} #this is the JSON object to be posted
	pPhone = $('#phone').val()
	pAddress =  $('#address').val()
	pCity = $('#city').val()
	pState = $('#state').val()
	pZip = $('zip').val()
	pType = null
	pFacilityNo = null
	pRoomNo = null
	pBedNo = null

	if $('#discharged').attr('checked') is 'checked'
		pType = 'discharged'
	else if $('#resident').attr('checked') is 'checked'
		pType = 'resident'
	else
		pType = 'outpatient'

	if pType is 'resident'
		pFacility = ('#facility').val()
		pRoomNo = ('#room').val()
		pBedNo = ('#bed').val()

	patientUpdate.patientNo = currentPatientKey
	patientUpdate.phone = pPhone
	patientUpdate.address= pAddress
	patientUpdate.city = pCity
	patientUpdate.state = pState
	patientUpdate.zip = pZip
	patientUpdate.pType = pType
	patientUpdate.pfacility = pFacility
	patientUpdate.pRoomNo = pRoomNo
	patientUpdate.pBedNo = pBedNo


	# will work on a server, but not on local filesystem. It's a security feature chrome has to prevent XSS

	# $.post("/pageToPostTo", patientUpdate );


	do initialize
	$('#'.currentPatientKey).click()
	alert('patient updated')

