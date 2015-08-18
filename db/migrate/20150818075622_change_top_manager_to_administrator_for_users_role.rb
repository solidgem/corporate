class ChangeTopManagerToAdministratorForUsersRole < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.find_each do |user|
      if user.role == 'top_manager'
        user.role = 'administrator'
        user.save!
      end
    end
  end

  def down
  end
end
