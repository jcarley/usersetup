# Usersetup Demo

### General Overview

The setup is very simple.  All this demo does is install many user accounts on a server.  This has only been tested with a Ubuntu 12.04 machine.  Each account is setup exactly the same including the password used.  The default password used is `password1`.

User names are located in the common.yaml file located here.
```
  - manifests
    |- hieradata
       |- common.yaml
```

### Vagrant

Testing with vagrant is as easy as calling vagrant up.  The scripts will do the rest.

```bash
$ vagrant up
```

### VPS

Copy the entire project to any folder on your VPS and run `sudo ./puppet-apply.sh`.

```bash
$ sudo ./puppet-apply.sh
```

