class CarrierUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_carrier
  belongs_to :carrier
  
  private

  def set_carrier
    @user_email_domain = self.email.match(/(?<=@)(\S+)/).to_s
    @carrier = Carrier.where(email_domain: @user_email_domain).first
    self.carrier = @carrier
  end

end
