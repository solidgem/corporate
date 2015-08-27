class TaskType < Task
  include BaseType

  attr_accessor :current_user

  validates :current_user, presence: true
  validates :project, inclusion: { in: :available_projects, allow_nil: true }

  def available_projects
    ProjectPolicy::Scope.new(current_user, Project).resolve
  end
end
