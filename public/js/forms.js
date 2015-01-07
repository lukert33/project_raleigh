$(document).ready(function(){

  $(".content").on("submit", "form.get-form", function(event){
    event.preventDefault()
    var $target = $(event.target)
    var appendTo = $target.attr("appendTo")
    $.ajax({
      url: $target.attr("action"),
      type: "GET",
    }).always(function(){
      $target.children("input").prop("disabled",true)
    }).done(function(response){
      console.log("done GET")
      $target.closest(appendTo).replaceWith(response)
    }).fail(function(){
      console.log("GET request failed")
    })
  })

  $(".content").on("submit", "form.auth-form", function(event){
    event.preventDefault()
    var $target = $(event.target)
    var appendTo = $target.attr("appendTo")
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    }).done(function(response){
      console.log("done POST")
      $target.closest(appendTo).empty().append(response)
      $("#logout").toggle("fast")
    }).fail(function(){
      console.log("POST failed")
    }).always(function(){
      $target.children("input").prop("disabled",true)
    })
  })

  // $('.content').on("submit", "form.signup", function(event){
  //   event.preventDefault()
  //   var $target = $(event.target)
  //   $.ajax({
  //     url: $target.attr("action"),
  //     type: $target.attr("method"),
  //     data: $target.serialize()
  //   }).always(function(){
  //     $target.children("input").prop("disabled",true)
  //   }).done(function(response){
  //     console.log("done")
  //     $target.closest(".auth-box").empty().append(response)
  //     $("nav").children().toggle("slow")
  //   }).fail(function(){
  //     console.log("request failed")
  //   })
  // })

})
