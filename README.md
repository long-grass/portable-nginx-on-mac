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

3) Create the hello-test.conf file above

```
mkdir /usr/local/etc/nginx/servers
cat /usr/local/etc/nginx/servers/hello.test.conf
```

4) Start the services

```
sudo brew services start nginx
sudo brew services start dnsmasq
```

5) Run the setup-sites.sh above

```
chmod a+x ~/dotfiles/setup-sites.sh
~/dotfiles/setup-sites.sh
```

6) Test it out

```
curl http://hello.test
```

7) Add start up script to System Preferences / Users & Groups / Login items

```
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Users/gareth/zfiles/scripts/lol.sh", hidden:false}'
```

8) Troubleshooting

There is a cache maintained somewhere, the script should clear it out but you can also do manually with

```
sudo killall -HUP mDNSResponder
```

check your nginx config is ok with

```
nginx -t
```

check your dnsmasq is ok with

```
dscacheutil -q host -a name hello.test
```
