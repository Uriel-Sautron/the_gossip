class Comment < ApplicationRecord
  belongs_to :gossip
  validates :username,
    presence: true
    validates :content,
    presence: true
end
