namespace :example_task do 
    desc 'Greeting message task'

    task greeting_the_user: :environment do 
        puts 'Hello User ! Welcome to the rake world! '
    end 

    task greeting_the_user_for_second_time: :environment do 
        puts 'Hello User ! Welcome to the rake world! lorem span'
    end 
end

# rails db:migrate
# rails example_task:greeting_the_user
# rails example_task:greeting_the_user_for_second_time