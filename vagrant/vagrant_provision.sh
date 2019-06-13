echo "Provisioning the Vagrant VM as user: `whoami`"

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
gem install rails --version '5.2.3'

echo "Installing NodeJS..."
sudo apt-get install -y nodejs

echo "Installing SQLite..."
# I don't want to use SQLite much, but the Rails guide relies on it.
sudo apt-get install -y sqlite

echo "Installing Postgres..."
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
# By default, Rails dev server only binds to localhost, but we want it to listen for all
# incoming connections, so we set the HOST env var.
export HOST=0.0.0.0
# Change to the project root dir whenever you log in.
cd /vagrant
" > /home/vagrant/.bashrc

echo ""
echo "Done! As long as you don't see any red error messages above,"
echo "you can now run \`vagrant ssh\` to ssh into your new VM."
