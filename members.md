---
layout: page
title: Members
subitle: 
permalink: /members/
---

<ul>
{% for member in site.data.members %}
    <li>{{ member.name }}</li>
{% endfor %}
</ul>
