---
layout: archive
title: "Ideas"
permalink: /ideas/
author_profile: true
---
<style scoped>
    /* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>

<script>
    function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
    }
</script>



<script type="text/javascript" src="../assets/processing/processingNew.js"></script>



## Processing Sketches
Back in 2011 a good friend introduced [Processing](https://processing.org/), a visual and interactive programing framework based on Java. It helped me to develop my programing skills in an intuitive way. Even getting one of my sketches (Fractal 3D) to the front page of [OpenProcessing.org](https://www.openprocessing.org).
Here are some of my sketches from back then.
<!-- Tab links -->
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'merolek')">Curves</button>
  <button class="tablinks" onclick="openCity(event, 'mandala_cuadros')">Mandala squares</button>
  <button class="tablinks" onclick="openCity(event, 'fractal_3D')">Fractal 3D</button>
  <button id="default_tab" class="tablinks active" onclick="openCity(event, 'dancing_cubes_3D')">Dancing Cubes 3D</button>
</div>

<!-- Tab content -->
<div id="merolek" class="tabcontent">
    <h3 id="sketch_title">Curves by lines</h3>
    <canvas id="processing_canvas_1" data-processing-sources="merolek.pde" style="width:  100%; height: 100%; border-style: solid;" resize></canvas>
    <br>
    Click on the sketch and use <i class="fa fa-arrow-up"></i> and <i class="fa fa-arrow-down"></i> keys for interaction.
</div>

<div id="fractal_3D" class="tabcontent">
  <h3 id="sketch_title">Fractal 3D</h3>
    <canvas id="processing_canvas_2" data-processing-sources="proc_cubes_3D.pde" style="width:  100%; height: 100%; border-style: solid;" resize></canvas>
</div>

<div id="dancing_cubes_3D" class="tabcontent">
  <h3 id="sketch_title">Dancing Cubes 3D</h3>
    <canvas id="processing_canvas_3" data-processing-sources="dancing_cubes_3D.pde" style="width:  100%; height: 100%; border-style: solid; " resize></canvas>
</div>

<div id="mandala_cuadros" class="tabcontent">
  <h3 id="sketch_title">Mandala squares</h3>
    <canvas id="processing_canvas_4" data-processing-sources="mandala_cuadros.pde" style="width:  100%; height: 100%; border-style: solid;" resize></canvas>
    <br>
    Click mouse to erase. And control size of circles and squares with mouse position.
</div>


<script>
  document.getElementById("default_tab").click()
  console.log('clicled')

  // Get the canvas element form the page
  var canvas = document.getElementById('processing_canvas');
  
  function fullscreen(){
    var el = document.getElementById(this.id);

    if(el.webkitRequestFullScreen) {
        el.webkitRequestFullScreen();
    }
    else {
      el.mozRequestFullScreen();
    }            
  }
  
  document.getElementById('processing_canvas_1').addEventListener("click",fullscreen)
  document.getElementById('processing_canvas_2').addEventListener("click",fullscreen)
  document.getElementById('processing_canvas_3').addEventListener("click",fullscreen)
  document.getElementById('processing_canvas_4').addEventListener("click",fullscreen)

</script>


{% seo %}