# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe Task, type: :model do
  Project.delete_all
  User.delete_all
  Task.delete_all

  let!(:user) { User.create(email: 'test@test.co', password: '123456') }
  let!(:project) { Project.create(name: 'Test', description: 'test', user_id: user.id) }
  let!(:valid_task) { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: project.id, status: 'complete', priority: 'low-priority') }
  let!(:invalid_task) { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: nil, status: 'complete', priority: 'low-priority') }
  let!(:invalid_task1) { Task.create(title: '', description: 'test', date: '2020-11-20', project_id: nil, status: 'complete', priority: 'low-priority') }

  context 'Valid task' do
    it 'validates presence of project_id' do
      expect(valid_task).to be_valid
    end
  end

  context 'Invalid task' do
    it 'validates presence of project_id' do
      expect(invalid_task).to be_invalid
    end

    it 'validates presence of title' do
      expect(invalid_task1).to be_invalid
    end
  end
end

# rubocop:enable Layout/LineLength
