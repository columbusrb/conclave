# Conclave ![Travis Status](https://secure.travis-ci.org/columbusrb/conclave.png)

Conclave is a web forum application that the Columbus Ruby Brigade is crafting. It is released under the MIT license.

The project was started on 9/8/2012 and is under development. It is not recommended to use at this point.

This project will start as a Rails application, but once approaching release we'll repackage as a gem that will integrate into an existing Rails application.

## Goals
1. Teach the beauty of the Ruby and Rails stack
2. Lower the Open Source contribution barrier
4. Release useful, working software.

## Tools
* Web Host - [Heroku][1]
* Ruby (1.9.2) - [Ruby][2]
* Web Framework - [Rails][3]
* Testing Frameworks - [RSpec][13] & [Cucumber][14]
* Local Database - [PostgreSQL][4]
* Templating language - [Slim][5]
* Javascript Library - [jQuery][6]
* CSS Framework - [Compass-Rails][7]
* Form Helper - [SimpleForm][8]
* Authentication - [Devise][9]
* Authorization - [CanCan][10]
* File Upload - [Paperclip][11]
* Admin Panel - [ActiveAdmin][12]

## Services
* [Travis CI][15]
* User Avatars - [Avatars.io][16]

[1]:http://heroku.com
[2]:http://www.ruby-lang.org/en/
[3]:http://rubyonrails.org/
[4]:http://www.postgresql.org/
[5]:https://github.com/stonean/slim
[6]:http://jquery.com/
[7]:https://github.com/Compass/compass-rails
[8]:https://github.com/plataformatec/simple_form
[9]:https://github.com/plataformatec/devise
[10]:https://github.com/ryanb/cancan
[11]:https://github.com/thoughtbot/paperclip
[12]:http://activeadmin.info/
[13]:http://rspec.info/
[14]:http://cukes.info/
[15]:http://travis-ci.org/#!/columbusrb/conclave
[16]:http://avatars.io

## How to contribute
All contributions are welcome! Please follow these steps for easy contributions:

1. Clone the repo locally
2. Implement your code changes
3. Test your changes -- I'm more concerned with testing the **intent** of your code, not it's **implementation**. If it's a smallish change, write a unit test or two. If it's a larger feature, we'll need a Cucumber scenario(s).
4. Submit a Pull Request on Github!

## How to test
    rake db:test:create
    rake db:test:clone
    rake

## How to install and run the app locally

**Install PostgreSQL**


If you're on a Mac, easy mode is installing via Homebrew:

```bash
brew install postgresql
```

Otherwise follow the distribution specific instructions on the [PostgreSQL Download Site](http://www.postgresql.org/download/). 


**Clone the repo locally**  
Download and install a copy "clone" of the application on your own computer.  
At the command prompt in your terminal window, type (or copy and paste) the repo address and hit enter.

```bash
$ https://github.com/columbusrb/conclave.git
```

This will create a new folder named conclave and download the app into that folder.  Once all of the files are downloaded, switch to the conclave folder.

```bash
$ cd conclave
```
**Install all of the required Gems**  
At the command prompt in your terminal window, type the following command and hit enter.

```bash
[conclave]$ bundle install
```

**Run all of the migrations**  
At the command prompt in your terminal window, type the following command and hit enter.

```bash
[conclave]$ rake db:migrate
```

**Generate initial User accounts and starter data**  
At the command prompt in your terminal window, type the following command and hit enter.

```bash
[conclave]$ rake db:seed
```

This will create three User accounts. This first two are User accounts with the role "contributor." The third is a User account with the role "admin."  
1. user@exmaple.com with "please" as the password  
2. user2@example.com with "please" as the password  
3. admin@example.com with "password" as the password  

**Fire it up!**  
Start the server on your computer.  
At the command prompt in your terminal window, type the following command and hit enter.

```bash
[conclave]$ rails server
```

After you hit enter, you'll see something like this in the terminal window which lets you know the server is running. 

```bash
=> Booting WEBrick
=> Rails 3.2.8 application starting in development on http://0.0.0.0:3000
=> Call with -d to detach
=> Ctrl-C to shutdown server
[2012-10-18 04:42:01] INFO  WEBrick 1.3.1
[2012-10-18 04:42:01] INFO  ruby 1.9.2 (2012-04-20) [x86_64-darwin11.4.2]
[2012-10-18 04:42:01] INFO  WEBrick::HTTPServer#start: pid=2838 port=3000
```

**Open the App**  
Open a web browser, enter the web address for the local server and hit enter.

```
http://0.0.0.0:3000
```
**or**
```
http://localhost:3000
```

**Sign in to the App**  
In the upper right-hand corner of the home page, click Sign in.  Use one of the usernames listed above to sign in.
