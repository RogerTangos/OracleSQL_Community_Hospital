// Generated by CoffeeScript 1.4.0
var currentPatient, diagnosePatient, filterTable, findText, iNumber, iString, initialize, input, patientID, populatePatientInfo, populateTable, selectDiagnosis, selectedDiagnosis;

patientID = 1;

selectedDiagnosis = null;

input = null;

iNumber = null;

iString = '';

currentPatient = null;

selectedDiagnosis = null;

$(document).ready(function() {
$.getJSON('diagnoseId/',function(data) {
	diagnosis = data;
		  });

$.getJSON('../patient/patientId/'+currentPatientId,function(data) {
	currentPatient = data;
		    return initialize();
		  });
});

initialize = function() {
  $('#searchBox').bind('propertychange input paste', findText);
  populateTable();
  return populatePatientInfo();
};

populatePatientInfo = function() {
	  $('#name').html(currentPatient.fname + ' ' + currentPatient.lname);
	  $('#phone').html(currentPatient.phone);
	  $('#address').html(currentPatient.address);
	  $('#cityStateZip').html(currentPatient.city + ', ' + currentPatient.state + ' ' + currentPatient.zip);
	  $('#patientId').html(currentPatient.patientId);
	  $('#referringPhysician').html(currentPatient.referringPhysician);
	  return $('#admissionType').html(currentPatient.patientType);
};

populateTable = function() {
  var diagnosisID, key, name, value, _results;
  _results = [];
  for (key in diagnosis) {
    value = diagnosis[key];
    name = value.name;
    diagnosisID = value.id;
    _results.push($('#dataTableBody').append('\
			<tr id="' + diagnosisID + '" onclick=selectDiagnosis(' + diagnosisID + ') >\
				<td>' + name + '</td>\
				<td>' + diagnosisID + '</td>\
			</tr>'));
  }
  return _results;
};

findText = function() {
  input = $('#searchBox').val();
  iNumber = input.replace(/[a-zA-z]/g, '').toLowerCase();
  iString = input.replace(/[0-9]/g, '').toLowerCase();
  return filterTable();
};

filterTable = function() {
  var key, name, regexNumber, regexString, value, _results;
  if (input === null || input === '') {
    return $('#dataTableBody tr').show();
  } else {
    if (iString === null || iString === '') {
      regexString = null;
    } else {
      regexString = new RegExp(iString, 'g');
    }
    if (iNumber === null || iNumber === '') {
      regexNumber = null;
    } else {
      regexNumber = new RegExp(iNumber, 'g');
    }
    _results = [];
    for (key in diagnosis) {
      value = diagnosis[key];
      name = value.name.toLowerCase();
      console.log('--- ---');
      if (regexNumber !== null && key.match(regexNumber)) {
        console.log('match found in key:' + key);
        _results.push($('#' + key).show());
      } else if (regexString !== null && name.match(regexString)) {
        console.log('match found in string: ' + value.fname + ' ' + value.lname);
        _results.push($('#' + key).show());
      } else {
        console.log('match not found. hiding key ' + key);
        _results.push($('#' + key).hide());
      }
    }
    return _results;
  }
};

selectDiagnosis = function(diagnosisID) {
  console.log(' key isnt modified yet');
  selectedDiagnosis = diagnosisID;
  $('#diagnoseButton').attr('disabled', false);
  $('tr').removeClass('highlight');
  return $('#' + diagnosisID).addClass('highlight');
};

diagnosePatient = function() {
  var postVar;
  postVar = {};
  postVar.patientId = currentPatient.patientId;
  postVar.diagnoseId = selectedDiagnosis;
  postVar.physicianId = currentPhysician;
  $.post("../physicianDX/add", postVar);
  return alert('patient diagnosed');
};
