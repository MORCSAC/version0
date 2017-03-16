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


