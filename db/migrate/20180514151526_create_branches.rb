# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.timestamps
    end

    add_reference :branches, :organization, foreign_key: true
    add_reference :feedbacks, :branch, foreign_key: true
  end
end
