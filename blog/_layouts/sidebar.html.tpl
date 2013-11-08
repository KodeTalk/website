<div id="sidebar">
	<ul>
		<li>
			<h2>Situs apa sih ini?</h2>
			<p>KodeTalk adalah sebuah kumpulan tulisan seputar web development dan programming. Let's talk about code here.</p>
		</li>
		<li>
			<h2>Kategori</h2>
			<ul>
				{% for category in site.categories %}
	      	<li><a href="{{ category.url }}">{{ category.name | capitalize }}</a></li>
	      {% endfor %}
			</ul>
		</li>							
	</ul>
</div>
<!-- end #sidebar -->