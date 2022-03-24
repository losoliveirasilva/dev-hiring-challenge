class AddDonationToStarredRepositories < ActiveRecord::Migration[6.1]
  def change
    add_column :starred_repositories, :donate_intention, :integer
  end
end
