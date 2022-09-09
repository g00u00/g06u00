#!/usr/bin/perl -w 
use CGI qw(:standard);
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
use CGI::Carp qw(cluck);


print "Content-type: text/html \n\n";
print "<head>";
print "\n<title>Обработка строки запроса</title>";
print "\n</head>";
print "\n\n\<body>";

@m_name=200;
@m_value=200;

$remote_address = $ENV{ "REMOTE_ADDR" };

$query_str = $ENV{'QUERY_STRING'}; 
#if($ENV{'REQUEST_METHOD'} eq 'GET'){  $query_str=$ENV{'QUERY_STRING'};}
#elsif($ENV{'REQUEST_METHOD'} eq 'POST'){sysread STDIN,$query_str,$ENV{'CONTENT_LENGTH'};}
$query_str =~ s/%(..)/pack("c",hex($1))/eg;
$query_str =~ tr/+/ /;
print "\nIP: $remote_address";
print "\n<br>Строка запроса:\n<br> $query_str";

@pairs = split(/&/, $query_str);
$n_i = 0;
foreach $pair (@pairs)
     { $n_i=$n_i+1; 
	($name, $value)=split(/=/,$pair);
	$m_name[$n_i]=$name;
	$m_value[$n_i]=$value;
	print "\n <!-- $n_i  $m_name[$n_i]   $m_value[$n_i] -->";
	}
$file_name=$m_value[$n_i-1];
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
		$year=$year+1900;
		$mon=$mon+1;
		if ($min < 10) {$min = "0$min";}    if ($hour < 10) {$hour = "0$hour";}   if ($mon < 10) {$mon = "0$mon";   }   if ($mday < 10) {$mday = "0$mday";}

print "\n<br>Сейчас:";
print $year,  "-",$mon,  "-", $mday,  "; ",   $hour,  ":",  $min,  ".";
$print_table="Y";
if ($print_table eq "Y")
	{print "\n<br><br>Представление строки в виде таблицы:";
	print "\n\n<br> <table border=1>";
	for ($i=1; $i<=$n_i; $i++)
	   {print "\n<tr>";
		 print "<td>$i</td>";
		 print "<td>  $m_name[$i]  </td>";
		 print "<td> $m_value[$i]  </td>";
		 print "</tr>";
	   }
	print "\n</table>";		
	}	
	elsif  ($print_table eq "N")
		{ print "<br> ...not table";
		}
		else 
		{
		}
		

print "<p>";
$name_out=join('',"../public_html/010_html/050_forms/results/",$file_name);
print "\n<br>Запись производится в: $name_out";
#open OUTFILE,">>",  $name_out or die "mistake-$name_out" ;
open OUTFILE,">",  $name_out or die "mistake-$name_out" ;
print OUTFILE $remote_address,"	";
print OUTFILE $year,"-",$mon, "-", $mday,"	";
print OUTFILE $hour,  ":",  $min, "	";
for ($i=1; $i<=$n_i-1; $i++)
#		{print OUTFILE $m_name[$i],"	", $m_value[$i],"	";
		{print OUTFILE $m_value[$i],"	";
		}
#print OUTFILE chr(59), "	";
print OUTFILE " \n";
close(OUTFILE);
$file_in =$name_out;
#$pri="abc";
open (DFILE_M,$file_in) or die "mistake-$file_menu";
    while ($pri=<DFILE_M>)
        {
        ($ip, $date, $time, $last_name, $first_name, $second_name, $place, $exp, $languages, $info, $password, $file_name) =split(/\t/, $pri, 12);
        }
close(DFILE_M);
print "\n<pre>Последняя запись из файла  в виде значений переменных:";
print "\n$ip, $date, $time, $last_name, $first_name , $second_name , $place, $exp, $languages, $info, $password, $file_name";
print "\nВсе записи из файла в виде символьных строк:\n";
#$pri="abc";
open (DFILE_M,$file_in) or die "mistake-$file_menu";
    while ($pri=<DFILE_M>)
        {print $pri;
          }
close(DFILE_M);

print "</pre>";

print "</body>";
print "</html>";


# Самостоятельно.
# Для расширения функциональных возможностей скрипта:
# - запись данных должна быть произведена в файл, который задается с использованием формы
#- поставить дополнительные ключи, разрешающие: 
#--запись данных в файл;
#-- вывод на экран таблицы с элементами строки запроса
#-реализовать пример с использованием  атрибута "hidden" 
#