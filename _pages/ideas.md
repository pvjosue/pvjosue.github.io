---
layout: archive
title: "Ideas"
permalink: /ideas/
author_profile: true
---

{% for post in site.ideas reversed %}
  {% include archive-single.html %}
{% endfor %}