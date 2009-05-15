#!/usr/bin/env ruby
require 'rubygems'
require 'optiflag'

#####################################################
# Setup Command Line Options                        #
#####################################################
module VisageOptions extend OptiFlagSet
  optional_flag "source" do 
    alternate_forms "s", "S"
  end
  optional_switch_flag "usage" do 
    alternate_forms "u", "U"
  end
  and_process!
end

#####################################################
# Define Visage Helper Class                        #
#####################################################
class Visage
  def Visage.display_help()
    puts "Visage is a simple utility to convert CD/DVD master images created from OS X's disk utility (.cdr) into .iso format.\n\n"
    puts "usage: ./visage.rb               | Converts all .cdr images within the current directory to iso format."
    puts "usage: ./visage.rb  [-s|-S|-source-dir] [path_to_dir] | Converts all .cdr images within the input source directory to iso format."
  end
  def  Visage.cdr_to_iso( file )
    if( file.include? '.cdr' ) then
      file_name = file.chomp '.cdr'
      puts file + "--> " + file_name
      result = `hdiutil makehybrid -udf -udf-volume-name #{file_name} -o #{file_name} #{file}`
    end
  end
  def  Visage.convert_all_in_dir( dir=Dir.open( Dir.pwd ) )
    puts "Converting in Directory: #{dir.path}"
    dir.entries.each do |file|
      cdr_to_iso( file )
    end
  end
end

#####################################################
# Start Main Script Body                            #
#####################################################
if( ARGV.empty? )
   Visage.convert_all_in_dir()
elsif(  ARGV.flags.usage? )
   Visage.display_help()
elsif( ARGV.flags.source? )
  start_dir = Dir.pwd
  target_dir = Dir.new( ARGV.flags.source )
  Dir.chdir( target_dir.path )
  Visage.convert_all_in_dir( target_dir )
  Dir.chdir( start_dir )
end


  
  