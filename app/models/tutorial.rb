class Tutorial < ActiveRecord::Base
  validates :name, presence: true
end
