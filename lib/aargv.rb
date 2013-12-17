class Aargv
  def self.normalize(args, opts)
    Hash[opts.dup.map { |opt, opt_v|
      type, default = opt_v
      [opt, value_of_type(args, type) || default]
    }]
  end

  def self.value_of_type(values, type)
    values.find { |value| value.is_a?(type) }
  end
end

