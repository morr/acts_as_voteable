# ActsAsVoteable

Allows user to vote on the on models.


## Install

**Run the following command:**

In Gemfile:

gem 'acts_as_voteable', '~> 0.0.3', :git => 'https://github.com/zonecheung/acts_as_voteable.git'

**Create a new rails migration**

rails generate acts_as_voteable_migration

or manually:

```ruby
def self.up
  create_table :votes do |t|
    t.boolean :voting, :default => false
    t.datetime :created_at, :null => false
    t.references :voteable, :polymorphic => true
    t.references :user
  end

  add_index :votes, :voteable_type
  add_index :votes, :voteable_id
  add_index :votes, :user_id
end

def self.down
  drop_table :votes
end
```


## Usage

Make you ActiveRecord model act as voteable.

```ruby
class Model < ActiveRecord::Base
  acts_as_voteable
end
```


## Credits

Xelipe - This plugin is heavily influenced by Acts As Commentable.


## More

http://juixe.com/techknow/index.php/2006/06/24/acts-as-voteable-rails-plugin/  
http://juixe.com/svn/acts_as_voteable
