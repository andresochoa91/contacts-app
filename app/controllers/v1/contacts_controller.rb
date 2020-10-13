class V1::ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact.order("created_at ASC")
    render json: { status: "SUCCESS", message: "Showing contacts", data: @contacts }, status: :ok
  end

  def show
    render json: { status: "SUCCESS", message: "Showing contact", data: @contact }, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: { status: "SUCCESS", message: "Contact created", data: @contact }, status: :created
    else
      render json: { status: "ERROR", message: "Contact not created", data: @contact.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update_attributes(contact_params)
      render json: { status: "SUCCESS", message: "Contact updated", data: @contact }, status: :ok
    else
      render json: { status: "ERROR", message: "Contact not updated", data: @contact.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.delete
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
