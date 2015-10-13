class DogConnection < ActiveRecord::Base
  belongs_to  :dog
  belongs_to  :following, class_name: :Dog
end
