$(document).ready(function() {


$(function() {
    function updateCheckbox() {
        $(this).attr("value", $(this).attr("checked") ? 1 : 0);
    }
    // Run whenever checkbox is ticked or unticked
    $("input[type=checkbox]").change(updateCheckbox);
    // Run on page load
    updateCheckbox();
});
  
});