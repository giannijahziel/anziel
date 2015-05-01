class AddParishIdToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :parish_id, :integer
  end
end
