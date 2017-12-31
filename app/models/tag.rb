# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  validates :title, presence: true

  has_many :fact_tags
  has_many :facts, through: :fact_tags

  def self.get_or_create_by_tag(tag)
    self.where(title: Tag.title_format(tag)).first_or_create
  end
  
  def self.title_format(title)
    title.strip.downcase
  end

  def self.tags_by_fact(fact)
    self.joins(:fact_tags)
    .where('fact_tags.fact_id = ?', fact.id)
    .select('tags.id, tags.title')
  end

end

