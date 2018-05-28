% Solving for the rise and fall times for TOSA


Voltage = voltagetosa;
time = timetosa;
minV=min(voltagetosa);
maxV=max(voltagetosa);
NormVoltage = (voltagetosa-minV)/(maxV-minV);
sumthingrise=0;
countrise=0;
sumthingfall=0;
countfall=0;

for i =6:size(time)
   
  if(NormVoltage(i) > 0.1 & NormVoltage(i-1) <0.1)
       vartemp=ones(1,4);
       timetemp=ones(1,4);
       for j=1:4
           vartemp(j)=NormVoltage(i+j-2);
           timetemp(j)=time(i+j-2);
           
           
           
       end
       p22 = polyfit(timetemp,vartemp,3);
       p22(4)=p22(4)-0.1;
      
       roots1=roots(p22);
       max22=timetemp(4);
       min22=timetemp(1);
       for i=1:3
           if roots1(i)<max22 & roots1(i)>min22 & imag(roots1(i))==0
                time1=roots1(i)
            end
        end     
      
       
       p22 = polyfit(timetemp,vartemp,3);
       p22(4)=p22(4)-0.9;
      
       roots1=roots(p22);
       max22=timetemp(4);
       min22=timetemp(1);
       for i=1:3
           if roots1(i)<max22 & roots1(i)>min22 & imag(roots1(i))==0
                time2=roots1(i)
            end
        end 
       risetime=time2-time1;
       sumthingrise=sumthingrise+risetime;
       countrise=countrise+1;
       
    
   end
   
   if(NormVoltage(i) <0.9 & NormVoltage(i-1) >0.9)
       vartemp=ones(1,4);
       timetemp=ones(1,4);
       for j=1:4
           a=11;
           vartemp(j)=NormVoltage(i+j-2);
           timetemp(j)=time(i+j-2);
           
           
           
       end
       p22 = polyfit(timetemp,vartemp,3);
       p22(4)=p22(4)-0.9;
      
       roots1=roots(p22);
       max22=timetemp(4);
       min22=timetemp(1);
       for i=1:3
           if roots1(i)<max22 & roots1(i)>min22 & imag(roots1(i))==0
                time1=roots1(i);
            end
        end     
      
       
       p22 = polyfit(timetemp,vartemp,3);
       p22(4)=p22(4)-0.1;
      
       roots1=roots(p22);
       max22=timetemp(4);
       min22=timetemp(1);
       for i=1:3
           if roots1(i)<max22 & roots1(i)>min22 & imag(roots1(i))==0
                time2=roots1(i);
            end
        end 
       falltime=time2-time1;
       sumthingfall=sumthingfall+falltime;
       countfall=countfall+1;
       
    
   end
   
  
end 
  
avgrisetime=sumthingrise/countrise

  
avgfalltime=sumthingfall/countfall


