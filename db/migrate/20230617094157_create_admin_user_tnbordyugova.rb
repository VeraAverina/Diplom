class CreateAdminUserTnbordyugova < ActiveRecord::Migration[6.1]
  def change
    AdminUser.create!(email: 'tnbordyugova@sfedu.ru', password: 'password', password_confirmation: 'password')
  end
end
