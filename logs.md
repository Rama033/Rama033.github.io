---
layout: page
title: "Logs"
permalink: /Logs/
main_nav: true
---

{% for category in site.categories %}
  {% capture cat %}{{ category | first }}{% endcapture %}
  <h2 id="{{cat}}">{{ cat | capitalize }}</h2>
  <ul class="posts-list">
  {% for post in site.categories[cat] %}
    <li>
      <strong>
        <a href="{{ log.url | prepend: site.baseurl }}">{{ log.title }}</a>
      </strong>
      <span class="log-date">- {{ log.date | date_to_long_string }}</span>
    </li>
  {% endfor %}
  </ul>
  {% if forloop.last == false %}<hr>{% endif %}
{% endfor %}
<br>
