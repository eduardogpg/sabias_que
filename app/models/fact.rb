# == Schema Information
#
# Table name: facts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  real        :boolean          default(TRUE)
#  provable    :boolean          default(FALSE)
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#  user_id     :integer
#

class Fact < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  before_create :set_color
  before_create :set_code
  
  belongs_to :user

  has_many :fact_tags
  #has_many :tags, through: :fact_tags

  def self.create_fact_with_params(user, params, tags)
    fact = Fact.new(user:user, title:params[:title], description:params[:description])
    FactTag.generate_new_tags_by_fact(fact, tags) if fact.save
    fact
  end

  def is_real?
    !real.nil? && real
  end

  def real_format
    if self.is_real? then 'Verdadero' else 'Falso' end
  end

  def tags
    Tag.tags_by_fact(self)
  end

  private
    def generate_code
      SecureRandom.uuid
    end

    def set_code
      self.code = generate_code
    end

    def set_color
      self.color ||= '#7B62CB'
    end

end
