#!/usr/bin/perl -w 
use CGI::Carp qw (fatalsToBrowser);     # ����� ������ � browser-� 

@m_name=2000;
@m_value=2000;
$amount=0;

read STDIN, $query_str, 100000;
$remote_address = $ENV{ "REMOTE_ADDR" };
$query_str = $ENV{'QUERY_STRING'};   # ��� ������ GET

# ������ ����������������� ���� �������� �� ���� �������
$query_str =~s/%([0-9a-hA-H]{2})/pack('C',hex($1))/ge;;
$remote_address =~s/%([0-9a-hA-H]{2})/pack('C',hex($1))/ge;;

#������ ����� ��������, �� ������� ����� �������� ������������
$quest_quantity_enter=10;   #!!!!___������ ���������� ��������
$quest_quantity = $quest_quantity_enter+1;  


if ($remote_address eq "89.189.16.97")
#if ($remote_address eq "194.190.181.147"  or $remote_address eq "194.190.181.148")
#if ($remote_address eq " 89.189.23.185"  or $remote_address eq "194.190.181.147" or $remote_address eq "194.190.181.148")
{$my_ip=$control_ip=$remote_address;}
if ($remote_address eq $my_ip) 
	{
		$query_str =~ tr/+/ /;
		# ��������� ���� �� ���/�������� ����
		@pairs = split(/&01_/, $query_str);
		#��������� �� ������ ���� ����� � �������� ���� ����� � 
		##���������� �� � ������������ ������� %form_fields
		$n_i = 0;
		foreach $pair (@pairs)
				{
					 $n_i++; 
					($name, $value)=split(/_01=/,$pair);
					$form_fields{$name}=$value;
					$m_name[$n_i]=$name;
					$m_value[$n_i]=$value;
				}
				$username=$m_value[1];
				$number=$m_value[2];
				$answer=$m_value[3];
				$corr_answer=$m_value[4];
				$picture=$m_value[5];
				$question=$m_value[6];
		#���������� ������� ����� �������
		$number = $form_fields{'number'};
		#���������� ��� ������������
       
		#������ � ������������ ��������� ������
		if ($number == -1)
					{
					# ����������� ������� ��������
					$number_of_line=0;
					$path_in="../public_html/testing/t_5/"; #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					$file_in=$path_in."test.txt";
					open (DFILE,$file_in) || die;
					while (<DFILE>)
							{
							++$i;
							$number_of_line++; # ���������� ������ ������� ������ �� �������
							}
					close(DFILE);
					#������� ������� ��������
					$number_of_line = $number_of_line;
							$i = -1;
							M1:
							while ($i < $quest_quantity)
								{
								++$i;       # ����������� ������� �� 1
								M2:
								$num=int(rand($number_of_line)+1);
								goto M3 if $i == 1; # ���������� ��� $i = 1 � ������� �� ������ M3
								foreach $number(@numbers) # �������� ���������� �������
									{
									goto M2 if $number == $num; # ������� �� ������ M1, ���� ����� �����  ��� ���� � �������
									}
								M3:
								$numbers[$i] = $num;
								}
					# ������� ������� �������� ���������
					#�������� ����� username.vop � ������ � ���� ������� %numbers
					open(user_file,">>../public_html/testing/results/".$username.".vop");
					foreach $number(@numbers)
						{
						print user_file "$number\n";
						}
					close(user_file);
					
					
					#�������� ����� username.tim ������ ������������
					open(user_file,">>../public_html/testing/results/".$username.".tim");
					print user_file "$^T\n";
					close(user_file);
					#�������� ����� username.txt
					open(user_file,">>../public_html/testing/results/".$username.".txt");
					close(user_file);
					#�������� ����� username.res
					open(user_file,">>../public_html/testing/results/".$username.".res");
					close(user_file);
			$number=0;
			}	
		#/������ � ������������ ��������� ������

		#������� ������ � ������			
		$number=$number+1;
		if ($quest_quantity -$number >=0)
				{
				($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
				$year=$year+1900;
				$mon=$mon+1;
				if ($min < 10) {$min = "0$min";}    if ($hour < 10) {$hour = "0$hour";}   if ($mon < 10) {$mon = "0$mon";   }   if ($mday < 10) {$mday = "0$mday";}
				
				open(UFILE,"../public_html/testing/results/".$username.".vop");
				@fromfile=<UFILE>;
				chop(@fromfile);
				close(UFILE);
				$first_number = $fromfile[$number]; 
				$path_in="../public_html/testing/t_5/";
				$file_in=$path_in."test.txt";
				open (DFILE,$file_in) || die;
				@fromfil=<DFILE>;
				chop(@fromfil);
				close(DFILE);
				$string = $fromfil[$first_number-1];# ������ ������� �� ����
				($question, $corr_answer, $picture) =split(/\t/, $string, 3);
				$path_in="../public_html/testing/t_5/";
				$picture_img=$path_in.$picture;	
				
				$file_out="../public_html/testing/results/".$username.".txt";
				open (OUT, ">>",$file_out) || die"mistake-$file_out";
				print OUT "\n",$answer;
				print OUT "\n\n------";
				print OUT "\n",$number;
				print OUT "\n",$year,".",$mon, ".", $mday, " _	", $hour, ":", $min, ":", $sec, "", $first_number; 
				print OUT "\n",$question;
				print OUT "\n",$picture_img;
				print OUT "\n",$corr_answer;
				close (OUT);

				$vop_number = $number;
				print "Content-type: text/html\n\n";
				print "<HTML><HEAD>";
				print "<meta charset=windows-1251>\n";
				print "<meta http-equiv='cache-control' content='no-cache'>\n";
				print "<TITLE>",$username,"	",$vop_number,"</TITLE>\n";
				print "</HEAD>\n";
				print "<BODY style='font-size: 85%'  >"; 


				print ("��� IP:$remote_address  ���� ���:$username");
				print ("<CENTER>������ � $vop_number . </CENTER>");
				print "\n<form  action='../cgi-bin/t_5.pl' method='get'>\n";
				print "<IMG SRC=$picture_img border=2>";
				print "<br>$question \n";
		#		print "<P> $name, $number, $answer, $corr_answer,$picture, $question</P>";
				print "<input type = hidden  name = '01_name_01' value='$username'>\n";
				print "<input type = hidden  name = '01_number_01' value='$number'>\n";

		#		print "<br><TEXTAREA name='answer_01' value='' rows=12 cols=80 ></TEXTAREA>\n";
				print "<br><input type =text name='01_answer_01' value='' size=120>\n";
#				print "<input type = hidden  name = '01_corr_answer_01' value='$corr_answer'>\n";
#				print "<input type = hidden  name = '01_pictire_01' value='$picture'>\n";
#				print "<input type = hidden  name = '01_question_01' value='$question'>\n";
				print "<br><input type = submit  value='�����'>";
				print "</FORM>";
				$example_picture="perl.gif"; $example=$path_in.$example_picture;	
				print "</n 
<p>����� ���������� � ���� ������
<br>������ ��� ������ �������  �������� � p  � ������� �������
<br>������ ��� ������� ��������� � ��������� ���� ������� � �������  �������� � tr  � ������� ������� 
<br>��� ������������  ����� ��������� ����������� � ��������� � �������� ������� 
<br>��������� ���������� ������� �������� � ��������� ������ ������� (�� ������� ��������� ��� �� �����). 
<br>���� ����� �����������, ����� ������������:$example</p>
";
				
				print "</BODY></HTML>";
				$file_out="../public_html/testing/results/".$username.".txt";
				open (input_file, ">>",$file_out) || die"mistake-$file_out";
#				print input_file $question,"	", $corr_answer,"	",$answer,"	",$picture_img, "\n";
				close (input_file);
				}

		#������ ���������		
		
		#-------------------------------------------------
		  if ($quest_quantity -$number < 0 )
			   { 
				$name_in="../public_html/testing/results/".$username.".txt";
				open FILE_IN,$name_in or die "mistake-$name_in" ;
				$file_out="../public_html/testing/results/".$username.".res";
				open (input_file, ">",$file_out) || die"mistake-$file_out";
				$n_i = -1;
				$corr_numb=0;
				while ($pri = <FILE_IN>)
						{
						$n_i++;
						$picture1=$picture; 
						$question1=$question; 
						$corr_answer1=$corr_answer;
						$answer1=$answer;  
						( $question, $corr_answer, $answer,$picture) =split(/\t/, $pri, 4);
						if ($n_i>=1) 
							{
							print input_file  $question1,"	",$corr_answer1,"	",$answer,"	",$picture1;
							#print input_file "<br>", $n_i,"	", $picture1,"	",$question1,"	",$corr_answer1, "	", $answer, "	", "\n";
							if ($corr_answer1 eq $answer) {$corr_numb=$corr_numb+1;}
							}
						}
					close input_file;
					close FILE_IN;
				 }
		  if ($quest_quantity -$number < 0)
				 {   
				print "Content-type: text/html\n\n";
				print "<HTML><HEAD>";
				print "<meta charset=windows-1251>\n";
				print "<meta http-equiv='cache-control' content='no-cache'>\n";
				print "<TITLE>���������� ������������</TITLE>\n";
				print "</HEAD>\n";
				print "<BODY style='font-size: 85%'>";
					print "<HR>";
					print "<H3>������������ ���������. ���������� � �������������</H3>\n";
				   if (($quest_quantity -$number < -1) and ($remote_address eq $control_ip) )  
#��� ������� �� �������� ������ ���� �����������������  
						{
							$name_in="../public_html/testing/results/".$username.".res";
							open FILE,$name_in or die "mistake-$name_in" ;
							$n_i=0;
							$all_quantity=0;
							$corr_quantity=0;
							$n_bl=0;
							while ($pri=<FILE>)
							{
								$n_i++;
 #my($pri) = $_;
 #chomp($pri);
								$pri_01="			------
";
								if ($pri eq $pri_01 ){$n_bl=1;}
									else	{$n_bl=$n_bl+1}
#								print"\n",$n_bl;
#								print "\n",$n_bl,$pri;
								if ($n_bl == 2) 	{$n_writed= $pri;}								
								if ($n_bl == 3) 	{$n_time= $pri;}								
								if ($n_bl == 4) 	{$question= $pri;}								
								if ($n_bl == 5) 	{$picture_img= $pri;}								
								if ($n_bl == 6) 	{$corr_answer= $pri;}								
								if ($n_bl == 7) 	{$answer= $pri;}								
								if ($n_bl ==7) 									
								{	
		#								($question, $corr_answer, $answer,$picture_img) =split(/\t/, $pri, 4);
										print "<p>&nbsp;</p>";
										print "\n\n\n<h3>����� ������� - $n_writed ���(�����) - $username  -  $n_time</h3>"; # �����
										print "\n<p>&nbsp;</p>";
										print "\n<img src=$picture_img  border=2>";
										print "\n<br>������ - $question\n"; # ������
										print "\n<br>����� ��������: \n<br> <table  bgcolor='silver' width='400' border=1>\n $answer  \n<tr> <td>0.</td> <td>0.</td>  <td>0.</td></tr>\n</table>\n"; # ����� ������������
										print "\n </font></u></p></td></tr>";  #  - ��������� �� ������������ ������� - ���� ������� ���-�� �� ������
										print "\n<br>���������� ����� :\n<br><table  bgcolor='silver' width='400' border=1>\n $corr_answer <tr> <td>0.</td> <td>0.</td>  <td>0.</td></tr>\n</table>\n"; # ���������� �����
										$all_quantity=$all_quantity+1;		
										if ($answer eq $corr_answer)#
											{$corr_quantity=$corr_quantity+1;
												print "<br>����� �����";
												}
												else {print "<br><font color='Red'><B>����� ��������� ������������� </B></font>";}
										print "<HR>";
									}
								}
						}
						close FILE;	
						print "<H3>\n";
						print "<br>�������� ����������\n";
						print "<br>���� ��� - $username\n";
#						print "<br>����� �������� - $all_quantity\n";			
#						print "<br>���������� ������� - $corr_quantity\n";
#						$percent= int(($corr_quantity/$all_quantity)*100);
#						print "<br>������� ���������� ������� - $percent \n";
						}
					print "</H3>\n";	
					print "</BODY></HTML>";		  
				 }

else 
{
print "Content-type: text/html\n\n";
print "Access denied";
}		
