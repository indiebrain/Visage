module Visage
  
  class ISO
    
    # Initialize the ISO
    #   +options+ is a Hash containing ISO building details
    #
    # Returns ISO
    def initialize( source_file, destination )
      @source = source_file.gsub( /\s/, '\ ' )
      @name = File.basename( source_file )
      @name = @name.sub( /\.cdr|\.dvdmedia/, '' )
      @name = @name.gsub( /\s/, '\ ' )
      @destination_file_name = File.join( destination, @name )
    end
    
    # Generate the iso file
    def process( test = false )
      command = "hdiutil makehybrid -udf -udf-volume-name #{@name} -o #{@destination_file_name} #{@source}"
      if( test )
        puts command
      else  
        system( command )
      end
    end
    
  end
  
end