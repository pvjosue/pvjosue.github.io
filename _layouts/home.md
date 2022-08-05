---
layout: archive
---
{% seo %}

<h1 class="page__title" itemprop="headline">About</h1>
<article class="text__description">
    {{ site.description }}
    <br>
    <br>
    My current research is oriented towards:
    <ul style="margin-top: 0; margin-bottom: 0;">    
        <li style="margin-top: 0; margin-bottom: 0;">Computational microscopy, adaptive optics, and real-time 3D microscopy.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Joint optimization of optical systems and reconstruction algorithms through Pytorch-based wave optics simulator. (see <a href="https://github.com/pvjosue/WaveBlocks">WaveBlocks</a>).</li>
        <li style="margin-top: 0; margin-bottom: 0;">Normalizing flows, Bayesian learning, deep learning. For solving inverse imaging problems, etc.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Working within an interdiciplinary team in real-life and inpactful projects.</li>
    </ul>
    <br>
    <br>
In my ongoing Ph.D., I built up intuition on Wave-Optics and machine learning algorithms, allowing me to complement the fluorescent microscope image formation model with Deep and Bayesian Learning.
<br>
<br>

Throughout my career, I had the chance to encounter complex challanges involving a variety of audio-visual, scientific, and industrial applications, frameworks, and ideas, with interdisciplinary and international teams. This allowed me to learn versatility and robustness when approaching new problems.

    <br>
    <br>
    Some of my skills and interest can be resumed by:
<ul style="margin-top: 0; margin-bottom: 0;">    
        <li style="margin-top: 0; margin-bottom: 0;">Lots of coding: C++, Python, other scripting languages, and GPU acceleration frameworks like CUDA and OpenCL.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Proficient in visual programming and 3D animation frameworks like TouchDesigner, Processing, VVVV, Cinema 4D, RealFlow, etc.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Plugin development for Micro-manager, Leap Motion, Cinema 4D, After effects, etc.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Complex audio-visual system integration, such as a structured-light-based calibration system for video-mapping applications (see <a href="https://www.visualma.com">Visualma</a>), interactive and real-time installations using Leap Motion, Kinect, Raspberry Pi, and many self-made sensing and computing tools.</li>
    </ul>

</article>
  
{% if site.use_paginator %}
    <h3 class="archive__subtitle">{{ site.data.ui-text[site.locale].recent_posts | default: "Recent Posts" }}</h3>
    {% if paginator %}
        {% assign posts = paginator.posts %}
    {% else %}
        {% assign posts = site.posts %}
    {% endif %}

    {% for post in posts %}
        {% include archive-single.html %}
    {% endfor %}

    {% include paginator.html %}
{% endif %}


<br>
{% if site.github-repos %}
<h1>Repositories</h1>
<div class="grid__wrapper">
{% for repo in site.github-repos %}
  <div class="github-card" data-github="{{repo.name}}" data-width="300em" data-height="" data-theme="default"></div>
{% endfor %}
</div>
<script src="/assets/github-cards/src/widget.js"></script>
{% endif %}
