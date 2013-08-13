class Vote < ActiveRecord::Base
  # NOTE: Votes belong to a user
  belongs_to :user
  belongs_to :voteable, :polymorphic => true, :touch => true

  scope :find_votes_cast_by_user, lambda { |user| where(:user_id => user.id).order("created_at DESC") }
  scope :for, where(:voting => true)
  scope :against, where(:voting => false)
end
