class Fact < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  before_create :set_color
  before_create :set_code
    
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
