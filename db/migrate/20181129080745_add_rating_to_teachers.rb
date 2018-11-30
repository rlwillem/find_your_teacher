class AddRatingToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :rating, :integer
  end
end
