vagrant-revel
=============

Revel on Vagrant

### Usage

```bash
git clone git@github.com:nhoag/vagrant-revel.git
cd vagrant-revel
vagrant up
vagrant ssh
cd $GOPATH
revel new myapp
revel run myapp
```

On the host machine, visit: http://localhost:9000

Learn more about Revel: http://revel.github.io/tutorial/requestflow.html
