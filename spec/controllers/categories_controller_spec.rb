require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let!(:category) { create(:category) }


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
    it "should get :new" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe ":create" do
    it "should post :create" do
      current_count = Category.all.count
      post :create, params: { category: { name: "New Category!" } }
      expect(Category.all.count).to eq(current_count + 1)
    end
  end

  # describe ":update" do
  #   it "should put :update" do
  #     put :update, params: valid_category_params.merge(id: category.id)
  #     expect(response.status).to eq(200)
  #   end
  # end

end
