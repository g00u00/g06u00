#!/usr/bin/ruby
## hello1.cgi
#
puts "Content-Type: text/html"
puts
puts "
<!DOCTYPE html>
<html lang=""en"">
<head>  <meta charset=""utf-8"">
  <title>Hello World from Ruby</title>
  <link rel='stylesheet' href='../css/style.css'>
</head>

<body class=""ruby"">
  <div id=""container"">
    <div id=""main"" role=""main""  class=""hellobox"" >
        <header><a href=""../public_html/index.html"">HomePage</a></header>
    <h1>Hello World!</h1>
<h2>From Ruby 
"
puts RUBY_VERSION
puts "</h2>
   </div>
<nav>
	<ul>
    <li><a href='../public_html/index.html'>HTML</a></li>
		<li><a href=""../public_html/php.php"">PHP</a></li>
		<li><a href=""../cgi-bin/python.py"">Python</a></li>
		<li><a href=""../cgi-bin/perl.pl"">Perl</a></li>
		<li><a class=""active"" href=""../cgi-bin/ruby.rb"">ruby</a></li>
	</ul>    
</nav>
<footer>
<h4>This is an example page running Ruby on your Server.</h4> <p>You can create your own simple Ruby ""Hello World"" with this:</p>
<pre>#!/usr/bin/ruby
## hello1.cgi
#
puts &quot;Content-Type: text/html&quot;
puts
puts &quot;&lt;html&gt;&quot;
puts &quot;&lt;body&gt;&quot;
puts &quot;Hello, World from ruby!&quot;
puts &quot;&lt;/body&gt;&quot;
puts &quot;&lt;/html&gt;&quot;
#</pre>
</footer>
</div>
</body>
</html>
"
#
