# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.string :url
      t.string :username
      t.text :description

      t.timestamps
    end
  end
end
