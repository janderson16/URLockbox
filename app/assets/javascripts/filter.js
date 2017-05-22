
  $('#link_filter').keyup(function() {
     var that = this;
     $.each($('.link-name').parent(),
     function(i, val) {
         if ($(val).text().toLowerCase().indexOf($(that).val()) == -1) {
             $('.link-row').eq(i).hide();
            //  $('tr').eq(i).hide();
         } else {
             $('.link-row').eq(i).show();
            //  $('tr').eq(i).show();
         }
     });
  });
