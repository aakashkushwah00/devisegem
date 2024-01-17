class CrudNotificationMailer < ApplicationMailer


  def create_notification(object)
    @object = object 
    @object_count = object.class.count

    mail to: 'yuvraj.chouhan@codiatic.com ', subject: " A new for #{object.class} has been created. "
    
  end

  def update_notification(object)
    @object = object 
    @object_count = object.class.count

    mail to: 'yuvraj.chouhan@gmail.com', subject: " An entry for #{object.class} has been updated. "
    
  end

 
  def delete_notification(object)
    @object = object 
    @object_count = object.class.count

    mail to: 'yuvraj.chouhan@gmail.com', subject: " An entry for #{object.class} has been deleted. "
    
  end
end
