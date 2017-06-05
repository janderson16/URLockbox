// new_link.js
function bindListenerAndCreateLink() {
  $("#create_new").click(function(event){
    event.preventDefault();
    if ($("#link-title").val().length == 0){
      alert("Title cannot be blank")
    }
    else{
      createLink()
    }
  })
}

$(document).ready(function(){
  bindListenerAndCreateLink()
})

function createLink() {
      var linkData = {
        link: {
                url: $("#link-url").val(),
                title: $("#link-title").val(),
                user_id: $("#link-user").val()
        }
      }
      $.ajax({
            url: "/api/v1/links",
            method: "POST",
            data: linkData
            })
            .success(function(link) {
                alert("Link successfully created")
                $("#links").prepend(link)
            })
            .fail(function(error) {
              alert("Please check that URL is a valid address")
            })
}
