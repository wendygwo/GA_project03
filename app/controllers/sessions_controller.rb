class SessionsController < ApplicationController
  def new
  	# Redirects to the owner show page(dashboard) if an owner is logged in
    if current_owner != nil
      redirect_to owner_path(current_owner)
    else 
    	# Create new owner for the sign-in/new sessions page
    	@owner = Owner.new
    end
  end

  def create
    # Get the owner email (unique to each user) the user typed in
    # Find the record in the database that corresponds to this email
    c = Owner.where(email: params[:owner][:email]).first 
    # Checking if the user was successfully found based on username entered, and that password matches
    if c != nil && c.authenticate(params[:owner][:password])
      session['owner_id'] = c.id.to_s
      #redirect to owner's show view
  		redirect_to owner_path(c)
    else
      # redirect to new login page
      # TO DO: should probably put error message if they're not able to log in
      # redirect_to new_session_path
      redirect_to new_session_path(:error_message => 'Incorrect password or username')
  	end
  end

  def destroy
  	#destroy session cookie
    session.destroy
    #redirect to login page
  	redirect_to new_session_path
  end
end
