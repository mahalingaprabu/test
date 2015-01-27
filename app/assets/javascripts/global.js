(function($) {

$(document).ready(function() {
 
 $('#primary')
.find('#employee_empname').keyup(function() {
   $('span.error-keyup-2').remove();
    var inputVal = $(this).val();
    var characterReg = /^\s*[a-zA-Z,\s]+\s*$/;
    if(!characterReg.test(inputVal)) {
        $(this).after('<span class="error error-keyup-2">No special characters allowed.</span>');
    }
}).end();

 $('#primary')
.find('#employee_empid').keyup(function() {
   $('span.error-keyup-2').remove();
   var inputVal = $(this).val();
    var characterReg = /^\s*[a-zA-Z,\s]+\s*$/;
    if(!characterReg.test(inputVal)) {
        $(this).after('<span class="error error-keyup-2">No special characters</span>');
    }
}).end();

$('#primary')
 .find("#employee_empid").blur(function(){
    if($(this).val() == ''){
        alert('Employee id empty?'); 
    }
}).end();

 })( jQuery );
