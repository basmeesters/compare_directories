class BFile
  attr_reader :file_name, :file_size, :file_location

  def initialize(file_name, file_size, file_location)
    @file_name = file_name
    @file_size = file_size
    @file_location = file_location
  end

  def eql?(other)
    @file_name == other.file_name && @file_size == other.file_size
  end

  def hash
    "#{@file_name}#{@file_size}".hash
  end

  def to_s
    "File: #{@file_name}, #{@file_size}, #{@file_location}\n"
  end
end
