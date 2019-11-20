1) Install nginx and dnsmasq

```
brew install nginx dnsmasq
```

2) Make sure following lines are in /usr/local/etc/dnsmasq.conf

```
server=8.8.8.8
server=208.67.220.220
conf-dir=/usr/local/etc/dnsmasq.d,*.conf
```

3) Create the test file in /etc/resolver and change the permissions

```sudo mkdir /etc/resolver
sudo touch /etc/resolver/test
sudo chmod a+w /etc/resolver/test
```

4) Create the hello-test.conf file above

```
mkdir /usr/local/etc/nginx/servers
cat /usr/local/etc/nginx/servers/hello-test.conf
```

5) Start the services

```
sudo brew services start nginx
sudo brew services start dnsmasq
```

6) Run the setup-sites.sh above

```
chmod a+x ~/dotfiles/setup-sites.sh
~/dotfiles/setup-sites.sh
```

7) Test it out

```
curl http://hello.test
```

8) Add start up script to System Preferences / Users & Groups / Login items

```
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Users/gareth/zfiles/scripts/lol.sh", hidden:false}'
```
