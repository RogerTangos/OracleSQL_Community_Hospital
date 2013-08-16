// Generated by CoffeeScript 1.4.0
var filterTable, findText, iNumber, iString, initialize, input, populateTable;

input = null;

iNumber = null;

iString = '';

$(document).ready(function() {
  return initialize();
});

initialize = function() {
  $('#searchBox').bind('propertychange input paste', findText);
  return populateTable();
};

populateTable = function() {
  var key, name, value, _results;
  _results = [];
  for (key in treatments) {
    value = treatments[key];
    name = value.name;
    _results.push($('#dataTableBody').append('\
			<tr id="' + key + '">\
				<td>' + name + '</td>\
				<td>' + key + '</td>\
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
    for (key in treatments) {
      value = treatments[key];
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