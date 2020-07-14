require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:article_categories) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end