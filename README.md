Compare Directories
===================

Simple utility tool that can check two directories and copies all the files
present in the first, but not in the second (including sub directories). Files
are checked on their name and size, so potentially there are some false
negatives.

You can run the tool by using the following line in the command line:

`ruby compare_directories.rb "dir1" "dir2" "target_dir"`
