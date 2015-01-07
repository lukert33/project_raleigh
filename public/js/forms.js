$(document).ready(function(){
  $('.content').on("submit", "form.signup", function(event){
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    }).always(function(){
      $target.children("input").prop("disabled",true)
      debugger
    }).done(function(response){
      console.log("done")
      $target.closest(".auth-box").empty().append(response)
    }).fail(function(){
      console.log("request failed")
    })
  })

})
