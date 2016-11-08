require 'date'

class Horarios
  def self.resolver h
    return DateTime.strptime(h, '%H:%M')
  end

  def agora
    return resolver("#{Time.now.hour}:#{Time.now.min}")
  end
end
