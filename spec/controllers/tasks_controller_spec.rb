# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  Project.delete_all
  User.delete_all

  let!(:user) { User.create(email: 'test@test.co', password: '123456') }
  let!(:project) { Project.create(name: 'Test', description: 'test', user_id: user.id) }
  let!(:valid_task) { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: project.id, status: 'complete', priority: 'low-priority') }
  let!(:invalid_task) { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: nil, status: 'complete', priority: 'low-priority') }

  describe '#create' do
    context 'Valid task' do
      it 'checks if the task can be created' do
        expect(valid_task).to be_valid
      end
    end
  end

  it 'creates the task if valid' do
    expect { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: project.id, status: 'complete', priority: 'low-priority') }.to change(Task, :count).by(+1)
    expect(response).to have_http_status(:ok)
  end

  context 'Invalid task' do
    it 'checks if the task cannot be created' do
      expect(invalid_task).to be_invalid
    end

    it 'does not create the tweet if invalid' do
      expect { Task.create(title: 'Test', description: 'test', date: '2020-11-20', project_id: nil, status: 'complete', priority: 'low-priority') }.not_to change(Task, :count)
    end
  end

  describe '#destroy' do
    it 'removes the task if exists' do
      expect { valid_task.delete }.to change(Task, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'removes the task if exists' do
      expect { invalid_task.delete }.not_to change(Task, :count)
    end
  end

  describe '#update' do
    it 'updates the task if exists' do
      invalid_task.update(project_id: project.id)
      expect(invalid_task).to be_valid
      expect(response).to have_http_status(:success)
    end
  end
end

# rubocop:enable Layout/LineLength
