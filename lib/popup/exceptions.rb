module ATT
  class RootException < RuntimeError ; end
  class RootNotSetError < RootException ; end
  class WindowNotFoundError < RootException ; end
  class FileNotFoundError < RootException ; end
  class FileAlreadyExistError < RootException; end
  class NotImplementError < RootException ; end
  class NotRecordError < RootException; end
  class MutliWindowsMatchError < RootException; end
end
