function breathClock(){
  this.readout = 0;
  this.inhale = false;
  this.exhale = true;
  this.inhaleLengths = [];
  this.exhaleLengths = [];
  this.intervalId = 0;
}

breathClock.prototype.hardStop = function(){
  console.log(this);
  clearInterval(this.intervalId);
}

breathClock.prototype.logAndRestart = function(){
  var timer = this;
  if( timer.inhale == true ){
    // debugger;
    clearInterval(timer.intervalId);
    timer.inhaleLengths.push(timer.stopClock());
    timer.inhale = false;
    timer.exhale = true;
    timer.intervalId = setInterval(function(){ timer.readout += .01}, 10 );
  } else {
    // debugger;
    clearInterval(timer.intervalId);
    timer.exhaleLengths.push(timer.stopClock());
    timer.exhale = false;
    timer.inhale = true;
    timer.intervalId = setInterval(function(){ timer.readout += 0.01}, 10 );
  }
}

breathClock.prototype.stopClock = function(){
  var length = parseFloat( this.readout.toFixed(2) );
  this.readout = 0;
  return length;
}

breathClock.prototype.lastExhale = function(){
  return this.exhaleLengths[this.exhaleLengths.length - 1]
}

breathClock.prototype.lastInhale = function(){
  return this.inhaleLengths[this.inhaleLengths.length - 1]
}

breathClock.prototype.longestInhale = function(){
  var max = 0;
  $.each(this.inhaleLengths, function(i, val){
    if( val > max ){
      max = val;
    }
  })
  return max
}

breathClock.prototype.longestExhale = function(){
  var max = 0;
  $.each(this.exhaleLengths, function(i, val){
    if( val > max ){
      max = val;
    }
  })
  return max
}

breathClock.prototype.meanInhale = function(){
  var total = 0;
  $.each(this.inhaleLengths , function() {
    total += this;
  });
  return parseFloat( (total/ this.inhaleLengths.length).toFixed(2))
}

breathClock.prototype.meanExhale = function(){
  var total = 0;
  $.each(this.exhaleLengths , function() {
    total += this;
  });
  console.log(total);
  return parseFloat( (total/ this.exhaleLengths.length).toFixed(2))
}

breathClock.prototype.updateStats = function(){
  $("#longest-inhale").text(this.longestInhale());
  $("#longest-exhale").text(this.longestExhale());
  $("#mean-inhale").text(this.meanInhale());
  $("#mean-exhale").text(this.meanExhale());
}









