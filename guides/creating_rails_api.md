## Command line for creating new app
Type ````rails new freelance_camp_documents --api -T -d postgresql````

Create the database ````rails db:create````

Use a scaffold ````rails g scaffold FreelanceDocument title:string description:string file_url:text image_url:text````

Migrate ````rails db:migrate````

Enable CORS gem in the gemfile and then uncomment the section in initializers/cors.rb
