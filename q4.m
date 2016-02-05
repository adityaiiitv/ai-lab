clear all;
close all;

format long;
[v1,v2,v3,v4,class]=textread("merge.txt","%f,%f,%f,%f,%f");

for k= 1:1:4
	w(k)=rand*1000;
endfor
for k= 1:1:100
	ein(k)=0;
	eout(k)=0;
endfor

k=1;
perc=70;
perc=perc*150/100;init=100000;
while(k<=100)
i=1;
while(i<=perc)
	P=[v1(i),v2(i),v3(i),v4(i)];
	result=w*P';

	if((class(i)==-1 && result>0)||(class(i)==1 && result<0))
		ein(k)++;
	endif
	i=i+1;
endwhile
%
if(ein(k)<=init)
	init=ein(k);
	ein(k)=init;
	l=1;
	while(l<=perc)
		P=[v1(l),v2(l),v3(l),v4(l)];
		result=w*P';
		if(class(l)==1 && result<0)
			w=w+P;
		endif
		if(class(l)==-1 && result>0)
			w=w-P;
		endif
		l++;
	endwhile
endif
%
i=perc;
while(i<150)
	i=i+1;
	points=[v1(i),v2(i),v3(i),v4(i)];
	final=w*points';
	if((class(i)==1 && final<0)||(class(i)==-1 && final>0))
		eout(k)++;
	endif
endwhile
k++;
endwhile
plot(ein,"g")
hold on
plot(eout,"r")
hold off
title("Ein in Green / Eout in Red");
xlabel("EPOCH");
ylabel("Ein / Eout");
print -djpg image15.jpg;
i=1;
while(i<=100)
temp(i)=i;
i++;
endwhile
save -text report15 temp
save -append -text report15 ein
save -append -text report15 eout
