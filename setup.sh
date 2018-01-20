#! /bin/sh
set -exo nounset

YOURCOIN=shaligram
REPO=ShaligramPoWDaemon

# Update your VPS using the following commands.
sudo apt-get update
sudo apt-get upgrade

# Install the necessary dependencies using the following commands.
#sudo apt-get install build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev git libssl1.0.0-dbg
#sudo apt-get install libdb-dev libdb++-dev libboost-all-dev libminiupnpc-dev libminiupnpc-dev libevent-dev libcrypto++-dev libgmp3-dev

sudo apt-get install -y build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev git libminiupnpc-dev libevent-dev libcrypto++-dev libgmp3-dev

# Download the deamon file from MyCoin and upload it using SCP/Filezilla. (Only available to paid customers)

#Important: replace "yourcoin" with the name of your coin.

# Extract the tar file using the following command.
# tar -xzvf yourcoin-daemon-linux.tar.gz
git clone https://github.com/MahatmaJapa/${REPO}.git
cd $REPO

# Install the daemon.
chmod +x ${YOURCOIN}d
#sudo mv ${YOURCOIN}d /usr/bin/
sudo mv ${YOURCOIN}d /usr/local/bin/

# Create the config file.
mkdir $HOME/.$YOURCOIN
#$EDITOR $HOME/.$YOURCOIN/${YOURCOIN}.conf

# Paste the following lines in yourcoin.conf.
cat > $HOME/.$YOURCOIN/${YOURCOIN}.conf << EOF
rpcuser=rpc_$YOURCOIN
rpcpassword=69c863e3356d3dae95df454a1
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
daemon=1
EOF

# Start your node with the following command.
${YOURCOIN}d
