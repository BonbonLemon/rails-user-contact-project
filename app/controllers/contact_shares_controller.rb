class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    contact_share = ContactShare.new(contact_share_params)

    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, states: :unproccessable_entity
    end
  end

  def show
    contact_share = ContactShare.find_by(id: params[:id])
    render json: contact_share
  end

  def update
    contact_share = ContactShare.find_by(id: params[:id])
    if contact_share.update(contact_share_params)
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, states: :unproccessable_entity
    end
  end

  def destroy
    contact_share = ContactShare.find_by(id: params[:id])

    if contact_share.delete
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, states: :unproccessable_entity
    end
  end

  private

  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
