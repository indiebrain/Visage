$:.unshift File.dirname(__FILE__) 

require 'iso'

module Visage
  
  class Converter
    
    def initialize( source, destination )
      @source = source
      @destination = destination
    end
    
    def process
      if( Visage.valid_source_file?( @source ) )
        iso = Visage::ISO.new( @source, @destination )
        iso.process
      else
        Dir.open( @source ).entries.each do | file |
          if( Visage.valid_source_file?( file ) )
            iso = Visage::ISO.new( File.join( @source, file ), @destination )
            iso.process
          end          
        end        
      end
    end  
      
  end
  
end