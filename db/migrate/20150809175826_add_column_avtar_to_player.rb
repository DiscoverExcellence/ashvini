class AddColumnAvtarToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :avtar, :string
  end
end
