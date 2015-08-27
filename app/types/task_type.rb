class TaskType < Task
  include BaseType

  validates :project, inclusion: { in: :available_projects, allow_nil: true }

  def available_projects
    ProjectPolicy::Scope.new(creator, Project).resolve
  end
end
