# frozen_string_literal: true

require 'authie/event_manager'

module Authie
  class Config
    def initialize
      @callbacks = {}
    end

    def session_inactivity_timeout
      @session_inactivity_timeout || 12.hours
    end

    def persistent_session_length
      @persistent_session_length || 2.months
    end

    def sudo_session_timeout
      @sudo_session_timeout || 10.minutes
    end

    def user_relationship_options
      @user_relationship_options ||= {}
    end

    def browser_id_cookie_name
      @browser_id_cookie_name || :browser_id
    end

    def cookie_domain
      @cookie_domain
    end

    def cookie_same_site
      @cookie_same_site
    end

    def default_controller_host
      @default_controller_host
    end

    attr_writer :session_inactivity_timeout, :persistent_session_length,
      :sudo_session_timeout, :browser_id_cookie_name, :cookie_domain,
      :cookie_same_site, :default_controller_host


    def events
      @events ||= EventManager.new
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure(&block)
    block.call(config)
    config
  end
end
