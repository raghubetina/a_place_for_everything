# == Schema Information
#
# Table name: things
#
#  id                     :bigint           not null, primary key
#  ancestry               :string
#  can_contain_things     :boolean
#  contained_things_count :integer          default(0)
#  description            :text
#  embedding              :vector(2000)
#  exclude_from_search    :boolean
#  image                  :string
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

  has_neighbors :embedding

  belongs_to :owner, class_name: "User"

  has_many :contained_things, class_name: "Thing", foreign_key: "container_id"
  belongs_to :container, class_name: "Thing", counter_cache: :contained_things_count, optional: true

  validates :name, presence: true

  before_save :set_embedding

  mount_uploader :image, ImageUploader

  def set_embedding
    client = OpenAI::Client.new(
      access_token: ENV.fetch("OPENAI_KEY")
    )

    response = client.embeddings(
      parameters: {
        model: "text-embedding-3-large",
        dimensions: 2000,
        input: self.name
      }
    )

    self.embedding = response.dig("data", 0, "embedding")
  end
end
