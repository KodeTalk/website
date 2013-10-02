<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : ExtremeSurfing
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120225

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>{% block title %}{% endblock %} - {% block tagline %}{% endblock %}</title>
<link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
<link href="{{ site.url }}css/style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
  <div id="page">
    <div id="page-bgtop">
      <div id="page-bgbtm">
        <div id="page-content">
          <div id="header-wrapper">
            <div id="header">
              <div id="logo">
                <h1><a href="#">{{ site.title }}</a></h1>
                <p>{{ site.tagline }}</p>
              </div>
            </div>
          </div>
          <!-- end #header -->
          {% include "header.html.tpl" %}

          <div id="content">
            {% block content %}{% endblock %}
            <div style="clear: both;">&nbsp;</div>
          </div>
          <!-- end #content -->
          {% include "sidebar.html.tpl" %}
        </div>
        <div style="clear: both;">&nbsp;</div>
      </div>
    </div>
  </div>
  <!-- end #page -->
</div>
{% include "footer.html.tpl" %}
<!-- end #footer -->
</body>
</html>
