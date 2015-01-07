$(document).ready(function() {
  $(".content").on("click", ".turn-page", function(event){
    event.preventDefault()
    var $target = $(event.target).closest("a")
    $.ajax({
      url: $target.attr("href")
    }).done(function(response){
      console.log("turned a page")
      $(".content").empty().append(response)
    }).fail(function(){
      console.log("GET page/challenge error")
    })
  })

  $(".content").on("click", "#reveal-next", function(event){
    event.preventDefault()
    $("#next-page").submit();
  })

});
