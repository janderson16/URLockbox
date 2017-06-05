// read.js
$(document).ready(function(){
    $("body").on("click", ".mark-as-read", markAsRead)
    $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsRead(e) {
  e.preventDefault()

  var linkId = $(this).parent().data("id")

  $.ajax({
    method: "PUT",
    url: `/api/v1/links/${linkId}`,
    data: {"link": {read: "true"}}
  }).then(updateLinkToReadStatus)
}

function updateLinkToReadStatus(link) {
  $(`tr[data-id=${link.id}]`).toggleClass("stroked").find(".read-status").text(link.read);
  $(`td[data-id=${link.id}]`).html(`<td data-id="${link.id}"><button type="button" name="button" class="button mark-as-unread">Mark as Unread</button></td>`)
}

function markAsUnread(e){
e.preventDefault()

  var linkId = $(this).parent().data("id")

  $.ajax({
    method: "PUT",
    url: `/api/v1/links/${linkId}`,
    data: {"link": {read: "false"}}
  }).then(updateLinkToUnreadStatus)
}

function updateLinkToUnreadStatus(link) {
  $(`tr[data-id=${link.id}]`).toggleClass("stroked").find(".read-status").text(link.read);
  $(`td[data-id=${link.id}]`).html(`<td data-id="${link.id}"><button type="button" name="button" class="button mark-as-read">Mark as Read</button></td>`)
}
