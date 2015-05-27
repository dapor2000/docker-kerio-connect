# Based on Ubuntu
############################################################                                                                                                                                                 
                                                                                                                                                                
# Set the base image to Ubuntu                                                                                                                                                                               
FROM ubuntu

# File Author / Maintainer                                                                                                                                                                                   
MAINTAINER Frank Wagener <docker@dapor.de>
                                                       

# Update the repository sources list                                                                                                                                                                         
RUN apt-get update -q                                                                                                                                                                                        
RUN apt-get upgrade -qy                                                                                                                                                                                      
RUN apt-get install lsof sysstat wget  -qy
RUN echo "wget http://download.kerio.com/dwn/kerio-connect-linux-64bit.deb" > dl.sh
RUN chmod +x dl.sh
RUN ./dl.sh
################## BEGIN INSTALLATION #########################
RUN dpkg -i kerio-connect-linux-64bit.deb 
RUN echo "ulimit -c unlimited"  > /run_kerio.sh                                                                                                   
RUN echo "ulimit -s 2048 "   >> /run_kerio.sh                                                                                                   
RUN echo "ulimit -n 10240" >> /run_kerio.sh        
RUN echo "/opt/kerio/mailserver/kmsrecovery /backup/" >> /run_kerio.sh
RUN echo "/opt/kerio/mailserver/mailserver /opt/kerio/mailserver" >> /run_kerio.sh                                                                                            
RUN chmod +x /run_kerio.sh                                                                                                     
##################### INSTALLATION END #####################                                                                                                                                                 
# Expose the admin default port                                                                                                                                                                                    
EXPOSE 4040                                                                                                                                                                                         
VOLUME /backup
# Set default container command                                                                                                                                                                              
#ENTRYPOINT /opt/kerio/mailserver/mailserver /opt/kerio/mailserver                                                                                                                                           
ENTRYPOINT /run_kerio.sh                                                                                                                                                                                     
