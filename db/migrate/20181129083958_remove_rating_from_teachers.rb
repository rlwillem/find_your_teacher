class RemoveRatingFromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :rating
  end
end
