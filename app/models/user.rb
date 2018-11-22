class User < ActiveRecord::Base
  belongs_to :drawnee, class_name: "User", foreign_key: :user_id

  has_one :drawn, class_name: "User", foreign_key: :user_id
end
