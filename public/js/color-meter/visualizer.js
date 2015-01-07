function visualBehavior(vizDiv){
  this.$visualizer = vizDiv;
  this.red = 0;
  this.green = 0;
  this.blue = 0;
  this.alpha = 0.55;
  this.increase = true;
}

visualBehavior.prototype.toggleDirection = function(){
  if(this.increase){this.increase = false;
  } else {this.increase = true;}
}

visualBehavior.prototype.clockColors = function(clock){
  var newValue = Math.floor(clock.readout * 100);
  console.log(newValue);
 // Scale each color every 3 time units so as not to jump
  if(newValue <= 255){
    if(this.increase){
      this.red = newValue;
    } else{
      this.red = 255 - newValue;
    }
  } else if (newValue > 255 && newValue <= 510){
    if (this.increase){
      this.green = newValue - 255;
    } else{
      this.green = 255 - (newValue - 255);
    }
  } else if (newValue > 510 && newValue <= 765){
    if (this.increase){
      this.blue = newValue - 510;
    } else {
      this.blue = 255 - (newValue - 510);
    }
  }

}

visualBehavior.prototype.setColors = function(){
  this.$visualizer.css("background-color", "rgba("+this.red+","+this.green+","+this.blue+","+this.alpha+")")
}