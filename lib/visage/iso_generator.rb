module Visage
  
  class ISOGenerator
    
    # Initialize the ISOGenerator
    #   source_file - source file to be turned into an ISO file
    #   destination - file system location where generated ISO will be placed 
    def initialize( source_file, destination )
      @source = source_file.gsub( /\s/, '\ ' )
      @name = File.basename( source_file )
      @name = @name.sub( /\.cdr|\.dvdmedia/, '' )
      @name = @name.gsub( /\s/, '\ ' )
      @destination_file_name = File.join( destination, @name )
      @command = "hdiutil makehybrid -udf -udf-volume-name #{@name} -o #{@destination_file_name} #{@source}" 
    end
    
    # Runs or prints the command that generates an ISO for the source file
    #   test - if true only print the command otherwise run the command
    def process( test = false )
      if( test )
        puts @command
      else  
        system( @command )
      end
    end
    
  end
  
end