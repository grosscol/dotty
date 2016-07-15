## Ubuntu 

### settings
Add the dns search suffixes to the default interface in /etc/network/interfaces
```
iface lo inet loopback
  dns-search umdl.umich.edu umich.edu
```

### other installs

nbvm-thefuck
`sudo pip install psutil thefuck`

rbenv
```sh
sudo mkdir /l/local
git clone https://github.com/rbenv/rbenv.git /l/local/rbenv

sudo echo 'export PATH="/l/local/rbenv/bin:$PATH"' > /etc/profile.d/rbenv_profile.sh
sudo echo '/l/local/rbenv/bin/rbenv init' >> /etc/profile.d/rbenv_profile.sh
sudo git clone https://github.com/rbenv/ruby-build.git /l/local/rbenv/plugins/ruby-build
sudo chmod -R 0755 /l/local/rbenv
```



