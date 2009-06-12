$:.unshift File.dirname(__FILE__) 

require 'yaml'

require 'visage/converter'

module Visage
  
  # Supported source types
  SOURCE_TYPES = %w[ .dvdmedia .cdr ]
  
  def self.valid_source_file?( file )
    Visage::SOURCE_TYPES.each do | source_type |
      if( file.include?( source_type ) )
        return true
      end
    end
    return false
  end
  
  def self.version
    yml = YAML.load(File.read(File.join(File.dirname(__FILE__), *%w[.. VERSION.yml])))
    "#{yml[:major]}.#{yml[:minor]}.#{yml[:patch]}"
  end
  
end