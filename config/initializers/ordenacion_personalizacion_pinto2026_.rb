# personalizacion_aLabs/Pinto_2026 - INICIO
Rails.application.config.to_prepare do
  orden = Arel.sql(<<~SQL.squish)
    CASE
      WHEN decidim_participatory_processes.promoted IS TRUE THEN 0
      WHEN decidim_participatory_processes.start_date <= CURRENT_DATE
        AND (decidim_participatory_processes.end_date IS NULL
             OR decidim_participatory_processes.end_date >= CURRENT_DATE) THEN 1
      ELSE 2
    END,
    CASE WHEN decidim_participatory_processes.end_date IS NULL THEN 0 ELSE 1 END,
    CASE WHEN decidim_participatory_processes.end_date IS NULL
      THEN decidim_participatory_processes.start_date END DESC NULLS LAST,
    decidim_participatory_processes.end_date DESC
  SQL

  Decidim::ParticipatoryProcesses::GroupParticipatoryProcesses.class_eval do
    define_method(:query) do
      Decidim::ParticipatoryProcess.where(participatory_process_group: @group).order(orden)
    end
  end

  Decidim::ParticipatoryProcesses::OrganizationPublishedParticipatoryProcesses.class_eval do
    define_method(:query) do
      Decidim::Query.merge(
        Decidim::ParticipatoryProcesses::OrganizationParticipatoryProcesses.new(@organization),
        Decidim::ParticipatoryProcesses::VisibleParticipatoryProcesses.new(@user),
        Decidim::ParticipatoryProcesses::PublishedParticipatoryProcesses.new
      ).query.reorder(orden)
    end
  end
  Decidim::ParticipatoryProcesses::ContentBlocks::HighlightedProcessesCell.class_eval do
    def highlighted_spaces
      @highlighted_spaces ||= highlighted_processes.to_a + promoted_groups.to_a
    end

    alias_method :limited_highlighted_spaces, :highlighted_spaces
  end
  Decidim::ParticipatoryProcesses::ParticipatoryProcessesController.class_eval do
    private

    def default_date_filter
      "all"
    end
  end
end
# personalizacion_aLabs/Pinto_2026 - FIN

