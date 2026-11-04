# frozen_string_literal: true

# This migration comes from decidim_assemblies (originally 20180515073049)
# This file has been modified by `decidim upgrade:migrations` task on 2026-10-02 13:35:55 UTC
class UpdateAssemblyMembersIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :decidim_assembly_members, column: :weight
    add_index :decidim_assembly_members, [:weight, :created_at]
  end
end
