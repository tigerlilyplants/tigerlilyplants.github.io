---
layout: post
title:  "Winter bloomers in my collection"
tags: plants
---

<div class="slideshow" data-baseurl="{{ site.baseurl }}/images/">
  <button class="slide-nav prev" type="button" aria-label="Previous image">‹</button>

  <ul class="slides">
    {% loop_directory directory:images/2026-02-16 iterator:image filter:*.jpeg sort:descending %}
    <li class="slide is-active">
      <figure>
        <img data-src="{{ image }}" alt="{{ image | remove_last: ".jpeg" | replace "-" " " }}">
        <figcaption>{{ image | remove_last: ".jpeg" | replace "-" " " }}</figcaption>
      </figure>
    </li>
    {% endloop_directory %}
  </ul>

  <button class="slide-nav next" type="button" aria-label="Next image">›</button>
</div>

{{ page.last_modified_at }}