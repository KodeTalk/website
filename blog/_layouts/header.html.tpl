<div id="menu-wrapper">
  <div id="menu">
    <ul>
      {% for page in site.pages %}
        <li><a href="{{ page.url }}">{{ page.title | capitalize }}</a></li>
      {% endfor %}
    </ul>
  </div>
</div>
<!-- end #menu -->
<div id="banner"><img src="{{ site.url }}images/banner.jpg" width="940" height="300" alt="" /></div>