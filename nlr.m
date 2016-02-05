clear all;
close all;

format long;
[v1,v2,v3,v4,class]=textread("Iris_data_norm_train.txt","%f,%f,%f,%f,%f");

for i=1:1:110
	one(i)=1;
endfor
x=[one',v1,v2,v3,v4,v1.^2,v2.^2,v3.^2,v4.^2,v1.*v2,v2.*v3,v3.*v4,v4.*v1,v1.*v3,v2.*v4];
w=inv(x'*x)*x'*class;

[t1,t2,t3,t4,t5]=textread("iris_data_norm_test.txt","%f,%f,%f,%f,%f");

i=1;
error=0;
while(i<=40)
	points=[1,t1(i),t2(i),t3(i),t4(i),t1(i)^2,t2(i)^2,t3(i)^2,t4(i)^2,t1(i)*t2(i),t2(i)*t3(i),t3(i)*t4(i),t4(i)*t1(i),t1(i)*t3(i),t2(i)*t4(i)];
	final=w*points;
	if(t5(i)==1 && final<0)
		w=w+points;
	endif
	
	if(t5(i)==-1 && final>0)
		w=w-points;
	endif
	if((t5(i)==1 && final<0) || (t5(i)==-1 && final>0))
		error++;
	endif
	i=i+1;
endwhile
w
