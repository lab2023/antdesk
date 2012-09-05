class CreateApplicationsContributors < ActiveRecord::Migration
  def change
    create_table :applications_contributors, :id => false do |t|
      t.references :contributor
      t.references :application
    end
    add_index :applications_contributors, [:contributor_id, :application_id], :name => 'index_applications_contributors'
  end
end