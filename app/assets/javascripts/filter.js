$(document).ready(function () {
  // filter by text input
  $('#link-filter').keyup(function() {
    var that = this
    $.each($('.link-name').parent(),
    function(i, val) {
      if ($(val).text().toLowerCase().indexOf($(that).val()) == -1) {
        $('.link-row').eq(i).hide()
      } else {
        $('.link-row').eq(i).show()
      }
    })
  })
});
