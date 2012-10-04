ActiveAdmin.register User do

  filter :email
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range
  filter :current_sign_in_at, as: :date_range
  filter :last_sign_in_at, as: :date_range
  filter :current_sign_in_ip
  filter :last_sign_in_ip
  filter :role, as: :select, collection: User::ROLES


  index do
    selectable_column
    column :role
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
