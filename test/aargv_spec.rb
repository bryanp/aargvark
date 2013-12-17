require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'

require File.expand_path('../../lib/aargv', __FILE__)

describe Aargv do

  it "names args" do
    v1 = 'foo'
    v2 = :bar

    expected_ret = {
      str: v1,
      sym: v2,
    }

    Aargv.normalize([v1, v2], str: String, sym: Symbol).must_equal expected_ret
    Aargv.normalize([v2, v1], str: String, sym: Symbol).must_equal expected_ret
  end

  it "mixes in default values" do
    v1 = 'foo'
    v2 = :bar

    expected_ret = {
      str: v1,
      sym: v2,
    }

    Aargv.normalize([v1], str: String, sym: [Symbol, v2]).must_equal expected_ret
  end

  it "respects real values when default" do
    v1 = 'foo'
    v2 = :bar

    expected_ret = {
      str: v1,
      sym: v2,
    }

    Aargv.normalize([v1, v2], str: String, sym: [Symbol, :def]).must_equal expected_ret
  end

end

