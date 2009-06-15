$:.unshift File.dirname(__FILE__) 

require 'iso'

module Visage
  
  class Converter
    
    def initialize( source, destination, test )
      @source = source
      @destination = destination
      @test = test
    end
    
    def process
      if( Visage.valid_source_file?( @source ) )
        iso = Visage::ISO.new( @source, @destination )
        iso.process( @test )
      else
        Dir.open( @source ).entries.each do | file |
          if( Visage.valid_source_file?( file ) )
            iso = Visage::ISO.new( File.join( @source, file ), @destination )
            iso.process( @test )
          end          
        end        
      end
    end  
      
  end
  
end