{% extends "layout.html.tpl" %}

{% block title %}{{ post.title }}{% endblock %}

{% block commentmoderator %}
<meta property="fb:admins" content="1055293652"/>
{% endblock %}

{% block fbroot %}
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=666602906704347";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
{% endblock %}

{% block content %}
<div class="post">
	<h2 class="title"><a href="#">{{ post.title }}</a></h2>
	<p class="meta">Posted by 
		<a href="{{ post.author.url }}">{{ post.author.name }}</a> on {{ post.publishDate}} &nbsp;&bull;&nbsp;
		{% for category in post.categories %}
		  <a href="{{ category.url }}" class="permalink">{{ category.name | capitalize }}</a> 
	  {% endfor %}
	</p>
	<p>
		<!-- AddThis Button BEGIN -->
		<div class="addthis_toolbox addthis_default_style ">
		<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
		<a class="addthis_button_tweet"></a>
		<a class="addthis_button_pinterest_pinit" pi:pinit:layout="horizontal"></a>
		<a class="addthis_counter addthis_pill_style"></a>
		</div>
		<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-527f6c395e605571"></script>
		<!-- AddThis Button END -->
	</p>
	<div class="entry">
		{{ post.body | raw }} 
	</div>
	<hr>
	<p>
		<strong>Komentar</strong>
	</p>
	<p>
		<div class="fb-comments" data-href="http://kodetalk.com{{ post.url }}" data-numposts="5" data-width="600"></div>
	</p>


</div>
{% endblock %}