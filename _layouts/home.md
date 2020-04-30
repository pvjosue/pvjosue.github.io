---
layout: archive
---
<h2>About me</h2>
{{ site.description }}

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
<br>
<br>
<br>
<br>
<br>
{% if site.github-repos %}
<h2>Repositories</h2>
<div class="grid__wrapper">
{% for repo in site.github-repos %}
  <div class="github-card" data-github="pvjosue/{{repo.name}}" data-width="300em" data-height="" data-theme="default"></div>
{% endfor %}
</div>
<script src="assets/github-cards/src/widget.js"></script>
{% endif %}