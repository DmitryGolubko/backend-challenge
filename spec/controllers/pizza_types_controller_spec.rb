require 'rails_helper'

RSpec.describe PizzaTypesController, type: :controller do
  let(:user) { create(:user) }

  describe 'Unauthorized GET #index' do
    before { get :index }
    include_examples 'response with Redirect status'
  end

  describe 'User with client role GET #index' do
    before do
      sign_in user
      get :index
    end
    include_examples 'response with Not Found status'
  end

  let(:admin) { create(:admin_user)}

  describe 'User with admin role GET #index' do
    before do
      sign_in admin
      get :index
    end
    include_examples 'response with Success status'
  end
end
