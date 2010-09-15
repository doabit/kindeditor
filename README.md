Rails KindEditor integration plugin with paperclip support for rails3 Rc,it supports  active_record and mongoid!
--------------
[Kindeditor](http://www.kindsoft.net "Kindeditor") is a open source HTML visual editor ,it can work good in  IE, Firefox, Chrome, Safari.and it has become one of the most popular editor in China.

KindEditor version: 3.5.1 zh-cn [Kindeditor](http://kindeditor.googlecode.com/files/kindeditor-3.5.1-zh_CN.zip "Kindeditor")


Require:
---------------
- Rails3
- Paperclip(if you use mongoid,make sure your paperclip can work in mongoid,you can edit paperclip.rb in config/initializers)

  Paperclip.options[:log] = false  

Install
---------------
- As a plugin 

  rails plugin install git://github.com/doabit/kindeditor.git

- As a gem
  
   sudo gem install kindeditor

- copy files .

  rails g kindeditor:install

Usage
--------------
- kindeditor helper to layout that you want to use it

  <%=kindeditor_javacript_include_tag%>

- add a id "kindeditor" to your textarea

Support options
--------------
:orm ,default 'active_record'

Custom
--------------
The install generator will copy kindeditor_controller.rb to app/controllers , kindeditor_image.rb to app/mondels and kindeditor folder to public/javascripts.

If you want to mondify the Kindeditor items,you can open public/javascripts/kindeditor/kindeditor_config.js,and modify it for yourself.

update:

if you want to use for diffrent layout and you want to custom yourself,you can add args for kindeditor_javacript_include_tag
and you can add cache option to it.defaut :cache=>false
eg:

<%=kindeditor_javacript_include_tag("kindeditor/my_config","cosutom",:cache=>true)%>

then it will use your config and will not use defauot config in kindeditor folder.

TODOs
--------------
Add images paginate

Support CarrierWave

Example Use:
---------------
1. Create CRUD for post

   rails generate scaffold post title:string body:text
  
   Run Migrations

2. rake db:migrate

3. Add following line to application.html.erb

    <%=kindeditor_javacript_include_tag%>
  
4. Modify views/posts/_form.html.erb

    <%= f.text_area :body,:id => "kindeditor" %>


Contributors
---------------------
any sugestions? doinsist at gmail.com 

released under the MIT license
