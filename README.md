To set up your ruby on rails envirnoment (WINDOWS or MAC), download the package in this link which contains almost evreything you need to build and run your ROR project: http://railsinstaller.org/fr-FR

For Linux : 
  The first step install depencies for Ruby by typing : 
  
			sudo apt-get update
			sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs
  Then : 
  
		cd
		wget http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz
		tar -xzvf ruby-2.3.3.tar.gz
		cd ruby-2.3.3/
		./configure
		make
		sudo make install
		ruby -v
	
after that :
	
		gem install bundler
	
	
Installing ruby on rails : 

	gem install rails -v 5.0.1
	
then type : 

	bundle install 


Running the app

	$ git clone https://github.com/MORCSAC/version0.git
	$ cd version0-master
	$ bundle install
	$ rake db:setup
	$ rails s -b 0.0.0.0

You should then be able to open http://localhost:3000 in your browser.


In your /config/environments/environment.rb, you must be sure to set "config.action_mailer.smtp_settings" variable to be able to send emails via STMP from your application.
So you will have to make-sure in your app that you have in your environment file  something like this :

	config.action_mailer.smtp_settings = {
	
      	address:"smtp.gmail.com",      - Allows you to use a remote mail server
    	port:587,		       -On the off chance that your mail server doesn't run on port 25, you can change it.
    	domain:"domain.of.sender.net"  -If you need to specify a HELO domain, you can do it here.
    	authentication: "plain",       -specify the authentication type here. :plain(will send the password Base64 encoded)
    	user_name:"dave",	       - If your mail server requires authentication, set the username in this setting.
    	password:"secret", 	       -Your email password
    	enable_starttls_auto: true     - Detects if STARTTLS is enabled in your SMTP server.Defaults to true.
	
	}


