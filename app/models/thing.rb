# == Schema Information
#
# Table name: things
#
#  id                     :bigint           not null, primary key
#  ancestry               :string
#  can_contain_things     :boolean
#  contained_things_count :integer          default(0)
#  description            :text
#  exclude_from_search    :boolean
#  image_url              :string
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  container_id           :integer
#  owner_id               :integer
#
# Indexes
#
#  index_things_on_ancestry  (ancestry)
#
class Thing < ApplicationRecord
  has_ancestry

  belongs_to :owner, class_name: "User"

  has_many  :contained_things, class_name: "Thing", foreign_key: "container_id"
  belongs_to :container, class_name: "Thing", counter_cache: :contained_things_count, optional: true

  validates :name, presence: true

  def path_to_s
    path.pluck(:name).join(" > ")
  end
end
