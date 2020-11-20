require 'rails_helper'

RSpec.describe Project, type: :model do
  Project.delete_all
  User.delete_all

  let!(:user) { User.create(email: 'test@test.co', password: '123456') }
  let!(:valid_project) { Project.create(name: 'Test', description: 'test', user_id: user.id) }
  let!(:invalid_project) { Project.create(name: 'Test', description: 'test', user_id: nil) }
  let!(:invalid_project1) { Project.create(name: '', description: 'test', user_id: nil) }

  context 'Valid project' do
    it 'validates presence of user_id' do
      expect(valid_project).to be_valid
    end
  end

  context 'Invalid project' do
    it 'validates presence of user_id' do
      expect(invalid_project).to be_invalid
    end

    it 'validates presence of name' do
      expect(invalid_project1).to be_invalid
    end
  end
end
