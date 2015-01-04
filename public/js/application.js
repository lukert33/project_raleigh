$(document).ready(function() {
  $("#content").on("submit", "form.save-form", function(event){
    event.preventDefault();
    var $target = $(event.target)
    var entryType = target.attr("entry-type")
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    }).done(function(response){
      console.log("saved new "+entrType);
      //append to indicated element
    }).fail(function(response){
      console.log("failure: "+response)
    }).always(function(){
      $target.parent().toggle("slow")
    })
  })
});
