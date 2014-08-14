module SpecialRequestFeature
  class Railtie < Rails::Railtie

    initializer "my_railtie.configure_rails_initialization" do |app|
      FeatureBase.register(app, SpecialRequestFeature)
      FeatureBase.register_autoload_path(app, "special_request_feature")
    end

    config.after_initialize do
      FeatureBase.inject_feature_record("Special Requests",
        "SpecialRequestFeature",
        "This will enable special requests."
      )
      FeatureBase.inject_permission_records(
        SpecialRequestFeature,
        SpecialRequestFeatureFeatureDefinition.new.permissions
      )
    end

  end
end
