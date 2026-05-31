if RUBY_VERSION >= "4.0"
  class Object
    def tainted?
      false
    end unless method_defined?(:tainted?)

    def untrusted?
      false
    end unless method_defined?(:untrusted?)
  end
end
