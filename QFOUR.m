function QFOUR(perc);
format long;
A=dlmread("merge.txt",",");
n=size(A);
for k= 1:1:4
	w(k)=rand*1000;
endfor
for k= 1:1:100
	ein(k)=0;
	eout(k)=0;
endfor

k=1;
perc=perc*150/100;init=100000;
while(k<=100)
i=1;
while(i<=perc)
	P=A(i,1:n(2)-1);
	result=w*P';

	if((A(i,n(2))==-1 && result>0)||(A(i,n(2))==1 && result<0))
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
		P=A(l,1:n(2)-1);
		result=w*P';
		if(A(i,n(2))==1 && result<0)
			w=w+P;
		endif
		if(A(i,n(2))==-1 && result>0)
			w=w-P;
		endif
		l++;
	endwhile
endif
%
i=perc;
while(i<150)
	i=i+1;
	points=A(i,1:n(2)-1);
	final=w*points';
	if((A(i,n(2))==1 && final<0)||(A(i,n(2))==-1 && final>0))
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
print -djpg expe.jpg;
i=1;
while(i<=100)
temp(i)=i;
i++;
endwhile
save -text expe temp
save -append -text expe ein
save -append -text expe eout
