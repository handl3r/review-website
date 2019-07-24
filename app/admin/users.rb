ActiveAdmin.register User do
  form title: 'New User' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'User' do
      input :name
      input :role
      input :address
      input :website
      input :phoneNumber
      input :email
      input :description
      f.input :password
      f.input :password_confirmation
    end
    actions
  end
  permit_params :role, :name, :address, :website, :phoneNumber, :email, :description,
                :password, :password_confirmation
  
end
