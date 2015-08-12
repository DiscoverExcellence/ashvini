class RemoveAvtarColumnFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :avtar, :string
  end
end
