class ChangeFirstTimeDefaultsOnViewing < ActiveRecord::Migration
  def change
    change_column_default :viewings, :first_time, true
  end
end
