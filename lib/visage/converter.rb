$:.unshift File.dirname(__FILE__) 

require 'iso_generator'

module Visage
  
  class Converter
    
    def initialize( source, destination, test = false )
      @source = source
      @destination = destination
      @test = test
    end
    
    def process
      if( Visage.valid_source_file?( @source ) )
        iso = Visage::ISOGenerator.new( @source, @destination )
        iso.process( @test )
      else
        Dir.open( @source ).entries.each do | file |
          if( Visage.valid_source_file?( file ) )
            iso = Visage::ISOGenerator.new( File.join( @source, file ), @destination )
            iso.process( @test )
          end          
        end        
      end
    end  
      
  end
  
end