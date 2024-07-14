# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_pop
    stack = Stack.new %w[okay hello hi]
    stack.pop!
    shoud_be = %w[okay hello]

    assert { stack.to_a == shoud_be }
  end

  def test_push
    stack = Stack.new %w[okay hello hi]
    stack.push! 'how'
    shoud_be = %w[okay hello hi how]

    assert { stack.to_a == shoud_be }
  end

  def test_empty
    stack = Stack.new
    shoud_be = []

    assert { stack.to_a == shoud_be }
  end

  def test_return_array
    stack = Stack.new

    assert { stack.to_a.class == Array }
  end

  def test_clear
    stack = Stack.new %w[asd asdf asdfg]
    stack.clear!

    assert { stack.to_a.empty? }
  end

  def test_csize
    arr = %w[asd asdf asdfg]
    shoud_be = arr.size

    stack = Stack.new arr

    assert { stack.size == shoud_be }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
