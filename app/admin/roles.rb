ActiveAdmin.register User, as: 'Role' do

  filter :email
  filter :role, as: :select, collection: User::ROLES

  controller do
    def update
      @user = User.find(params[:id])
      if @user.update_attribute(:role, params[:role][:role])
        redirect_to admin_role_path(@user)
      else
        render 'edit'
      end      
    end
  end

  index do
    column :role
    column :email
    default_actions
  end

    form do |f|
    f.inputs "Admin Details" do
      f.input :role, as: :select, collection: User::ROLES
    end
    f.buttons
  end


end
