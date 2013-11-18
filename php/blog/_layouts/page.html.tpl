{% extends "layout.html.tpl" %}

{% block title %}{{ page.title }}{% endblock %}
{% block content %}
<div class="post">
	<h2 class="title"><a href="#">{{ page.title }}</a></h2>
	<div class="entry">
		{{ page.body | raw }}  
	</div>
</div>
{% endblock %}