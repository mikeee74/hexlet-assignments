# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  attr_reader :params

  def_delegators :@url, :host, :scheme, :port

  def initialize(url)
    @url = URI(url)
    query = @url.query || ''
    @params = query
                .split('&')
                .each_with_object({}) do |elem, acc|
                  key, value = elem.split('=')
                  acc[key.to_sym] = value
                end
  end

  def query_params
    params
  end

  def query_param(key, default_value = nil)
    params.fetch(key, default_value)
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end
end
# END
