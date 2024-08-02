# == Schema Information
#
# Table name: things
#
#  id                  :bigint           not null, primary key
#  can_contain_things  :boolean
#  description         :text
#  exclude_from_search :boolean
#  image_url           :string
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  container_id        :integer
#  owner_id            :integer
#
class Thing < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many  :contained_things, class_name: "Thing", foreign_key: "container_id"
  belongs_to :container, class_name: "Thing"

  validates :name, presence: true
end
