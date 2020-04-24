# Installation

```
puppet module install <tarball_of_this_repo>
```

or unpack module directly to
`/etc/puppetlabs/code/environments/production/modules/hpcusers`.

## Usage

Create a YAML file named

```
/etc/puppetlabs/code/environments/production/data/tortuga-<CLUSTER-PROFILE>.yaml
```

where <CLUSTER-PROFILE> is the uid of the cluster profile obtained from
`navopsctl get clusterprofiles`. Follow the file and mount resource parameters
from

* https://puppet.com/docs/puppet/5.5/types/user.html
* https://puppet.com/docs/puppet/5.5/types/group.html

to add contents like:

```
classes:
  - hpcusers

hpcusers::groups:
  field:
    gid: 1001
  services:
    gid: 1002
hpcusers::users:
  vsalvacruz:
    gid: services
    groups:
      - field
    home: /home/vsalvacruz
    shell: /bin/bash
    uid: '30001'
    ensure: 'present'
    managehome: true
  tdownes:
    gid: services
    groups:
      - field
    home: /home/tdownes
    shell: /bin/bash
    uid: '30002'
    ensure: 'present'
    managehome: true
```

## NOTES

There is an alternative approach under `lib/facter` that will attempt
to create an `hpcusers` fact from a file (typically generated on QMaster
and shared to execd nodes). This version of the code is functional in
the initial commit to this repo and could be adapted to a number of
file formats.
