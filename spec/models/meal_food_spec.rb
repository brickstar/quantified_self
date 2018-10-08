require 'rails_helper'

describe MealFood, type: :model do
  describe 'Validations' do
    it { should belong_to :meal }
    it { should belong_to(:food).counter_cache :times_eaten }
  end
end
