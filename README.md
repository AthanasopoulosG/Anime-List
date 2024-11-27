#Anime-List


## Preview video on Youtube


[![SC2 Video](https://img.youtube.com/vi/FkGeAxukg5I/0.jpg)](http://www.youtube.com/watch?v=FkGeAxukg5I)

***************************************************************************
##Fast Install and run (No Database)
***************************************************************************
- Download apache-tomcat-9 version (tested and recommended) https://tomcat.apache.org/download-90.cgi
   and search for the Windows Service Installer .(search linux/mac installation proccess online)
- Copy error.png and rasengan.png inside ~\ Tomcat 9.0\webapps\docs\images and create a folder named
  "anime" for any additional image file.
- Copy anime-list.war file in ~\Tomcat 9.0\webapps\ (install directory of your tomcat server like above).
  Open browser type localhost:8080/anime-list and you are done and ready to go :}.

#In order to set up and run the .war file these steps must be taken first

1. Download java jre to compile files on server

2. Download apache-tomcat-9 version (tested and recommended) https://tomcat.apache.org/download-90.cgi
   and search for the Windows Service Installer .(search linux/mac installation proccess online)

3. Once tomcat is installed navigate to ( on my case )
   C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\docs\images  or wherever you installed
   tomcat server. Inside images folder add the error.png and rasengan.png images and create a folder called anime
   -- Warning --
   not doing this step will make the site work incorrectly and wont be able to access any images

4. In order to apply an image to an anime download the image and save it into the folder
   C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\docs\images\anime
   or save it wherever you like but later on it has to be dragged into the above folder to work.

5. ONLY FOR DATABASE PROJECT (myanime.war)
   
     I. Download MySql Workbench (im using v8) from https://www.mysql.com/products/workbench/ 
      (if you have knowledge of sql scripting you can use cmd too but Workbench makes it easier and faster)
  
     II. Open MySQL Workbench and create a new connection pressing on the + icon next to MySQL Connections
  
     III.  Click on administration on the down-left side of workbench and startup the instance.
  
     IV. Fill spaces with anything you want except for username and password since username must be "root"
       and password must be "roota" otherwise the programm wont be able to access database.(case sensitive)
  
      V. Once the connection is created double click it and create a new database called anime. 
       After that select anime database, press import on the menu bar and select the anime.sql file
       which was in the downloaded package from github. (case sensitive)
  
     VI. To skip step III a custom username and password can be put but a new .war must be created by 
       changing the values inside Hibernate.java file and exporting it again as .war. This step
       isnt recommended for a beginner or someone who hasnt any knowledge on programming because it 
       takes many steps to make it work which i wont mention except of that it needs an IDE like Eclipse
       and install tomcat server inside it.
  
6. The txt file (AnimeList.txt) created by the programm can be found in 
   C:\Program Files\Apache Software Foundation\Tomcat 9.0\ 

7. Last step would be to drag the .war file(s) into 
   C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\
   and with this everything should be done and you are ready to start using your own local Anime list.
   Type localhost:8080/myanime 	or  localhost:8080/anime-list depending on what you are using and 
   Enjoy it :}.


## Features and Functions
- Keep track of all series / movies you want to see, have seen or have paused to continue another time.
- Add new movie/series, delete or update an existing one.
- Add/Update information on each entry like:
   - Name (Unique)
   - Type (Movie/Series etc)
   - Genre (can select more than 1)
   - Image
   - Seasons (if it is divided in seasons and how many)
   - Status (Completed, Ongoing, On list to watch) for the user and not the series itself.
   - Personal Rating
- Filter shown entries based on status or genre
- After a successfull entry the user can add a summary or his personal notes for it.
- Home screen shows up to 5 random ongoing series that the user hasn't finished yet
- Option to display the entries in 3 different ways:
   - Block Display:  Big rectangular block that contains all info including summary and notes.
   - List Display: Small rectangular container which holds only the key information like name, genres, rating and status so that the user can list many entries simultaneously on screen.
   - Card Display: Card shaped container which displays more information than the list display but less than the block display.
- Search bar to search any entry-ies by name and return a list of entries (Use of substring in Name).
- Open source so anyone can modify the code however he pleases but isn't allowed to sell the end product.
- Responsive and flexible UI.
- Can run on any machine and linked to a protected database (Needs some knowledge of coding to make it work though)
- Can be easily be set up to a local network with the help of another app. I personaly have used XAMPP to have access to my database from any device inside my home including my mobile phone.


 


