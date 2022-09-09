#!/usr/bin/python2.7
import os
import platform
print "Content-Type: text/html"
print
print """\
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hello World from Python</title>
    <link rel="stylesheet" href="../css/style.css">
  </head>
<body class="python">
  <div id="container">
    <div id="main" role="main"  class="hellobox" >
        <header><a href="../public_html/index.html">start</a></header>
    <h1>Hello World!</h1>
    <h2>From Python 
    """
print platform.python_version()
print """\
  </h2> </div>
<nav>
    <ul>
        <li><a href="../public_html/index.html">HTML</a></li>
		<li><a href="../public_html/php.php">PHP</a></li>
		<li><a class="active" href="../cgi-bin/python.py">Python</a></li>
		<li><a href="../cgi-bin/perl.pl">Perl</a></li>
		<li><a href="../cgi-bin/ruby.rb">ruby</a></li>
    </ul>  
</nav>
<footer>
<h4>This is an example page running Python on your Server.</h4> <p>You can create your own simple Python "Hello World" with this:</p>
<pre>#!/usr/bin/python
import os
print "Content-type: text/html"
print
print "Hello, world from python!"</pre>
</footer>
</div> 
</body>
</html>
"""

