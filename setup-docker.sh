apt-get -y update
apt-get -y install git
apt-get -y install wget
apt-get -y install curl
apt-get -y install nano
apt-get -y install jq

# install make
apt-get -y install build-essential  # for MAKE

#install GO
wget https://dl.google.com/go/go1.17.2.linux-amd64.tar.gz
tar -xvf go1.17.2.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >>~/.bash_profile
echo 'export GOPATH=$HOME/go' >>~/.bash_profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >>~/.bash_profile
source ~/.bash_profile
echo 'source ~/.bash_profile' >> /etc/bash.bashrc


rm go1.17.2.linux-amd64.tar.gz

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "source $HOME/.cargo/env" >> ~/.bash_profile

rustup default stable
rustup update stable
rustup target list --installed
rustup target add wasm32-unknown-unknown


# install wasmd
git clone https://github.com/CosmWasm/wasmd.git
cd wasmd
git checkout v0.21.0
make install

# verify the installation
wasmd version

source <(curl -sSL https://raw.githubusercontent.com/CosmWasm/testnets/master/sandynet-1/defaults.env)
echo "source <(curl -sSL https://raw.githubusercontent.com/CosmWasm/testnets/master/sandynet-1/defaults.env)" >> ~/.bash_profile
