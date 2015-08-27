class TaskAccessProjectType < Task
  include BaseType

  validates :creator, presence: true
  validate :project_should_be_accessible

  def project_should_be_accessible
    if project.present? && creator.worker? && Project.for_worker(creator).exclude?(project)
      errors.add(:project, :project_not_accessible)
    end
  end
end
