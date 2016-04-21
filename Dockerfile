FORM ubuntu:wily

apt-get update
apt-get install -y build-essential libtool pkg-config autoconf automake python-dev python python-pip vim libzmq3-dev

pip install jupyter pyzmq markupsafe jsonschema

# CRAN
echo 'deb http://cran.cnr.berkeley.edu/bin/linux/ubuntu wily/' > /etc/apt/sources.list.d/r.list
# CRAN GPG key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

apt-get -y build-dep libcurl4-gnutls-dev
apt-get -y install libcurl4-gnutls-dev
apt-get install r-base

# Install IRKernel
R -e 'install.packages(c("rzmq","repr","IRkernel","IRdisplay"), repos = c("http://irkernel.github.io/", "http://cran.us.r-project.org"))' \
  -e 'IRkernel::installspec()'
