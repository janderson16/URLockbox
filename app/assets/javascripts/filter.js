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
// show only read links
  $('#show-read').on('click', function () {
      var $rowsNo = $('#Table2 tbody tr').filter(function () {
          return $.trim($(this).find('td').eq(2).text()) === "false"
      }).toggle();
  });
  // show only unread links
  $('#show-unread').on('click', function () {
      var $rowsNo = $('#Table2 tbody tr').filter(function () {
          return $.trim($(this).find('td').eq(2).text()) === "true"
      }).toggle();
  });
});
