# ActsAsVoteable
module Juixe
  module Acts #:nodoc:
    module Voteable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_voteable
          has_many :votes, :as => :voteable, :dependent => :destroy
          include Juixe::Acts::Voteable::InstanceMethods
          extend Juixe::Acts::Voteable::SingletonMethods
        end
      end

      # This module contains class methods
      module SingletonMethods
        def find_votes_cast_by_user(user)
          voteable_type = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s
          Vote.where(:voteable_type => voteable_type).find_votes_cast_by_user(user)
        end
      end

      # This module contains instance methods
      module InstanceMethods
        def cached_votes
          @cached_votes ||= self.votes.all
        end

        def votes_for
          self.cached_votes.select {|v| v.voting }.size
        end

        def votes_against
          self.cached_votes.select {|v| !v.voting }.size
        end

        # Same as voteable.votes.size
        def votes_count
          self.cached_votes.size
        end

        def users_who_voted
          self.cached_votes.map(&:user)
        end

        def voted_by_user?(user)
          self.cached_votes.any? { |v| user.id == v.user_id }
        end

        def voted_yes?(user)
          self.cached_votes.any? { |v| user.id == v.user_id && v.voting }
        end

        def voted_no?(user)
          self.cached_votes.any? { |v| user.id == v.user_id && !v.voting }
        end
      end
    end
  end
end
