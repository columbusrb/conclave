ActiveAdmin.register User do

  controller do
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user].reject {|k,v| k == 'role'}) && @user.update_attribute(:role, params[:user][:role])     
        redirect_to admin_user_path(@user)
      else
        render 'edit'
      end
    end

    def create
      @user = User.new(params[:user].reject {|k,v| k == 'role'})
      if @user.save
        redirect_to admin_user_path(@user)
      else
        render 'new'
      end
    end
  end

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
