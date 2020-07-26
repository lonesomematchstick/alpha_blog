require 'rails_helper'
include ControllerMacros

RSpec.describe CategoriesController, type: :controller do

  let!(:category) { create(:category) }
  let!(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }

  context "Not logged in" do
    describe ":index" do
      it "should get index" do
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe ":show" do
      it "should get show" do
        get :show, params: {id: category.id}
        expect(response.status).to eq(200)
      end
    end

    describe ":new" do
      it "should NOT get new" do
        get :new
        expect(response.status).to eq(302)
        expect(response).to redirect_to(categories_path)
      end
    end

    describe ":create" do
      it "should NOT allow create" do
        post :create, params: { category: { name: "New Category!" } }
        expect(response.status).to eq(302)
        expect(response).to redirect_to(categories_path)
      end
    end
  end

  context "General User" do
    describe ":index" do
      it "returns 200 status code - success" do
        login(user)
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe ":show" do
      it "should get :show" do
        login(user)
        get :show, params: {id: category.id}
        expect(response.status).to eq(200)
      end
    end

    describe ":new" do
      it "should NOT get :new" do
        login(user)
        get :new
        expect(response.status).to eq(302)
        expect(response).to redirect_to(categories_path)
      end
    end

    describe ":create" do
      it "should NOT post :create" do
        login(user)
        current_count = Category.all.count
        post :create, params: { category: { name: "New Category!" } }
        expect(Category.all.count).to eq(current_count)
        expect(response.status).to eq(302)
        expect(response).to redirect_to(categories_path)
      end
    end
  end

  context "Admin" do
    describe ":index" do
      it "returns 200 status code - success" do
        get :index
        expect(response.status).to eq(200)
      end
    end

    describe ":show" do
      it "should get :show" do
        get :show, params: {id: category.id}
        expect(response.status).to eq(200)
      end
    end

    describe ":new" do
      it "should NOT get :new" do
        login(admin)
        get :new
        expect(response.status).to eq(200)
      end
    end

    describe ":create" do
      it "should post :create" do
        login(admin)
        current_count = Category.all.count
        post :create, params: { category: { name: "New Category!" } }
        expect(Category.all.count).to eq(current_count + 1)
      end
    end
  end
end
