function QTWO(perc);
format long;
A=dlmread("merge.txt",",");
n=size(A);
for k= 1:1:n(2)-1
	w(k)=rand*1000;
endfor
for k= 1:1:100
	ein(k)=0;
	eout(k)=0;
endfor

k=1;
perc=perc*150/100;
while(k<=100)
i=1;
while(i<=perc)
	P=A(i,1:n(2)-1);
	result=w*P';

	if(A(i,n(2))==1 && result<0)
		w=w+P;
	endif
	
	if(A(i,n(2))==-1 && result>0)
		w=w-P;
	endif

	if((A(i,n(2))==-1 && result>0)||(A(i,n(2))==1 && result<0))
		ein(k)++;
	endif
	i=i+1;
endwhile

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
