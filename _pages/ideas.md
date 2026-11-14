---
layout: archive
title: "Visuelle Kunst"
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

.page__title {
  display: none;
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



<div class="visual-arts-page">
  <section class="visual-arts-page__intro" aria-labelledby="visual-arts-title">
    <h1 id="visual-arts-title" class="visual-arts-page__eyebrow visual-arts-page__title">Visuelle Kunst / Visual Arts / Creative technology</h1>
    <div>
      <h2 id="visual-arts-about">Who am I?</h2>
      <p class="visual-arts-page__lead">I'm Josue, a visual artist, researcher and creative technologist. I turn code, sensors, and real-time graphics into live visuals and interactive experiences.</p>
    </div>
    <div class="visual-arts-page__video-slot">
      <span class="visual-arts-page__eyebrow">YouTube demoreel</span>
      <iframe
        src="https://www.youtube-nocookie.com/embed/QGxa51aDbSg"
        title="Josue's visual arts demo reel"
        loading="lazy"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        referrerpolicy="strict-origin-when-cross-origin"
        allowfullscreen>
      </iframe>
    </div>
  </section>

  <section class="visual-arts-page__section" aria-labelledby="visual-arts-services">
    <p class="visual-arts-page__contact">
      Have a project in mind?
      <a class="visual-arts-page__contact-button" href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;to=visuelle.kunst.jpv@gmail.com&amp;su=Visual%20arts%20project%20inquiry" target="_blank" rel="noopener noreferrer">Get in touch</a>
      <span>or email <a class="visual-arts-page__contact-email" href="mailto:visuelle.kunst.jpv@gmail.com">visuelle.kunst.jpv@gmail.com</a></span>
    </p>
    <div class="visual-arts-page__section-heading">
      <p class="visual-arts-page__eyebrow">Available for</p>
      <h2 id="visual-arts-services">Services</h2>
    </div>
    <ul class="visual-arts-page__services">
      <li class="visual-arts-page__service--featured">
        <h3>Sports events and presentations</h3>
        <p>Bring athlete introductions, live event moments, and sports presentations to life with real-time interactive visuals.</p>
      </li>
      <li>
        <h3>Interactive live shows</h3>
        <p>Real-time visuals shaped by performers, music, sports and audience input.</p>
      </li>
      <li>
        <h3>Sensor integration</h3>
        <p>Connect movement and other live signals to responsive visuals.</p>
      </li>
      <li>
        <h3>Interactive installations</h3>
        <p>Build hands-on experiences for galleries, public spaces, and events.</p>
      </li>
      <li>
        <h3>Weddings and celebrations</h3>
        <p>Create custom visuals and interactive moments for your event.</p>
      </li>
      <li>
        <h3>Custom commissions</h3>
        <p>From one-off event visuals to ideas that need a custom setup.</p>
      </li>
    </ul>
  </section>

  <section class="visual-arts-page__previous" aria-labelledby="visual-arts-previous">
    <div>
      <p class="visual-arts-page__eyebrow">Vimeo archive / pre-2015</p>
      <h2 id="visual-arts-previous">Previous works</h2>
      <p>Selected videos from my years at <a href="https://visualma.com/">Visualma</a>, mostly from before 2015, will be collected here.</p>
    </div>
    <div class="visual-arts-page__archive-slot">
      <span class="visual-arts-page__eyebrow">Vimeo videos</span>
      <p>Selected work coming soon</p>
    </div>
  </section>
</div>

## Processing Sketches
Back in 2011 a good friend introduced [Processing](https://processing.org/), a visual and interactive programming framework based on Java. It helped me to develop my programming skills in an intuitive way. Even getting one of my sketches (Fractal 3D) to the front page of [OpenProcessing.org](https://www.openprocessing.org).
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


{% comment %}
## NFTs
### CNFT on Cardano network
* ChaoticSynchrony: 
  - [pull request](https://github.com/Cardano-NFTs/policyIDs/pull/3544)
  - policy id: "734cdbdd40617395a7fcaeb76780b7a2349fd779fd222eb3bdd7ef91"
{% endcomment %}

<script>
  document.getElementById("default_tab").click()
  console.log('clicked')

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