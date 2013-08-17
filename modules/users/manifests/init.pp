class users {
  $users = hiera_array('users')
  user::user { $users: }
}
