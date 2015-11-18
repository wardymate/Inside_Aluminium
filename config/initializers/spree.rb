# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
end

Spree.user_class = "Spree::User"
config = Rails.application.config
config.after_initialize do
  config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::MyCalc
  config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::TuffNextDay
  config.spree.calculators.tax_rates << Spree::Calculator::Tax::VAT
end

# config.after_initialize do
#   config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::TuffNextDay
# end
#
# config.after_initialize do
#   config.spree.calculators.tax_rates << Spree::Calculator::Tax::VAT
# end
