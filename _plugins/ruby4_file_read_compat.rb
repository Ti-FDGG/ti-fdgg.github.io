if RUBY_VERSION >= "4.0"
  class << File
    alias_method :__ruby4_compat_read, :read
    alias_method :__ruby4_compat_binread, :binread

    def read(path, length = nil, offset = nil, opts = nil, **kwargs)
      if length.is_a?(Hash) && offset.nil? && opts.nil?
        return __ruby4_compat_read(path, **length)
      end

      kwargs = opts.merge(kwargs) if opts.is_a?(Hash)
      return __ruby4_compat_read(path, length, offset, **kwargs) unless kwargs.empty?

      __ruby4_compat_read(path, length, offset)
    end

    def binread(path, length = nil, offset = nil, opts = nil, **kwargs)
      if length.is_a?(Hash) && offset.nil? && opts.nil?
        return __ruby4_compat_binread(path, **length)
      end

      kwargs = opts.merge(kwargs) if opts.is_a?(Hash)
      return __ruby4_compat_binread(path, length, offset, **kwargs) unless kwargs.empty?

      __ruby4_compat_binread(path, length, offset)
    end
  end
end
