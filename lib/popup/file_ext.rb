module ATT
  module FileExt
    private
    def check_file_exist?(file_path)
      raise FileNotFoundError,"#{file_path} not exist" unless File.file?( window_full_path(file_path) )
    end
    
    private
    def check_file_not_exist?(file_path)
      raise FileAlreadyExistError,"#{file_path} has existed" if File.file?( window_full_path(file_path) )
    end
    
    private
    def window_full_path(file_path)
      path = file_path
      unless Pathname.new(file_path).absolute?
        path = File.expand_path(File.join(Config.root,file_path))
      else
        path = File.expand_path(file_path)
      end
      path.gsub("/","\\")
    end
  end
end