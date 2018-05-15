# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :quality
      t.string :age_group
      t.integer :nps
      t.string :status
      t.datetime :experienced_at
      t.timestamps
    end
  end
end
