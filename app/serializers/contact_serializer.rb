class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthday

  def attributes(*args)
    params = super(*args)
    params[:birthday] = (I18n.l(object.birthday) unless object.birthday.blank?)
    params
  end
end
