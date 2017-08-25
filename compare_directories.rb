require 'find'
require 'fileutils'
require_relative "bfile"

def get_command_line_arguments
  if ARGV.length == 3
    start_comparing(ARGV[0], ARGV[1], ARGV[2])
  else
    call = 'ruby compare_directories.rb "dir1" "dir2" "target_dir"'
    print "Wrong number of arguments. You should call it like: #{call}"
  end
end

def start_comparing(dir1, dir2, target_dir)
  print "start getting files from #{dir1}\n"
  files1 = get_all(dir1)

  # For debugging
  # files1.each do |f|
  #   print f.to_s
  # end

  print "\nstart getting files from #{dir1}\n"
  files2 = get_all(dir2)
  # For debugging
  # files2.each do |f|
  #   print f.to_s
  # end

  difference = files1 - files2
  print "\nstart copying the difference\n"
  copy_files(difference, target_dir)
end

def get_all(directory_name)
  files = []
  Find.find(directory_name) do |path|
    if !FileTest.directory?(path)
        files.push(create_bfile(path))
    end
  end
  files
end

def create_bfile(path)
  name = File.basename(path)
  size = File.size(path)
  location = File.realpath(path)

  BFile.new(name, size, location)
end

def copy_files(bfiles, target_dir)
  Dir.mkdir(target_dir) unless File.exists?(target_dir)
  bfiles.each do |f|
    copy_file(f.file_location, "#{target_dir}/#{f.file_name}")
    # print "copied: #{f.file_location}\n"
  end
end

def copy_file(file, target)
   FileUtils.cp(file, target)
end

get_command_line_arguments
