class Errors
  
  def initialize
    @errors = {}
  end
  
  def add(attribute, msg)
    @errors[attribute.to_s] = [] if @errors[attribute.to_s].nil?
    @errors[attribute.to_s] << msg
  end
  
  def on(attribute)
    ers = @errors[attribute.to_s]
    return nil if ers.nil?
    ers.size == 1 ? ers.first : ers
  end
  
  def empty?
    @errors.empty?
  end
  
  def clear
    @errors.clear
  end
  
end