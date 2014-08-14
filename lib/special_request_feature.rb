require "special_request_feature/version"

module SpecialRequestFeature
  class SpecialRequestFeatureFeatureDefinition
    include FeatureSystem::Provides
    def permissions
      [
        {
          can: true,
          callback_name: 'can_manage_special_requests',
          name: 'Can Manage Special Requests'
        }
      ]
    end
  end

  module Authorization
    module Permissions
      def can_manage_special_requests
        can :manage, SpecialRequest
      end
    end
  end

end

require 'special_request_feature/railtie' if defined?(Rails)
