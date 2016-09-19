require 'pry'
class PryExample
  pry = Pry.new
  pry.memory_size = 101
  pry.quiet = true

  def refresh(options={})
    defaults[:memory_size] = Pry.memory_size
    self.memory_size = options[:memory_size] if options[:memory_size]

    defaults[:quiet] = Pry.quiet
    self.quiet = options[:quiet] if options[:quiet]
  end

  def refresh(options={})
    defaults = {}
    attributes = [:input, :output, :commands, :print, :quiet, :memory_size]
    attributes.each do |attr|
      defaults[:attr] = Pry.send attr
    end
    defaults.merge!(options).each do |key, value|
      send("#{key}=", value) if respond_to?("#{key}=")
    end
  end

end