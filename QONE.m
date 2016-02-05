clear all;
close all;

format long;
A=dlmread("Iris_data_norm_train.txt",",");
n=size(A);

x=A(1:n(2)-1);

w=inv(x'*x)*x'*class;

B=dlmread("iris_data_norm_test.txt",",");
num=size(B);

i=0;
error=0;
while(i<40)
	i=i+1;
	points=B(i,1:n(2)-1);
	final=w'*points';
	if((B(i,n(2))==1 && final<0) || (B(i,n(2))==-1 && final>0))
		error++;
	endif
endwhile

printf("\n Number of errors are: ");
error
error_rate=(error/40)*100;
printf("\n Error rate: ");
error_rate
