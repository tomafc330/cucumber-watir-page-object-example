class RegistrationPage
  include PageObject, Common, DataMagic

  page_url Common.get_url('register')

  text_field :email, :name => 'email'
  text_field :password, :name => 'password'
  text_field :confirmPassword, :name => 'password2'
  text_field :username, :name => 'username'
  span :password_error_span, :class => 'error-message'
  form :reg_form, :id => 'sign-up'

  def random_string(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    password = ''
    length.times { password << chars[rand(chars.size)] }
    password
  end

  def get_error_messages()
    results = []
    span_elements({:class => 'error-message'}).each do |element|
      results << element.text unless element.text.empty?
    end
    results
  end

end