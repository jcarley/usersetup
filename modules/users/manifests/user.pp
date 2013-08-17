define user::user () {

  $pwd = '$6$0VaH1y/8$v5TvLL8CITIx/6EB1KVa0JSrYoKPC6zdNueVEMb.Ak7ekTXz2WFOnTlf3KVDUZzEtdmYkc09bzXekJ/sDUya8/'

  user { "$name":
    ensure     => present,
    shell      => '/bin/bash',
    home       => "/home/$name",
    password   => $pwd,
    managehome => true,
  }
}
