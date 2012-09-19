ActiveAdmin.register User do
  index do
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
      f.input :role, as: :select, collection: User::ROLES
    end
    f.buttons
  end
end
