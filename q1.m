clear all;
close all;

format long;
[v1,v2,v3,v4,class]=textread("Iris_data_norm_train.txt","%f,%f,%f,%f,%f");

x=[v1,v2,v3,v4];

w=inv(x'*x)*x'*class;

[t1,t2,t3,t4,t5]=textread("iris_data_norm_test.txt","%f,%f,%f,%f,%f");

i=0;
error=0;
while(i<40)
	i=i+1;
	points=[t1(i),t2(i),t3(i),t4(i)];
	final=w'*points';
	po=[t5(i)];
	if((t5(i)==1 && final<0) || (t5(i)==-1 && final>0))
		error++;
	endif
endwhile

printf("\n Number of errors are: ");
error
error_rate=(error/40)*100;
printf("\n Error rate: ");
error_rate
