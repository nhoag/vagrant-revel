vagrant-revel
=============

[Revel](http://revel.github.io/index.html) on [Vagrant](https://www.vagrantup.com/)

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

On the host machine, visit: [http://localhost:9000](http://localhost:9000)

Learn more about Revel: http://revel.github.io/tutorial/requestflow.html
