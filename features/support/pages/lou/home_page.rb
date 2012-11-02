class HomePage
  include PageObject, Common

  page_url Common.get_url('home')

  link :register, :id => "sign_up_btn"

end