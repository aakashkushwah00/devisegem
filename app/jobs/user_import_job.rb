class UserImportJob < ApplicationJob
  queue_as :default

  def perform(hotel_id)
    
    # Do something later

    hotel = Hotel.find(hotel_id)
    users = User.where(id: hotel.users_ids)
    users.each do |uesr|
      User.create(name: user.name, email: user.email)
    end
  end
end
