#!/bin/bash
#read me carefully
#To verify apache2 installed properly ,type 'localhost' on web browser and run it
#To verify mysql installed  properly,type 'mysql -uroot -p' on ubuntu terminal
#To verify php installed properly,type 'php -v' on ubuntu terminal
#To verify phpmyadmin installed properly ,type 'localhost/phpmyadmin' on web browser and run it 
#If error encountered on terminal type 'sudo gedit /etc/apache2/apache2.conf'and paste 'Include /etc/phpmyadmin/apache.conf' on that opened file save it
foo="\n\nAborting..." #variable for msg
msg="Installing..."
#sudo apt-get update
CHK=$(echo $?)
if [ "$CHK" -eq 0 ] ; then
       
	 echo $msg.apache2 >out.txt
	 date >>out.txt
	 sudo apt-get install apache2
else
    	 echo $foo.initial update >out.txt
	 date >>out.txt
	
fi
if [ "$CHK" -eq 0 ] ; then
       
	 echo $msg.mysql server >>out.txt
	 date >>out.txt
	 sudo apt-get install mysql-server php5-mysql
	 sudo mysql_install_db
	
else
    	 echo $foo.apache2 >>out.txt
	 date >>out.txt
	
fi
if [ "$CHK" -eq 0 ] ; then
       
	 echo $msg.php >>out.txt
	 date >>out.txt
	 sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
else
    	 echo $foo.Mysql  >>out.txt
	 date >>out.txt
	
fi
if [ "$CHK" -eq 0 ] ; then
       
	 echo $msg.phpmyadmin >>out.txt
	 date >>out.txt
	 sudo apt-get -y install phpmyadmin
else
    	 echo $foo.php >>out.txt
	 date >>out.txt
	
fi
if [ "$CHK" -eq 0 ] ; then
       
	 echo apache restarting... >>out.txt
	 date >>out.txt
	 sudo service apache2 restart
else
    	 echo $foo.phpmyadmin >>out.txt
	 date >>out.txt
	
fi
