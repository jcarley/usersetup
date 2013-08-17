exec { "update_packages":
  command => '/usr/bin/apt-get update',
  timeout => 0,
}
Exec["update_packages"] -> Package <| |>

include users
