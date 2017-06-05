// $( document ).ready(function(){
//   // click on the body, search for class of mark as read, run markAsRead function
//   $("body").on("click", ".mark-as-read", markAsRead)
// })
//
// function markAsRead(e) {
//   e.preventDefault();
//
//   var $link = $(this).parents('.link');
//   // after finding mark-as-read button, go up to parent called .link(tr)
//   var linkId = $link.data('link-id');
// // set linkId equal to the id of that tr
//   $.ajax({
//     type: "PATCH",
//     url: "/api/v1/links/" + linkId,
//     data: { read: true },
//   }).then(updateLinkStatus)
//     .fail(displayFailure);
// }
//
// function updateLinkStatus(link) {
//   $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
//   // find class of ^ then grab read-status class and change it to link.read
// }
//
// function displayFailure(failureData){
//   console.log("FAILED attempt to update Link: " + failureData.responseText);
// }
