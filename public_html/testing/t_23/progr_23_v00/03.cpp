
#include <iostream>
#include <fstream>
#include <algorithm>
#include <numeric>
#include <vector>
#include <iterator>
#include <string>  
#include <cstdlib>
#include <ctime> 
#include <cgicc/CgiDefs.h> 
#include <cgicc/Cgicc.h> 
#include <cgicc/HTTPHTMLHeader.h> 
#include <cgicc/HTMLClasses.h>  
#include <iomanip>
#include <bitset>
#define COMPARE *(string_2[i].end() -1) ==
using namespace std;
using namespace cgicc;
const int n = 50;
int main(){
	Cgicc formData;
	Cgicc cgi;
	cout << "Content-type:text/html\r\n\r\n";
	cout << "<html>\n";
	cout << "<head>\n";
	cout << "<title>Заголовок страницы</title>\n";
	cout << "<meta http-equiv='Content-Type' CONTENT='text/html; charset=utf-8'>\n";
	cout << "</head>\n";
	cout << "\n<body>";
	cout << "\n<pre>";
	ifstream ifs("/var/www/files/ps_0020.txt");
	char char_1[n];
	char char_2[n];
	vector <int> int_1(n);
	vector <int> int_2(n);
	vector <int> int_3(n);
	vector <double> double_1(n);
	vector <double> double_2(n);
	/*int int_2[n];
	int int_3[n];
	double double_1[n];
	double double_2[n]; */
	string string_1[n];
	vector <string> string_2(n);
	string tmp;
	int j(-1);
	for (int i(0); i < (n * 9); i++)
	{
		getline(ifs, tmp, ';');
		if (i==0)
			tmp.erase(tmp.begin(), (tmp.begin() +6));
		cout << tmp << "_; ";
		switch(i%9)
		{
			case 0:
			char_1[++j] = tmp[1];
			//cout << char_1[j] << endl;
			break;
			case 1:
			int_1[j] = stoi(tmp);
			//cout << int_1[j] << endl;
			break;
			case 2: 
			string_1[j] = tmp;
			break;
			case 3:
			int_2[j] = stoi(tmp);
			break;
			case 4:
			int_3[j] = stoi(tmp);
			break;
			case 5:
			char_2[j] = tmp[0];
			break;
			case 6:
			string_2[j] = tmp;
			break;
			case 7:
			double_1[j] = stod(tmp);
			break;
			case 8:
			double_2[j] = stod(tmp);
			break;
		}

	}
	//cout << "ABC   " << char_1[0];
	cout << endl;
	for (int z(0);z<n; z++)
	{
		cout << left << fixed << setprecision(1) << setfill('*') << setw(2) << char_1[z] << setw(3) << int_1[z] <<
		setw(9) << string_1[z] << setw(3) << int_2[z] << setw(4) << int_3[z] << setw(2) << char_2[z] <<
		setw(9) << string_2[z] << setw(6) << double_1[z] << setw(8) << scientific << double_2[z] << endl;
	}
	double temporary;
	vector <double> double_1_copy(50);
	vector <double> double_2_copy(50);
	double_1_copy = double_1;
	double_2_copy = double_2;
	temporary = accumulate(double_1.begin(),double_1.end(),0);
	double_1_copy.insert(double_1_copy.begin(), 50);
	double_1_copy.insert(double_1_copy.begin()+1, temporary);
	temporary = accumulate(double_2.begin(),double_2.end(),0);
	double_2_copy.insert(double_2_copy.begin(), 50);
	double_2_copy.insert(double_2_copy.begin()+1, temporary);
	cout << "Float" << endl << fixed << setprecision(0) << double_1_copy[0] << ' ';
	for (int i(1); i<n+2; i++)
		cout << fixed << setprecision(1) << double_1_copy[i] << ' ';
	cout << endl << fixed << setprecision(0) << double_2_copy[0] << ' ';
		for (int i(1); i<n+2; i++)
		cout << setprecision(1) << scientific  << double_2_copy[i] << ' ';
	vector <int> int_2_copy(50);
	int_2_copy = int_2;
	vector <int> int_3_copy(50);
	int_3_copy = int_3;
	for (int i(0);i<n/2;i++)
	{
		int_2_copy[i] = -int_2_copy[i];
		int_3_copy[i] = -int_3_copy[i];
	}
	cout << endl << "Integer" << endl;
	for (int i(0); i<n; i++)
	{
		cout << int_2_copy[i] << ' ';
	}
	cout << endl;
		for (int i(0); i<n; i++)
	{
		cout << int_3_copy[i] << ' ';
	}
	vector <string> string_2_copy;
	for (int i(0); i<n; i++)
	{
		if (string_2[i].length()<5 && (COMPARE 66 || COMPARE 67 || COMPARE 68 || COMPARE 79
		|| COMPARE 71 || COMPARE 72 || COMPARE 74 || COMPARE 75 || COMPARE 76 || COMPARE 77 
		|| COMPARE 78 || COMPARE 80 || COMPARE 81 || COMPARE 82 || COMPARE 83 || COMPARE 84 
		|| COMPARE 86 || COMPARE 87 || COMPARE 88 || COMPARE 90))
			string_2_copy.push_back(string_2[i]);
	}
	cout << endl << "Strings" << endl;
	cout << "Number of strings " << string_2_copy.size() << endl;
	for (int i(0); i<string_2_copy.size(); i++)\
	{
		cout << string_2_copy[i] << endl;
	}
	ifs.close();

 //   form_iterator fi;
 //   fi = formData.getElement("number");  
 //   string str_number = **fi;
 //   
 //   int n;
 //   n = stoi(str_number);
 //   
 //   srand(time(NULL));//current calendar time (seconds since Jan 1, 1970
 //  // cout << rand() << " " <<RAND_MAX <<endl;
 //   
 //   int* int_arr1 = new int[n];
	//int* int_arr2 = new int[n];
	//char* char_arr1 = new char[n];
	//char* char_arr2 = new char[n];
	//float* float_arr1 = new float[n];
	//float* float_arr2 = new float[n];
 //   int i_min=48, i_max=59;
	//cout << "Диапазон 48-59" << endl;
 //   cout <<  setprecision(3) << setfill(';');
 //   for (int i = 0; i < n; i++) {
 //       int_arr1[i] = (i_min+(int)(((i_max-i_min))*(0.005+(((float)rand())/RAND_MAX))));
 //       char_arr1[i] = int_arr1[i];
	//	float_arr1[i] = int_arr1[i]*1.0;
	//	cout << fixed << char_arr1[i] << setw(10) << float_arr1[i] 
	//	<< setw(10) << int_arr1[i] << setw(15) 
	//	<< bitset<10> (int_arr1[i]) << setbase(10) <<  setw(25) << hex << (&char_arr1 + i) << dec << endl;
 //       }
	//i_min = 65, i_max = 90;
	//cout << "Диапазон 65-90" << endl;
 //   for (int i = 0; i < n; i++) {
 //       int_arr2[i] = (i_min+(int)(((i_max-i_min))*(0.005+(((float)rand())/RAND_MAX))));
 //       char_arr2[i] = int_arr2[i];
	//	float_arr2[i] = int_arr2[i]*1.0;
	//	cout << fixed << char_arr2[i] << setw(10) << float_arr2[i] 
	//	<< setw(10) << int_arr2[i] << setw(15) 
	//	<< bitset<10> (int_arr2[i]) << setbase(10) <<  setw(25) << hex << (&char_arr2 + i) << dec << endl;
 //       }
	//	int max, min, aver1, aver2, sum1(0), sum2(0), min_index;
	//for (int i = 0; i < n; i++) {
	//	sum1 += int_arr1[i];
	//	sum2 += int_arr2[i];
	//	if (!i){
	//		max = int_arr2[i];
	//		min = int_arr1[i];
	//		min_index = i;
	//	}
	//	if (max < int_arr2[i])
	//		max = int_arr2[i];
	//	if (min > int_arr1[i]){
	//		min = int_arr1[i];
	//		min_index = i;
	//	}
	//		
 //       }
	//	aver1 = sum1/n;
	//	aver2 = sum2/n;
	//	int count1(0), count2(0);
	//	for (int i = 0; i < n; i++)
	//	{
	//		if (int_arr1[i] < aver1) 
	//			count1++;
	//		if (int_arr2[i] < aver2)
	//			count2++;
	//	}
	//	cout << "Average (48-59): " << aver1 << endl;
	//	cout << "Average (65-90): " << aver2 << endl;
	//	cout << "Maximum: " << max << endl;
	//	cout << "Minimum: " << min << " (index: " << min_index << ")" << endl;
	//	cout << "Average number " << count1 << " " << count2 << endl;
	//delete[] int_arr1;
	//delete[] int_arr2;
	//delete[] char_arr1;
	//delete[] char_arr2;
	//delete[] float_arr1;
	//delete[] float_arr2;
    cout <<"<form  action='../cgi-bin/01.cgi'   target='_self' method='get'>"<<endl;
    cout <<"Количество элементов  массива: <input type='Text' name='number' value='0'   size=6 >"<<endl;
    cout <<"<br><input type='submit' name='submit' value='Отправить'>"<<endl;
    cout << "</body>\n";
    cout << "\n</html>\n";   
    return 0;
}