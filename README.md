# Setup this app on local

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

### Requirements
* Apache local server
* Php 7+
* localhost:3000 must be available
* MySQL database

### First thing First
1 please check the .env file and make changes according to your requirements.
`REACT_APP_API_ENDPOINT` set endpoint as your localhost running e.g if your local apache server running on http://localhost:2000 and with directory name it look like this http://localhost:2000/NewsBlog (case sensitive). Then .env file configurations should look like this `REACT_APP_API_ENDPOINT=http://localhost:2000/NewsBlog` 

### Check backend settings
To run this project accurately please check config.php file located at `includes/config.php` 
there are some pre-define variables. most important one is `$projectDir` if you save this project in different directory please adjust this name in config.php 

### Database setup
#### Required Information
1 database name\
2 host\
3 database user\
4 password

sql dump is already in the project located at `dump/` directory. please import the data in your database then adjust the information in `/admin/includes/classes/dataAccessObject.php`

### Admin dashboard
Admin dashboard will be available at your apache localhost url http://localhost:yourport/admin/ \
For login use below mentioned information.\
URL: http://localhost:yourport/login.php \
username: admin\
password: 7NaaLi~qgwqWv93w

## Available Scripts to run front-end

In the project directory, you can run:

#### `npm start`

Run this command in your terminal and in your project directory and Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

Compiler watching the code so the page will reload when you make changes.\
You may also see any lint errors in the console.

#### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### Version 0.0.1
This is first version of simple blog and it consist very basic of simple blog. There are some new big features are in progress and will be release at end of April 2023.