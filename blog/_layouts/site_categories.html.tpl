{% extends "layout.html.tpl" %}

{% block title %}{{ siteCategory.name }}{% endblock %}
{% block content %}
	{% for post in siteCategory.posts %}
	<div class="post">
		<h2 class="title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
		<p class="meta">Posted by <a href="#">{{ post.author.name }}</a> on {{ post.publishDate }}
			&nbsp;&bull;&nbsp; <a href="{{ post.url }}" class="permalink">Full article</a></p>
		<div class="entry">
			{% if post.excerpt is null %}
		  	{{ post.body | raw }}
		  {% else %}
		  	{{ post.excerpt| raw }}
		  {% endif %}
		</div>
	</div>
	{% endfor %}
{% endblock %}
