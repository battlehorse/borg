class Captcha
  include ActiveModel::Validations
    
  attr_accessor :value, :actualValue
  
  validate :must_match_captcha
  
  def initialize
    regenerate
  end
  
  def regenerate
    @value = "" 
    @actualValue = ""
    5.times { @value << (rand(26)+65).chr }
  end

  def Captcha.fromParams(params)
    c = Captcha.new
    c.value = params[:value]

    return c
  end

  def must_match_captcha
    if @value != actualValue.upcase
      errors.add(:captcha, "does not match!")
      regenerate  # regenerate captcha if it's not valid, so the user will see a new one afterward
    end
  end
  
end
