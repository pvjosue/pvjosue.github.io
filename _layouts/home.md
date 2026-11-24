---
layout: archive
---
{% seo %}

<h1 class="page__title" itemprop="headline">About</h1>
<article class="text__description">
    {{ site.description }}
    <br>
    <br>
    My current research and work is oriented towards:
    <ul style="margin-top: 0; margin-bottom: 0;">
        <li style="margin-top: 0; margin-bottom: 0;">Computational microscopy: learned 3D reconstruction, inverse problems, and 2D/3D deconvolution.</li>
        <li style="margin-top: 0; margin-bottom: 0;">GPU computing: custom CUDA kernels, multi-node PyTorch training, and inference optimization with TensorRT and Triton.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Open models and LLMs: fine-tuning, model serving, and agent-assisted scientific workflows.</li>
        <li style="margin-top: 0; margin-bottom: 0;">Differentiable optics: joint optimization of optical systems and reconstruction algorithms through Python-based simulators (see <a href="https://github.com/pvjosue/WaveBlocks">WaveBlocks</a>).</li>
        <li style="margin-top: 0; margin-bottom: 0;">Collaborating with international labs in the life sciences.</li>
    </ul>
    <br>
    <br>
    I completed my PhD at TUM (2018–2023) on real-time learned light-field microscopy, with research visits at the University of Bern and the Marine Biological Laboratory in Woods Hole. At Carl Zeiss Microscopy I take GPU-accelerated imaging software from research prototype to released product, working across CUDA, C#, and Python with application scientists and customers.

    <br>
    <br>
    Earlier in my career I built real-time audio-visual and interactive systems, including a structured-light video-mapping system for <a href="https://www.visualma.com">Visualma</a>, Leap Motion and Kinect installations. My main languages are Python, C++, C#, CUDA, and MATLAB.
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
