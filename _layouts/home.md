---
layout: archive
---
<h1 class="page__title" itemprop="headline">About</h1>
<article class="text__description">
    {{ site.description }}
    <br>
    <br>
    My main research interests are:
    <ul>    
        <li>3D real time microscopy and adaptive optics.</li>
        <li>Wave Optics modeling of optical systems.</li>
        <li>Deep learning aproches for solving inverse imaging problems.</li>
    </ul>
    In the past year, I've explored the computational advantages of substituting some parts of the Light-field inverse problem with Deep-Learning. While doing this, I had the chance to learn Pytorch, and to create functions specific for higher dimensional data, needed for my research (LFMNet, convNd and fftNd, see repos. at the bottom).
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

<meta name="gc:base" content="assets/github-cards/">

<br>
{% if site.github-repos %}
<h1>Repositories</h1>
<div class="grid__wrapper">
{% for repo in site.github-repos %}
  <div class="github-card" data-github="pvjosue/{{repo.name}}" data-width="300em" data-height="" data-theme="default"></div>
{% endfor %}
</div>
<script src="assets/github-cards/src/widget.js"></script>
{% endif %}