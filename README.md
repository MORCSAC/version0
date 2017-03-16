To set up your ruby on rails envirnoment (WINDOWS or Mac), download the package in this link which contains almost evreything you need to build and run your ROR project: http://railsinstaller.org/fr-FR

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
	
	
    
