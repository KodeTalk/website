{% extends "layout.html.tpl" %}

{% block title %}{{ post.title }}{% endblock %}
{% block content %}
<div class="post">
	<h2 class="title"><a href="#">{{ post.title }}</a></h2>
	<p class="meta">Posted by 
		<a href="#">{{ post.author.name }}</a> on {{ post.publishDate}} &nbsp;&bull;&nbsp;
		{% for category in post.categories %}
		  <a href="{{ category.url }}" class="permalink">{{ category.name | capitalize }}</a> 
	  {% endfor %}
	</p>
	<div class="entry">
		{{ post.body | raw }} 
	</div>
</div>
{% endblock %}