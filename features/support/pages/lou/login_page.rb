class LoginPage
  include PageObject, Common

  page_url Common.get_url('login')

  text_field :username, :name => 'username'
  text_field :password, :name => 'password'
  form :login_form, :id => 'sign-in'

  def login(user, pass)
    self.username = user
    self.password = pass
    self.login_form_element.submit
  end
end