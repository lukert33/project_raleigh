$(document).ready(function() {
  var clock = new breathClock();
  var viz = new visualBehavior( $("#visualizer"));
  setInterval(function(){
    viz.clockColors(clock);
    viz.setColors();
  }, 100);

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
    event.preventDefault();
    clock.hardStop();
    $(".statbox").toggle("slow");
  })

});
