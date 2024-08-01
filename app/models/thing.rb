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
#  owner_id            :integer
#  parent_id           :integer
#
class Thing < ApplicationRecord
end
