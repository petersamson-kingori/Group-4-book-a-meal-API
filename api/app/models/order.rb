class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_options


end
