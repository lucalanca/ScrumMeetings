class Project < ActiveRecord::Base
  attr_accessible :name, :github_repository
  validates :name, presence: true, uniqueness: true
end
