require 'rails_helper'

RSpec.describe TaskRepository, type: :model do
 context '.for_user' do
   let(:task) { create :task }
   let(:user) { task.creator }
   it 'include user task. #39' do
     expect(Task.for_user(user)).to be_exists(id: task.id)
   end
 end
end
