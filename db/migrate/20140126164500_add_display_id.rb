class AddDisplayId < ActiveRecord::Migration
  def change
    add_column :tasks, :display_num, :integer
  end

end