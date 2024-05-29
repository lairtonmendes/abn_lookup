# frozen_string_literal: true

require "forwardable"
require "abn_lookup/configuration"
require "abn_lookup/client"
require "abn_lookup/search_by_abn"
require "abn_lookup/search_by_acn"
require "abn_lookup/search_by_name"

require "faraday"
require "faraday_middleware"

require_relative "abn_lookup/version"

module AbnLookup
  class Error < StandardError; end

  @config = AbnLookup::Configuration.setup

  class << self
    extend Forwardable

    attr_accessor :config

    def_delegators :@config, :guid, :guid=

    def search_by_abn(abn)
      SearchByAbn.fetch(abn)
    end

    def search_by_acn(acn)
      SearchByAcn.fetch(acn)
    end

    def search_by_name(name)
      SearchByName.fetch(name)
    end

    def connection
      @client ||= AbnLookup::Client.new
      @client.connection
    end
  end
end