#!/usr/bin/perl -w 
use CGI::Carp qw (fatalsToBrowser);     # вывод ошибок к browser-у 
@m_name=2000;@m_value=2000;$amount=0;
read STDIN, $query_str, 100000;
print "Content-type: text/html\n\n";
$remote_address = $ENV{ "REMOTE_ADDR" };
$query_str = $ENV{'QUERY_STRING'};   # Для метода GET
# Меняем шестнадцатеричные коды символов на сами символы
$query_str =~s/%([0-9a-hA-H]{2})/pack('C',hex($1))/ge;;
$remote_address =~s/%([0-9a-hA-H]{2})/pack('C',hex($1))/ge;;
#Задаем число вопросов, на которые будет отвечать пользователь
$quest_quantity_enter=10;
$quest_quantity = $quest_quantity_enter+1;  
open (DFILE,"../public_html/testing/ip_list.txt") || die;
@fromfile=<DFILE>;
chop(@fromfile);
close(DFILE);
$ip_ok=0; #для доступа отовсюду $ip_ok=1
foreach $item (@fromfile){
	if ($remote_address eq $item) {$ip_ok=1}}
if ($ip_ok==1)
		{
		$query_str =~ tr/+/ /;
		# Разбиваем пару на имя/значение поля
		@pairs = split(/&01_/, $query_str);
		#Выделение из каждой пары имени и значения поля формы и 
		##сохранение их в асоциативном массиве %form_fields
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
				$number = $form_fields{'number'};
		#Первый и единственный начальный проход
		if ($number == -1)
					{#Определение количества вопросов в списке
					$number_of_line=0;
					$path_in="../public_html/testing/t_1/"; $file_in=$path_in."test.txt";
					open (DFILE,$file_in) || die;
					while (<DFILE>){$number_of_line++;} # количество вопросов
					close(DFILE);
					$number_of_line = $number_of_line--;
					#Генерируем номеров вопросов
							$i = -1;
							M1:
							while ($i < $quest_quantity)
								{++$i;#Увеличиваем счетчик на 1
								M2:
								$num=int(rand($number_of_line)+1);
								goto M3 if $i == 1; # Пропустить для $i = 1 и перейти на строку M3
								foreach $number(@numbers) # Проверка совпадений номеров
									{
									goto M2 if $number == $num; # Перейти на строку M1, если такой номер  уже есть в массиве
									}
								M3:
								$numbers[$i] = $num;
								}
					#Создание файла username.vop и запись в него массива %numbers
					open(user_file,">>../public_html/testing/results/t_1/".$username.".vop");
					foreach $number(@numbers)
						{
						print user_file "$number\n";
						}
					close(user_file);
					
					
					#Создание файла username.tim начало тестирования
					open(user_file,">>../public_html/testing/results/t_1/".$username.".tim");
					print user_file "$^T\n";
					close(user_file);
					#Создание файла username.txt
					open(user_file,">>../public_html/testing/results/t_1/".$username.".txt");
					close(user_file);
					#Создание файла username.res
					open(user_file,">>../public_html/testing/results/t_1/".$username.".res");
					close(user_file);
			$number=0; #при тестировании
         # $number=100; #при коллективном просмотре, если было копирование на *.res - 666 
			}	
		#/Первый и единственный начальный проход

		#Вопросы ответы и запись			
		$number=$number+1;
		if ($quest_quantity -$number >=0)
				{
				($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =localtime(time);
				$year=$year+1900;
				$mon=$mon+1;
				if ($min < 10) {$min = "0$min";}    if ($hour < 10) {$hour = "0$hour";}   if ($mon < 10) {$mon = "0$mon";   }   if ($mday < 10) {$mday = "0$mday";}
				
				open(UFILE,"../public_html/testing/results/t_1/".$username.".vop");
				@fromfile=<UFILE>;
				chop(@fromfile);
				close(UFILE);
				$first_number = $fromfile[$number]; 
				$path_in="../public_html/testing/t_1/";
				$file_in=$path_in."test.txt";
				open (DFILE,$file_in) || die;
				@fromfil=<DFILE>;
				chop(@fromfil);
				close(DFILE);
				$string = $fromfil[$first_number-1];# Строка вопроса из базы
				($question, $corr_answer, $picture) =split(/\t/, $string, 3);
				$path_in="../public_html/testing/t_1/";
				$picture_img=$path_in.$picture;	
				
				$name_out="../public_html/testing/results/t_1/".$username.".txt";
				open (OUT, ">>",$name_out) || die"mistake-$name_out";
				print OUT "\n",$answer;
				print OUT "\n\n------";
				print OUT "\n",$number;
				print OUT "\n", $remote_address,", ",$year,".",$mon, ".", $mday, ",  ", $hour, ":", $min, ":", $sec, ",  ", $first_number*3; 
				print OUT "\n",$picture_img;
				print OUT "\n",$question;
				print OUT "\n",$corr_answer;
				close (OUT);

				$vop_number = $number;
				#print "Content-type: text/html\n\n";
				print "<!DOCTYPE html>\n";
                print "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>\n";
                print "<HTML>\n<HEAD>\n";
				print "<meta charset=utf-8>\n";
				print "<meta http-equiv='cache-control' content='no-cache'>\n";
				print "<TITLE>",$username,"	",$vop_number,"</TITLE>\n";
				print "</HEAD>\n";
				print "<BODY style='font-size: 85%'  >"; 


				print ("IP:$remote_address. Ваше имя:$username.");
				print ("<br>Вопрос № $vop_number .");
				print "\n<form  action='../cgi-bin/t_1.pl' method='get'>\n";
				print "<IMG SRC=$picture_img border=2>";
				print "<br>$question \n";
		#		print "<P> $name, $number, $answer, $corr_answer,$picture, $question</P>";
				print "<input type = hidden  name = '01_name_01' value='$username'>\n";
				print "<input type = hidden  name = '01_number_01' value='$number'>\n";
#    			print "<br><TEXTAREA name='01_answer_01' value='' rows=8 cols=120 ></TEXTAREA>\n";
				print "<br><input type =text name='01_answer_01' value='' size=120>\n";
#				print "<input type = hidden  name = '01_corr_answer_01' value='$corr_answer'>\n";
#				print "<input type = hidden  name = '01_pictire_01' value='$picture'>\n";
#				print "<input type = hidden  name = '01_question_01' value='$question'>\n";
				print "<br><input type ='submit' name='01_submit'  value='Далее'>";
				print "</FORM>";
				$example_picture="perl.gif"; $example=$path_in.$example_picture;
                $example="http://bim.nn2000.info/public_html/testing/perl.gif";
				print "</n 
<p></p>
<p>Количество вопросов - $quest_quantity_enter. На лишний вопрос можно не отвечать.
<br>Дождаться завершения текущей операции и появления нового вопроса.
<br>head, body, table и их родительские элементы существуют, поэтому фрагмент таблицы нужно начинать с tr, форму с form, параграф с p, список с ul или ol  и аналогично с элементами div, img  и другими.
<br>При создании форм использовать правила умолчания и данные должны отправляться  на удаленный сервер.
<br>Для ссылок и для изображений рекомендуется использовать абсолютную адресацию.
<br>Если нужно изображение, можно использовать $example
</p>
";
				
				print "</BODY></HTML>";
				$name_out="../public_html/testing/results/t_1/".$username.".txt";
				open (FILE_OUT, ">>",$name_out) || die"mistake-$name_out";
#				print FILE_OUT $question,"	", $corr_answer,"	",$answer,"	",$picture_img, "\n";
				close (FILE_OUT);
				}

		#Вопрос обработан		
		#-------------------------------------------------
		  if ($quest_quantity -$number < 100 )
			   { 
				$name_in="../public_html/testing/results/t_1/".$username.".txt";
				open FILE_IN,$name_in or die "mistake-$name_in" ;
				$name_out="../public_html/testing/results/t_1/".$username.".res";
				open (FILE_OUT, ">",$name_out) || die"mistake-$name_out";
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
							#print $question1,"	",$answer,"	",$corr_answer1,"	",$picture1;
                            print FILE_OUT  $question1,"",$answer,"",$corr_answer1,"",$picture1;
							#print FILE_OUT "<br>", $n_i,"	", $picture1,"	",$question1,"	",$corr_answer1, "	", $answer, "	", "\n";
							if ($corr_answer1 eq $answer) {$corr_numb=$corr_numb+1;}
							}
						}
					close FILE_OUT;
					close FILE_IN;
				 }
		  if ($quest_quantity -$number < 0)
				 {   
				#print "Content-type: text/html\n\n";
				print "<!DOCTYPE html>\n";
                print "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>\n";
                print "<HTML>\n<HEAD>\n";
				print "<meta charset=utf-8>\n";
				print "<meta http-equiv='cache-control' content='no-cache'>\n";
				print "<TITLE>",$username, " Результаты тестирования</TITLE>\n";
				print "</HEAD>\n";
				print "<BODY style='font-size: 85%'>";
					print "<HR>";
					print "<H3>Тестирование завершено. Результаты обсудить с преподавателем</H3>\n";
					if (($quest_quantity -$number < -1) )  
#для запрета на просмотр строку выше расскомменировать  
						{
							$name_in="../public_html/testing/results/t_1/".$username.".res";
							open FILE,$name_in or die "mistake-$name_in" ;
							$n_i=0;
							$all_quantity=0;
							$corr_quantity=0;
							$n_bl=0;
							while ($pri=<FILE>)
							{
								$n_i++;
                                #print "\n\n",$i,$pri;
 #my($pri) = $_;
 #chomp($pri);
								$pri_01="------
";
								if ($pri eq $pri_01 ){$n_bl=1;}
									else	{$n_bl=$n_bl+1}
#								print"\n",$n_bl;
								#print "\n",$n_bl,$pri;
								if ($n_bl == 2) 	{$n_writed= $pri;}								
								if ($n_bl == 3) 	{$n_time= $pri;}								
								if ($n_bl == 4) 	{$picture_img= $pri;}								
								if ($n_bl == 5) 	{$question= $pri;}								
								if ($n_bl == 6) 	{$corr_answer= $pri;}								
								if ($n_bl == 7) 	{$answer= $pri;}								
								if ($n_bl ==7) 									
								{	
		#								($question, $corr_answer, $answer,$picture_img) =split(/\t/, $pri, 4);
										print "<p>&nbsp;</p>";
										print "\n\n\n<h3>\nВопрос:  $n_writed; Логин: $username; IP,дата,время: $n_time</h3>"; # Номер
										print "\n";
										print "\n<img src=$picture_img  border=1>";
										print "\n<p>Вопрос:<br> $question\n"; # Вопрос
										print "\n<table width=400px border=1 bgcolor=silver>";
                                        print "<tr><td width=50% border=0></td><td  border=0></td><td  width=40%border=0></td></tr>"; #разметка ячеек
                                        print "\n<tr><td border=0 colspan=3>Правильный ответ:</td></tr> \n<br>Правильный ответ";
										print "\n<br>$corr_answer\n";
                                        print "\n<tr><td border=0 colspan=3>Ответ студента:</td></tr> \n<br>Ответ студента";
										print "\n<br>$answer";
										print "\n</font></font></font></font></b></b></b></b></u></u></u></u></p></p></p></p>";  #  - подчистка за неправильным ответом - если студент что-то не закрыл
										print "\n</td></td></td></td></tr></tr></tr></tr></table></table></table></table></div></div></div></div>";
									
										$all_quantity=$all_quantity+1;		
										if ($answer eq $corr_answer)#
											{$corr_quantity=$corr_quantity+1;
												print "<br>Ответ верен";
												}
												else {print "\n<br><font color='Red'><B>Ответ оценивает преподаватель </B></font>";}
										print "<HR>";
									}
								}
						}
						close FILE;	
						print "<H3>\n";
						print "<br>Итоговые результаты\n";
						print "<br>Ваше имя: $username\n";
#                        print "<br>Ваш файл: http://bim.nn2000.info/public_html/testing/results/$username.txt";
#						print "<br>Всего вопросов - $all_quantity\n";			
#						print "<br>Правильных ответов - $corr_quantity\n";
#						$percent= int(($corr_quantity/$all_quantity)*100);
#						print "<br>Процент правильных ответов - $percent \n";
						}
					print "</H3>\n";	
					print "</BODY></HTML>";		  
				 }

else 
{
#print "Content-type: text/html\n\n";
print "Access denied:", $remote_address;
open(user_file,">>../public_html/testing/ip_logs.txt");
	@pairs = split(/&01_/, $query_str);
	print user_file $remote_address,"\n", @pairs,"\n";
close(user_file);
#open(user_file,">>../public_html/testing/ip_list.txt");
#	@pairs = split(/&01_/, $query_str);
#	print user_file $remote_address,"\n", @pairs,"\n";
#close(user_file);
print "\n<br>Обновитесь, кликнув F5";
}

