#dear future self,
# you're creating json that matches the search field by using regex expressions in the .match function

# search json for data
# create new json list with data
# populate table with new json

input = null;
iNumber = null;
iString = '';
# patients initialized in PatientJSON.js

$(document).ready ->
	do initialize

initialize = ->
	$('#searchBox').bind('propertychange input paste', findText)
	do populateTable

populateTable = ->
	for key, value of diagnosis
		name = value.name

		$('#dataTableBody').append('
			<tr id="'+key+'">
				<td>'+name+'</td>
				<td>'+key+'</td>
			</tr>')

findText = ->
	input = $('#searchBox').val()
	iNumber = input.replace(/[a-zA-z]/g,'').toLowerCase()
	iString = input.replace(/[0-9]/g, '').toLowerCase()
	do filterTable


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
		for key, value of diagnosis
			name = value.name.toLowerCase()

			console.log '--- ---'
			if regexNumber != null and key.match(regexNumber)
				console.log 'match found in key:' +  key
				$('#'+key).show()

			else if regexString != null and name.match(regexString)
				console.log 'match found in string: ' + value.fname + ' ' + value.lname
				$('#'+key).show()
			else
				console.log 'match not found. hiding key ' + key
				$('#'+key).hide()

	# now populate the table with all of that data
	# $("#dataTable").find("tr:gt(0)").remove();

	# Hide all rows but the ones found

