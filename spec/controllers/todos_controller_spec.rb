require 'spec_helper'

describe TodosController do

  describe 'RESTful API' do

    let(:user) { FactoryGirl.create :user_with_todos }

    context 'API access without api_key' do
      it 'should not allow access without api_key' do
        get :index, :format => :json
        response.status.should == 302
      end
    end

    context 'API access with invalid api_key' do
      it 'should not allow access with invalid api_key' do
        get :index, :format => :json, api_key: 'abc'
        response.status.should == 302
      end

      it 'should not allow to create todo' do
        -> {
          post :create, :format => :json, api_key: '123', title:'My todo'
          response.status.should == 302
        }.should_not change(user.todos, :count)
      end
    end

    context 'API access with valid api_key' do
      it 'should not allow access with valid api_key to other format than json' do
        get :index, api_key: user.api_key
        response.status.should == 406
      end

      it 'should allow access' do
        get :index, :format => :json, api_key: user.api_key
        response.status.should == 200
        JSON.parse(response.body).length.should == 5
      end

      it 'should allow to create todo' do
        -> {
          post :create, :format => :json, api_key: user.api_key, title:'My todo'
        }.should change(user.todos, :count).by 1
      end

      it 'should allow to create todo' do
        delete :destroy, :format => :json, api_key: user.api_key, id: user.todos.first.id
        user.todos.count.should == 4
      end

      it 'should allow to update todo' do
        put :update, :format => :json, api_key: user.api_key, id: user.todos.first.id, todo:{title: 'Updated title'}
        user.todos.first.title.should == 'Updated title'
      end
    end

  end
  
end