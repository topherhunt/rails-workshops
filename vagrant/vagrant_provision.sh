echo "Provisioning the Vagrant VM as user: `whoami`"

echo "Installing required packages..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev

echo "Installing RVM..."
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

echo "Installing Ruby..."
rvm install 2.5.5
rvm use 2.5.5 --default

echo "Installing Bundler..."
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

echo "Installing Rails..."
gem install rails --version '6.0.1'

echo "Installing NodeJS..."
wget -qO- https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get update && sudo apt-get install -y nodejs # version should be >= 8.16.2

echo "Installing Yarn..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

echo "Installing SQLite..."
# I don't want to use SQLite much, but the Rails guide relies on it.
sudo apt-get install -y sqlite

echo "Installing Postgres..."
# NOTE: Only works on Bionic (18.04)+
# Check your version with: `lsb_release -a`
# Set locale to UTF-8 to avoid Postgres + Rails locale conflicts.
# See https://ouestcode.com/journal/archive/2014-postgres-rails-the-chosen-lc-ctype-setting-requires-encoding-latin1.html
echo '
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
' | sudo tee /etc/default/locale
. /etc/default/locale
# Now install postgres (should be v10)
sudo apt-get install -y postgresql postgresql-contrib postgresql-server-dev-10
# Create the vagrant role and database (only required for easy psql access)
sudo -u postgres psql -d postgres -c "CREATE ROLE vagrant SUPERUSER CREATEDB LOGIN;"
createdb

echo "Cleaning out irrelevant provisioning logs..."
rm /vagrant/*-cloudimg-console.log

echo "Configuring login script..."
echo "
# Useful aliases
alias ll="ls -la"

# By default, Rails dev server only binds to localhost, but we want it to listen for all
# incoming connections, so we set the HOST env var.
export HOST=0.0.0.0

# On login, change to the project root folder.
cd /vagrant
" > /home/vagrant/.bashrc

echo ""
echo "Done! As long as you don't see any red error messages above,"
echo "you can now run \`vagrant ssh\` to ssh into your new VM."
