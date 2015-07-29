class Project < ActiveRecord::Base
  has_many :tasks

  def to_s
    title
  end
end
