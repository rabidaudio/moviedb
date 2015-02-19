class ChangeViewingDateToTimestamp < ActiveRecord::Migration
  def up
    change_column :viewings, :date, :datetime
  end

  def down
    change_column :viewings, :date, :date
  end
end
