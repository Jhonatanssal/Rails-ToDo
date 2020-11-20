require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  Project.delete_all
  User.delete_all

  let!(:user) { User.create(email: 'test@test.co', password: '123456')}
  let!(:valid_project) { Project.create(name: 'Test', description: 'test', user_id: user.id)}
  let!(:invalid_project) { Project.create(name: 'Test', description: 'test', user_id: nil)}

  describe '#create' do
    context 'Valid project' do
      it 'checks if the project can be created' do
        expect(valid_project).to be_valid
      end
    end
  end

  it 'creates the project if valid' do
    expect { Project.create(name: 'Testing tweet', description: 'Testing', user_id: user.id) }.to change(Project, :count).by(+1)
    expect(response).to have_http_status(:ok)
  end

  context 'Invalid project' do
    it 'checks if the project cannot be created' do
      expect(invalid_project).to be_invalid
    end

    it 'does not create the tweet if invalid' do
      expect { Project.create(name: 'Testing project 1', user_id: nil) }.not_to change(Project, :count)
    end
  end

  describe '#destroy' do
    it 'removes the project if exists' do
      expect { valid_project.delete }.to change(Project, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'removes the tweet if exists' do
      expect { invalid_project.delete }.not_to change(Project, :count)
    end
  end

  describe '#update' do
    it 'updates the project if exists' do
      invalid_project.update(user_id: user.id)
      expect(invalid_project).to be_valid
      expect(response).to have_http_status(:success)
    end
  end
end