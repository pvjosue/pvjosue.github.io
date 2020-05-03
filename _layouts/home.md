---
layout: archive
---
<h1 class="page__title" itemprop="headline">About</h1>
<article class="text__description">
    {{ site.description }}
    <br>
    <br>
    My main research interests are:
    <ul style="margin-top: 0; margin-bottom: 0;">    
        <li style="margin-top: 0; margin-bottom: 0;">3D real time microscopy and adaptive optics.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Wave Optics modeling of optical systems.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Deep learning aproches for solving inverse imaging problems.</li>
    </ul>
    <br>
    In the past year, I've explored the substitution of some parts of the Light-field imaging inverse problem with Deep-Learning. While doing this, I had the chance to learn Pytorch, and develop functions specific for higher dimensional data, needed for my research (LFMNet, convNd and fftNd).
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
{% if site.author.github-repos %}
<h1>Repositories</h1>
<div class="grid__wrapper">
{% for repo in site.author.github-repos %}
  <div class="github-card" data-github="{{repo.name}}" data-width="300em" data-height="" data-theme="default"></div>
{% endfor %}
</div>
<script src="assets/github-cards/src/widget.js"></script>
{% endif %}