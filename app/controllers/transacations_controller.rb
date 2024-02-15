class TransacationsController < ApplicationController

  def index
		@transactions = Transaction.eager_load(:user).where(user: current_user.id)
		@wallet_amt = current_user.wallet
	end 
end
