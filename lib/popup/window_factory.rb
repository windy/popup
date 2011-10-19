require 'popup/ext/rautomation_ext'
require 'active_support'
module ATT
  class WindowFactory
    @@config_root = File.join(__FILE__,'..','constants')
    class << self
      def config(klass)
        klass = klass.class unless klass.kind_of?(Class)
        _config(klass.to_s.split('::')[-1].underscore + '.yml')
      end
      def _config(file_name)
        YAML.load_file(File.join(@@config_root,file_name)) 
      end
      
      def make(klass)
        raise NotImplementError,"this feature no implement yeat."
      end
      
      def make_other(container,e)
        type = e["type"]
        locators = e["default_locators"]
        _make_other(container,type,locators)
      end
      
      def _make_other(container,type,locators)
        container.send(type,locators)
      end
    end
  end
  
  class RegFactory < WindowFactory
    $KCODE="u"
    class << self
      def make(klass)
        RAutomation::Window.new(:title=> reg_title(klass), :adapter=>"autoit" )
      end
      
      def reg_title(klass)
        reg(config(klass)["title"])
      end
      
      def reg(hash_or_array)
        if hash_or_array.kind_of?(Array)
          ach = "each"
        else
          ach = "each_value"
        end
        reg_str = ""
        hash_or_array.send(ach) do |v|
          next if v == ""
          reg_str += ( Regexp.escape(v) + "|" )
        end
        Regexp.new(reg_str.chop)
      end
    end
  end
  
  class ArrayFactory
    class <<self
      def make(type)
      end
      
      def platform
      end
    end
  end
end
