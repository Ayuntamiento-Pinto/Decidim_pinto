# config/initializers/proposals_controller_override.rb
Rails.application.config.to_prepare do
  Decidim::Proposals::ProposalsController.class_eval do
    private

    def fetch_default_order
      return "recent" if current_component.id == 12

      default_order = current_settings.default_sort_order.presence || component_settings.default_sort_order
      return order_by_default if default_order == "default"
      possible_orders.include?(default_order) ? default_order : order_by_default
    end
  end
end
