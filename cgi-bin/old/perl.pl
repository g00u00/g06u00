#!/usr/bin/perl -w
print "Content-Type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html lang=\"en\">

<head>  
    <meta charset="utf-8">
  <title>Hello World from Per</title>
  <link rel="stylesheet" href="../css/style.css">
</head>

<body class="perl">
  <div id="container">
    <div id="main" role="main"  class="hellobox" >
        <header><a href="../public_html/index.html">HomePage</a></header>
    <h1>Hello World!</h1>  
    <h2>From Perl $^V</h2>
   </div>
<nav>
	<ul>
    <li><a href="../public_html/index.html">HTML</a></li>
		<li><a href=\"../public_html/php.php\">PHP</a></li>
		<li><a href=\"../cgi-bin/python.py\">Python</a></li>
		<li><a class=\"active\" href=\"../cgi-bin/perl.pl\">Perl</a></li>
		<li><a href=\"../cgi-bin/ruby.rb\">ruby</a></li>
	</ul>    
</nav>
<footer>
<h4>This is an example page running Perl on your Koding Server.</h4> 
<p>You can create your own simple Perl \"Hello World\" with this:</p>
<pre>#!/usr/bin/perl -w
print \"Content-type: text/html&#92;n&#92;n&#92;n\";
print \"Hello, world from perl!&#92;n\";
</pre>
</footer>
</div> 
</body>
</html>
HTML
exit;
