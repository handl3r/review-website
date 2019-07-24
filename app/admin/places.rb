ActiveAdmin.register Place do

  permit_params :user_id, :service_id, :phoneNumber, :address, :timeOpen, :timeClose, :description,
                :numberRatings, :mediumRating

  
end
