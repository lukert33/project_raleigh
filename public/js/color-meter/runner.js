$(document).ready(function() {
  var clock = new breathClock();
  var viz = new visualBehavior( $("#visualizer"));
  setInterval(function(){
    viz.clockColors(clock);
    viz.setColors();
  }, 100);

  var evalSuccess = function(redNum){
    if(redNum < 100 ){
      return true
    } else {return false}
  }

  Mousetrap.bind("space", function(event){
    event.preventDefault();
    clock.logAndRestart();
    viz.toggleDirection();
    setInterval(function(){
      $("#readout").text(clock.readout.toFixed(2));
    }, 100);
    clock.updateStats();
    $("#inhale").toggle();
    $("#exhale").toggle();
  })

  Mousetrap.bind("z", function(event){
    event.preventDefault()
    clock.hardStop()
    viz.setColors()
    clock.stopClock()
    var captured = $("#visualizer").css("background-color")
    $("#timer").css("background-color", captured).toggle(800)

    var $target = $("span.data")
    var result = {success: evalSuccess(viz.red)}
    $.ajax({
      url: "/user_challenge/"+$target.attr("challengeId"),
      type: "POST",
      data: result
    }).done( function(response){
      console.log("challenge result: "+result)
      $(".content").empty().append(response)
    })
  })

});
