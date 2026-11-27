---
layout: archive
title: "Visuelle Kunst"
permalink: /ideas/
author_profile: true
---
<script type="text/javascript" src="../assets/processing/processingNew.js"></script>

<div class="ideas-page" markdown="0">
<style>
  @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;1,400&display=swap");

  /* the theme's page title ("Visuelle Kunst") sits above the hero; the hero carries the heading instead */
  .page__title { display: none; }

  .ideas-page {
    --ip-bg: #0E0D0B;
    --ip-ink: #F2EDE4;
    --ip-mut: #A79F92;
    --ip-soft: #DCD5C8;
    --ip-card: #16140F;
    --ip-line: rgba(242, 237, 228, 0.14);
    --ip-gold: #C9A96E;
    --ip-gold-hi: #E3C995;
    /* padding, not margin: the theme's margins collapse into the page and don't clear the sticky header */
    padding-top: 4rem;
    margin-bottom: 4rem;
    font-family: "Helvetica Neue", Arial, sans-serif;
  }

  .ideas-page h1,
  .ideas-page h2,
  .ideas-page h3 {
    font-family: "Cormorant Garamond", "Iowan Old Style", Georgia, serif;
    font-weight: 500;
    letter-spacing: 0.005em;
    line-height: 1.12;
    margin: 0;
  }

  .ideas-page a { text-underline-offset: 0.15em; }

  .ideas-page,
  .ideas-page * { min-width: 0; }

  /* widen the page beyond the theme's narrow column on large screens, as the intro used to */
  @media (min-width: 64em) {
    .ideas-page { margin-right: -120px; }
  }

  @media (min-width: 80em) {
    .ideas-page { margin-right: -240px; }
  }

  .ip-eyebrow {
    display: inline-block;
    color: var(--ip-gold);
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 0.22em;
    text-transform: uppercase;
  }

  /* ---------- Hero ---------- */
  .ip-hero {
    position: relative;
    display: flex;
    align-items: flex-end;
    min-height: clamp(420px, 70vh, 560px);
    overflow: hidden;
    border-radius: 2px;
    background: var(--ip-bg);
    color: var(--ip-ink);
  }

  .ip-sketch {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    display: block;
    cursor: crosshair;
  }

  .ip-shade {
    position: absolute;
    inset: 0;
    pointer-events: none;
    background:
      linear-gradient(90deg, rgba(14, 13, 11, 0.8) 0%, rgba(14, 13, 11, 0.2) 65%),
      linear-gradient(180deg, rgba(14, 13, 11, 0.2) 0%, rgba(14, 13, 11, 0.05) 35%, var(--ip-bg) 100%);
  }

  .ip-hero-copy {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 760px;
    box-sizing: border-box;
    padding: 72px clamp(20px, 4vw, 44px) 40px;
    pointer-events: none;
  }

  .ip-hero h1 {
    margin: 0.35em 0 0.3em;
    font-size: clamp(2.3rem, 6vw, 4.4rem);
    line-height: 1.02;
    text-shadow: 0 2px 24px rgba(0, 0, 0, 0.35);
  }

  .ip-hero p {
    margin: 0 0 1.25rem;
    max-width: 34em;
    color: var(--ip-soft);
    font-size: 1.02rem;
    line-height: 1.6;
  }

  .ip-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    pointer-events: auto;
  }

  .ip-btn {
    display: inline-block;
    padding: 0.65rem 1.15rem;
    border: 1px solid var(--ip-gold);
    border-radius: 999px;
    background: var(--ip-gold);
    color: #0E0D0B;
    font-size: 0.92rem;
    font-weight: 600;
    text-decoration: none;
    transition: background 0.2s ease, color 0.2s ease;
  }

  .ip-btn:hover,
  .ip-btn:focus-visible { background: var(--ip-gold-hi); border-color: var(--ip-gold-hi); color: #0E0D0B; }

  .ip-btn--ghost {
    background: transparent;
    border-color: rgba(242, 237, 228, 0.4);
    color: var(--ip-ink);
  }

  .ip-btn--ghost:hover,
  .ip-btn--ghost:focus-visible {
    background: rgba(242, 237, 228, 0.08);
    border-color: var(--ip-ink);
    color: var(--ip-ink);
  }

  /* ---------- Sections ---------- */
  .ip-section { margin: clamp(3rem, 7vw, 5rem) 0; }

  .ip-section-head { margin-bottom: 1.5rem; }

  .ip-section-head .ip-eyebrow { color: #8A6D3B; }
  html.dark-mode .ip-section-head .ip-eyebrow { color: var(--ip-gold); }

  .ip-section-head h2 { font-size: clamp(2rem, 4vw, 2.8rem); }

  /* reel */
  .ip-reel {
    padding: clamp(12px, 2vw, 18px);
    border: 1px solid var(--ip-line);
    border-radius: 2px;
    background: var(--ip-card);
  }

  .ip-reel iframe {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 9;
    border: 0;
  }

  .ip-reel-caption {
    margin: 0.75rem 0 0;
    color: var(--ip-mut);
    font-size: 0.85rem;
  }

  /* services */
  .ip-services {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .ip-service {
    position: relative;
    min-width: 0;
    padding: 28px 26px 24px;
    border: 1px solid var(--ip-line);
    border-top: 2px solid var(--accent, var(--ip-gold));
    border-radius: 2px;
    background: var(--ip-card);
    color: var(--ip-ink);
    transition: border-color 0.2s ease, transform 0.2s ease;
  }

  /* each card's accent is set on its <li>; the card inherits it */
  .ip-services > .ip-service--events { grid-column: auto; --accent: #8FB8A6; }
  .ip-services > .ip-service--sports { grid-column: auto; --accent: #D08C6B; }
  .ip-services > .ip-service--custom { grid-column: 1 / -1; --accent: #C9A96E; }
  .ip-services > li { min-width: 0; display: flex; }
  .ip-services > li > .ip-service { flex: 1; }

  .ip-service h3 {
    margin: 0.4rem 0 0.6rem;
    font-size: 1.7rem;
  }

  .ip-service p {
    margin: 0 0 0.9rem;
    color: var(--ip-mut);
    font-size: 0.95rem;
    line-height: 1.55;
  }

  .ip-service .ip-eyebrow { color: var(--accent); font-size: 0.68rem; }

  .ip-service-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 0.4rem;
    margin: 0.2rem 0 0.9rem;
  }

  .ip-service-tags span {
    padding: 0.2rem 0.6rem;
    border: 1px solid var(--ip-line);
    border-radius: 999px;
    color: var(--ip-soft);
    font-size: 0.74rem;
  }

  .ip-service-cta {
    color: var(--accent);
    font-size: 0.88rem;
    font-weight: 600;
  }

  a.ip-service {
    display: block;
    text-decoration: none;
  }

  a.ip-service:hover,
  a.ip-service:focus-visible {
    border-color: var(--accent);
    border-top-color: var(--accent);
    transform: translateY(-2px);
  }


  /* contact call to action, after the services */
  .ip-cta {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    gap: 24px;
    padding: clamp(28px, 5vw, 52px);
    border: 1px solid var(--ip-line);
    border-radius: 2px;
    background:
      radial-gradient(circle at 100% 0%, rgba(201, 169, 110, 0.22), transparent 45%),
      var(--ip-card);
    color: var(--ip-ink);
  }

  .ip-cta h2 { margin: 0.35em 0 0.3em; font-size: clamp(2rem, 4.5vw, 3rem); }

  .ip-cta p {
    margin: 0;
    max-width: 30em;
    color: var(--ip-mut);
    font-size: 0.98rem;
  }

  .ip-cta-actions {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }

  .ip-cta-email {
    color: var(--ip-soft);
    font-size: 0.9rem;
  }

  /* processing sketches */
  .ip-tabs {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 14px;
  }

  .ip-tabs button {
    padding: 0.45rem 0.95rem;
    border: 1px solid var(--ip-line);
    border-radius: 999px;
    background: transparent;
    color: inherit;
    font: inherit;
    font-size: 0.88rem;
    cursor: pointer;
    transition: background 0.2s ease, border-color 0.2s ease;
  }

  .ip-tabs button:hover { border-color: var(--ip-gold); }

  .ip-tabs button.active {
    background: var(--ip-gold);
    border-color: var(--ip-gold);
    color: #0E0D0B;
  }

  .ip-tabcontent {
    display: none;
    padding: clamp(12px, 2vw, 18px);
    border: 1px solid var(--ip-line);
    border-radius: 2px;
    background: var(--ip-card);
    color: var(--ip-ink);
  }

  .ip-tabcontent h3 { margin-bottom: 0.8rem; font-size: 1.5rem; }

  .ip-tabcontent canvas {
    display: block;
    width: 100%;
    height: 100%;
    cursor: pointer;
  }

  .ip-tabcontent p {
    margin: 0.75rem 0 0;
    color: var(--ip-mut);
    font-size: 0.85rem;
  }

  /* previous works */
  .ip-archive {
    padding: clamp(28px, 4vw, 40px);
    border: 1px dashed var(--ip-line);
    border-radius: 2px;
    color: var(--ip-mut);
  }

  .ip-archive p { margin: 0.4rem 0 0; }

  @media (max-width: 860px) {
    .ip-services { grid-template-columns: 1fr; }
    .ip-services > li { grid-column: auto; }
  }

  @media (max-width: 700px) {
    .ip-hero { min-height: 400px; }
  }

  /* light mode: links in a warm bronze, and the hero inverted to a light field with dark type */
  :where(.ideas-page) a { color: #8A6D3B; }
  .ip-service-cta { color: var(--accent); }
  .ip-cta-email { color: var(--ip-soft); }
  html:not(.dark-mode) .ideas-page .ip-hero { background: #F3F6F6; }
  html:not(.dark-mode) .ideas-page .ip-shade {
    background:
      linear-gradient(90deg, rgba(243, 246, 246, 0.85) 0%, rgba(243, 246, 246, 0.2) 65%),
      linear-gradient(180deg, rgba(243, 246, 246, 0.2) 0%, rgba(243, 246, 246, 0.05) 35%, #F3F6F6 100%);
  }
  html:not(.dark-mode) .ideas-page .ip-hero h1 { color: #17272b; text-shadow: none; }
  html:not(.dark-mode) .ideas-page .ip-hero p { color: #2E3D40; }
  html:not(.dark-mode) .ideas-page .ip-hero .ip-eyebrow { color: #8A6D3B; }
  html:not(.dark-mode) .ideas-page .ip-btn--ghost { color: #17272b; border-color: rgba(23, 39, 43, 0.4); }
  html:not(.dark-mode) .ideas-page .ip-btn--ghost:hover,
  html:not(.dark-mode) .ideas-page .ip-btn--ghost:focus-visible { color: #17272b; background: rgba(23, 39, 43, 0.06); border-color: #17272b; }

  /* dark mode only: the theme's teal link colour was overriding the button text */
  html.dark-mode .ideas-page a { color: var(--ip-gold-hi); }
  html.dark-mode .ideas-page .ip-btn,
  html.dark-mode .ideas-page .ip-btn:hover,
  html.dark-mode .ideas-page .ip-btn:focus-visible { color: #0E0D0B; }
  html.dark-mode .ideas-page .ip-btn--ghost,
  html.dark-mode .ideas-page .ip-btn--ghost:hover,
  html.dark-mode .ideas-page .ip-btn--ghost:focus-visible { color: var(--ip-ink); }
  html.dark-mode .ideas-page .ip-service-cta { color: var(--accent); }
  html.dark-mode .ideas-page .ip-section-head .ip-eyebrow { color: #F6D9A8; }
  html.dark-mode .ideas-page .ip-section-head h2 { color: #FBF7EF; font-weight: 600; }
  html.dark-mode .ideas-page .ip-service h3 { color: #FFFFFF; font-weight: 600; }
  html.dark-mode .ideas-page .ip-service--events .ip-eyebrow { color: #B5DCC9; }
  html.dark-mode .ideas-page .ip-service--sports .ip-eyebrow { color: #F0A87F; }
  html.dark-mode .ideas-page .ip-cta-email { color: var(--ip-soft); }
  html.dark-mode .ideas-page .ip-tabs button.active { color: #0E0D0B; }
  html.dark-mode .ideas-page .ip-archive a { color: var(--ip-gold-hi); }

  @media (prefers-reduced-motion: reduce) {
    .ip-service,
    .ip-btn,
    .ip-tabs button { transition: none; }
  }
</style>

<div class="ideas-page-inner">

<header class="ip-hero">
  <canvas class="ip-sketch" data-processing-sources="/_project_proposals/_events/sketches/proc_network_banner.pde" aria-hidden="true"></canvas>
  <div class="ip-shade" aria-hidden="true"></div>
  <div class="ip-hero-copy">
    <span class="ip-eyebrow">Visuelle Kunst · Visual arts · Creative technology</span>
    <h1>Light, sound and movement, shaped around your ideas</h1>
    <p>I'm Josue, a visual artist, researcher and creative technologist. I turn code, sensors and real-time graphics into live visuals and interactive experiences.</p>
    <div class="ip-actions">
      <a class="ip-btn" href="#services">See services</a>
      <a class="ip-btn ip-btn--ghost" href="#contact">Get in touch</a>
    </div>
  </div>
</header>

<section class="ip-section" aria-labelledby="ip-reel-title">
  <div class="ip-section-head">
    <span class="ip-eyebrow">Showreel</span>
    <h2 id="ip-reel-title">Recent work in motion</h2>
  </div>
  <div class="ip-reel">
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

<section class="ip-section" id="services" aria-labelledby="ip-services-title">
  <div class="ip-section-head">
    <span class="ip-eyebrow">Available for</span>
    <h2 id="ip-services-title">Services</h2>
  </div>
  <ul class="ip-services">
    <li class="ip-service--events">
      <a class="ip-service ip-service--events" href="/_project_proposals/_events/index.html">
        <span class="ip-eyebrow">Events</span>
        <h3>Events and audiovisual installations</h3>
        <p>Light, sound and movement for product launches, gatherings and interactive spaces.</p>
        <div class="ip-service-tags">
          <span>Product launches</span>
          <span>Gatherings</span>
          <span>Installations</span>
        </div>
        <span class="ip-service-cta">Explore the events page →</span>
      </a>
    </li>
    <li class="ip-service--sports">
      <a class="ip-service ip-service--sports" href="/_project_proposals/_bouldering/index.html">
        <span class="ip-eyebrow">Sports</span>
        <h3>Sports events and presentations</h3>
        <p>Bring athlete introductions, live event moments and sports presentations to life with real-time interactive visuals.</p>
        <span class="ip-service-cta">Explore bouldering projects →</span>
      </a>
    </li>
  </ul>
</section>

<section class="ip-section" id="contact" aria-labelledby="ip-contact-title">
  <div class="ip-cta">
    <div>
      <span class="ip-eyebrow">Have a project in mind?</span>
      <h2 id="ip-contact-title">Let's build something together</h2>
      <p>Tell me about the space, the audience and the moment you want to create, and we'll shape it from there.</p>
    </div>
    <div class="ip-cta-actions">
      <a class="ip-btn" href="https://mail.google.com/mail/?view=cm&amp;fs=1&amp;to=visuelle.kunst.jpv@gmail.com&amp;su=Visual%20arts%20project%20inquiry" target="_blank" rel="noopener noreferrer">Get in touch</a>
      <a class="ip-cta-email" href="mailto:visuelle.kunst.jpv@gmail.com">visuelle.kunst.jpv@gmail.com</a>
    </div>
  </div>
</section>

<section class="ip-section" aria-labelledby="ip-previous-title">
  <div class="ip-section-head">
    <span class="ip-eyebrow">Vimeo archive · pre-2015</span>
    <h2 id="ip-previous-title">Previous works</h2>
  </div>
  <div class="ip-archive">
    <p>Selected videos from my years at <a href="https://visualma.com/">Visualma</a>, mostly from before 2015, will be collected here.</p>
    <p>Selected work coming soon.</p>
  </div>
</section>

<section class="ip-section" aria-labelledby="ip-sketches-title">
  <div class="ip-section-head">
    <span class="ip-eyebrow">Processing sketches</span>
    <h2 id="ip-sketches-title">Sketches from the beginning</h2>
    <p style="color: var(--ip-mut); margin-top: 0.75rem; max-width: 44em;">Back in 2011 a good friend introduced <a href="https://processing.org/">Processing</a>, a visual and interactive programming framework based on Java. It helped me to develop my programming skills in an intuitive way, and got one of my sketches (Fractal 3D) to the front page of <a href="https://www.openprocessing.org">OpenProcessing.org</a>. Here are some of my sketches from back then.</p>
  </div>

  <div class="ip-tabs" role="tablist">
    <button class="tablinks" onclick="openSketch(event, 'merolek')">Curves</button>
    <button class="tablinks" onclick="openSketch(event, 'mandala_cuadros')">Mandala squares</button>
    <button class="tablinks" onclick="openSketch(event, 'fractal_3D')">Fractal 3D</button>
    <button id="default_tab" class="tablinks" onclick="openSketch(event, 'dancing_cubes_3D')">Dancing Cubes 3D</button>
  </div>

  <div id="merolek" class="ip-tabcontent">
    <h3>Curves by lines</h3>
    <canvas id="processing_canvas_1" data-processing-sources="merolek.pde" style="width: 100%; height: 100%;" resize></canvas>
    <p>Click on the sketch and use the arrow keys for interaction.</p>
  </div>

  <div id="fractal_3D" class="ip-tabcontent">
    <h3>Fractal 3D</h3>
    <canvas id="processing_canvas_2" data-processing-sources="proc_cubes_3D.pde" style="width: 100%; height: 100%;" resize></canvas>
  </div>

  <div id="dancing_cubes_3D" class="ip-tabcontent">
    <h3>Dancing Cubes 3D</h3>
    <canvas id="processing_canvas_3" data-processing-sources="dancing_cubes_3D.pde" style="width: 100%; height: 100%;" resize></canvas>
  </div>

  <div id="mandala_cuadros" class="ip-tabcontent">
    <h3>Mandala squares</h3>
    <canvas id="processing_canvas_4" data-processing-sources="mandala_cuadros.pde" style="width: 100%; height: 100%;" resize></canvas>
    <p>Click the mouse to erase, and control the size of circles and squares with the mouse position.</p>
  </div>
</section>

</div>

<script>
  function openSketch(evt, name) {
    var panels = document.querySelectorAll(".ip-tabcontent");
    for (var i = 0; i < panels.length; i++) { panels[i].style.display = "none"; }
    var tabs = document.querySelectorAll(".ip-tabs button");
    for (var j = 0; j < tabs.length; j++) { tabs[j].classList.remove("active"); }
    document.getElementById(name).style.display = "block";
    evt.currentTarget.classList.add("active");
  }

  document.getElementById("default_tab").click();

  function goFullscreen(e) {
    var el = e.currentTarget;
    if (el.requestFullscreen) { el.requestFullscreen(); }
    else if (el.webkitRequestFullScreen) { el.webkitRequestFullScreen(); }
  }

  ["processing_canvas_1", "processing_canvas_2", "processing_canvas_3", "processing_canvas_4"].forEach(function (id) {
    document.getElementById(id).addEventListener("dblclick", goFullscreen);
  });

  // the hero banner only animates while it is on screen, so it doesn't compete with scrolling
  (function () {
    var hero = document.querySelector(".ip-sketch");
    if (!hero || !("IntersectionObserver" in window)) return;

    function apply(visible, attempts) {
      var inst = hero.id && Processing.getInstanceById(hero.id);
      if (!inst) {
        // Processing.js attaches to the canvas a little after load: try again shortly
        if (attempts < 20) { setTimeout(function () { apply(visible, attempts + 1); }, 150); }
        return;
      }
      if (visible) { inst.loop(); } else { inst.noLoop(); }
    }

    window.addEventListener("load", function () {
      new IntersectionObserver(function (entries) {
        apply(entries[entries.length - 1].isIntersecting, 0);
      }).observe(hero);
    });
  })();
</script>
</div>

{% seo %}
