class DoAdmin < ActiveRecord::Migration[6.1]
  def change
    AdminUser.create!(email: 'veraverous@gmail.com', password: 'password', password_confirmation: 'password')
  end
end
