class Scripture
  attr_accessor :text
  attr_accessor :title
  attr_accessor :title_short
  attr_accessor :verse

  def initialize(hash = {})
    @text = hash[:text]
    @title = hash[:title]
    @title_short = hash[:title_short]
    @verse = hash[:verse]
  end

  # Not using to_hash in this project

  def to_h
    to_hash
  end

  def to_hash
    hash = {}
    self.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = self.instance_variable_get(var)
    end
    hash
  end
end