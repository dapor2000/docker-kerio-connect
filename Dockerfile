# Based on Ubuntu                                                                                                                                                                                            
############################################################                                                                                                                                                 
                                                                                                                                                                                                             
# Set the base image to Ubuntu                                                                                                                                                                               
FROM ubuntu                                                                                                                                                                                                  
                                                                                                                                                                                                             
# File Author / Maintainer                                                                                                                                                                                   
MAINTAINER Frank Wagener <docker@dapor.de>                                                                                                                                                                   
                                                                                                                                                                                                             
                                                                                                                                                                                                             
# Update the repository sources list                                                                                                                                                                         
RUN apt-get update -q                                                                                                                                                                                        
RUN apt-get upgrade -qy                                                                                                                                                                                      
RUN apt-get install lsof sysstat wget openssh-server supervisord -qy                                                                                                                                                                   
RUN echo "wget http://download.kerio.com/dwn/kerio-connect-linux-64bit.deb" > dl.sh                                                                                                                          
RUN chmod +x dl.sh                                                                                                                                                                                           
RUN ./dl.sh                                                                                                                                                                                                  
################## BEGIN INSTALLATION #########################                                                                                                                                              
RUN dpkg -i kerio-connect-linux-64bit.deb                                                                                                                                                                    
#RUN echo "ulimit -c unlimited"  > /run_kerio.sh                                                                                                                                                             
#RUN echo "ulimit -s 2048 "   >> /run_kerio.sh                                                                                                                                                               
#RUN echo "ulimit -n 10240" >> /run_kerio.sh                                                                                                                                                                 
#RUN echo "/run_kerio.sh" >> /run_kerio.sh                                                                                                                                                                   
RUN echo "/opt/kerio/mailserver/kmsrecover /backup/" >> /kerio-restore.sh                                                                                                                                    
#RUN echo "/opt/kerio/mailserver/mailserver /opt/kerio/mailserver" >> /run_kerio.sh                                                                                                                           
COPY sleep.sh /tmp/      
COPY /etc/supervisor/conf.d/supervisord.conf  /etc/supervisor/conf.d/supervisord.conf 
RUN chmod +x /tmp/sleep.sh                                                                                                                                                                                   
RUN echo "/tmp/sleep.sh" >> /run_kerio.sh                                                                                                                                                                    
                                                                                                                                                                                                             
#RUN chmod +x /run_kerio.sh                                                                                                                                                                                   
RUN chmod +x /kerio-restore.sh                                                                                                                                                                               
##################### INSTALLATION END #####################                                                                                                                                                 
# Expose the default port  only 4040 is nessecary for admin access                                                                                                                                           
                                                                                                                                                                                                             
EXPOSE 4040  25 465 587 110 995 143 993 119 563 389 636 80 443 5222 5223                                                                                                                                     
                                                                                                                                                                                                             
VOLUME /backup                                                                                                                                                                                               
# Set default container command                                                                                                                                                                              
#ENTRYPOINT /opt/kerio/mailserver/mailserver /opt/kerio/mailserver                                                                                                                                           
#ENTRYPOINT /run_kerio.sh    
ENTRYPOINT 
