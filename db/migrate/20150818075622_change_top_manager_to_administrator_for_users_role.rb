class ChangeTopManagerToAdministratorForUsersRole < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.where(role: 'top_manager').update_all(role: 'administrator')
  end

  def down
    User.where(role: 'administrator').update_all(role: 'top_manager')
  end
end
