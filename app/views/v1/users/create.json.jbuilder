json.data do

  json.user_info do
    json.id @user.id
    json.email @user.email
  end
  json.super_important do
    json.authentication_token @user.authentication_token
  end
  
end