class Captcha
    
  attr_accessor :value, :actualValue
  
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
  
  def errors
    @errors ||= Errors.new
  end
  
  def validate
    errors.clear
    if @value.upcase != actualValue
      errors.add(:value,"Captcha does not match!")
      regenerate  # regenerate captcha if it's not valid, so the user will see a new one afterward
    end

    return errors.empty?
  end
  
end
