json.data do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.auth_token @auth_token
end
