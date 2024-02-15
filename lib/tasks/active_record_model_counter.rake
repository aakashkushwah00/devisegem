namespace :active_record_model_counter do
  desc "Display the count of Room model"
  task room_counter: :environment do
    puts "Room count #{Room.count}"
  end

  desc "Display the count of Hotel model"
  task hotel_counter: :environment do
    puts "Hotel count #{Hotel.count}"
  end

  desc "Display the count of employee model"
  task employee_counter: :environment do
    puts "Employee count #{Employee.count}"
  end

end

# rails active_record_model_counter:room_counter

# rails active_record_model_counter:hotel_counter

# rails active_record_model_counter:employee_counter
