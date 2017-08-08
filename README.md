Training on Rails
===
#####Created by Tan Chin Siang

Ruby version
Ruby: 2.4.0  
Installation requirements  
---
Install Rails(mac): http://railsapps.github.io/installrubyonrails-mac.html  
Install Rails(Windows 10): https://gorails.com/setup/windows/10  
* ruby

* rails

* gem

* bundler

Database creation  
---

`rails g model model_name column:type column:type column:type`  

`rails g model Comment username:string body:text post:references  
references: foreign key to Post`  

Database initialization  
---
`rails db:migrate`  

Deployment instructions  
---
Run Server: `rails s`   
Check route: `rake routes`   
Create controller: `rails g controller Comment`   
Destroy controller: `rails d controller Comment`   
Create model: `rails g model Comment`   
Destroy model: `rails d model Comment`   
Create html: index.html.erb   

##Validation
models/post.rb
sets title with minimum length of 5.
