require 'byebug'

class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    # user_contacts = Contact.where(user_id: user.id)
    render json: user.contacts + user.shared_contacts
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, states: :unproccessable_entity
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, states: :unproccessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])

    if contact.delete
      render json: contact
    else
      render json: contact.errors.full_messages, states: :unproccessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
