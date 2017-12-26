class Fact < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  before_create :set_color
  before_create :set_code
    
  def is_real?
    !real.nil? && real
  end

  def real_format
    if self.is_real? then 'Verdadero' else 'Falso' end
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
