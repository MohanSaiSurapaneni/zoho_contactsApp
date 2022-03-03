# zoho_interview

This is a web Application.

Tech Stack:
	Front-end :- html5,css3,javascript,jquery;
	back-end :- jsp;
	database :- oracle 11g express;

Note:-
	As we have used jsp, we need to have tomcat server installed on our device to run jsp pages.
	and oracle 11g express also should be installed.
	
Initial steps (mandatory):

	After installing oracle database,
	create a new user named "mohan" with password "root" and grant him all privileges,
	by following the below steps,
		
		1) create user:
		
			CREATE USER mohan IDENTIFIED BY root;
		
		2) grant all privileges
		
			Grant all privileges to mohan;
			
	Now, connect to the database with user name "mohan" and password "root".
	
	Create a table named "ZOHOUSERS" using the following command
	
	CREATE TABLE ZOHOUSERS (
	
		email varchar(35) unique not null,
		password varchar(20),
		secretcode varchar(20),
		contactstable varchar(30) unique not null
		
	);
	
	
	one more important point,
		by default oracle database takes port number "8080",
		so we should not have same port number for tomcat server.
		we can choose any other port number like "8040" 0r "4040" etc ..
	
	finally clone or past the project folder which is "zoho_contactsApp" in the "webapps" folder of tomcat,
	
		--> "C:\Apache Software Foundation\Tomcat 10.0\webapps"
		
		
		
		
		
		
	
Now we are all set to run the Zoho contacts app (web Application).

As it is web app, we can run it in browser,

steps to run the application,

1) First, start the tomcat server,

2) open any web browser of your choice.

3) past the url in address bar, 
	
	"http://localhost:8040/zoho_contactsApp/signin.jsp"

	