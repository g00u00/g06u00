<!DOCTYPE html>
<html lang="en">
<head>
<title>Hello World from PHP</title> 
<link rel="stylesheet" href="../css/style.css">
</head>
<body class="php">
<div id="container">
	<div id="main" role="main" class="hellobox">
		<header><a href="../public_html/index.html">a</a></header>
		<h1><?php echo 'Hello World!'; ?>
		</h1>
		<h2>From PHP <?php echo PHP_VERSION; ?>
		</h2>
	</div>
	<nav>
	<ul>
        <li><a href="../public_html/index.html">HTML</a></li>
		<li><a class="active" href="../public_html/php.php">PHP</a></li>
		<li><a href="../cgi-bin/python.py">Python</a></li>
		<li><a href="../cgi-bin/perl.pl">Perl</a></li>
		<li><a href="../cgi-bin/ruby.rb">ruby</a></li>
	</ul>
	</nav>
	<footer>
	<h4>This is an example page running PHP on your  Server.</h4>
	<p>
		You can create your own simple PHP "Hello World" with this:
	</p>
	<pre>&lt;?php echo 'Hello World from PHP'; ?&gt;</pre>
	</footer>
</div>
</body>
</html>
