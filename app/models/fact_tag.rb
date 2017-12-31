# == Schema Information
#
# Table name: fact_tags
#
#  id         :integer          not null, primary key
#  fact_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FactTag < ApplicationRecord
  belongs_to :fact
  belongs_to :tag

  validates :fact, presence: true
  validates :tag, presence: true

  def self.generate_new_tags_by_fact(fact, tags)
    tags.split(',').each { |tag| FactTag.create_by_fact(fact, tag) }
  end

  def self.create_by_fact(fact, tag)
    self.create(fact:fact, tag:Tag.get_or_create_by_tag(tag))
  end

end
