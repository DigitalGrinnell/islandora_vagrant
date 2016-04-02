#!/bin/bash

# xdebug.sh
#
# When placed in the ../scripts/custom directory this script will is automatically invoked by
# ../scripts/custom to load and configure XDebug.
#

# Changes:
# 01-Apr-2016 - Initial merge.
#

echo "Installing XDebug for PHP 5 per xdebug.sh."

SHARED_DIR=$1

if [ -f "$SHARED_DIR/configs/variables" ]; then
  # shellcheck source=/dev/null
  . "$SHARED_DIR"/configs/variables
fi

# Install xdebug package
sudo apt-get install php5-xdebug

# Modify the php.ini file if necessary, and restart apache.
if grep -q remote_handler=dbgp /etc/php5/apache2/php.ini; then
  echo "XDebug is already configured in php.ini."
else
cat <<EOT >> /etc/php5/apache2/php.ini
# Added for xdebug
zend_extension="/usr/lib/php5/20100525/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
EOT

# Restart apache
sudo service apache2 restart
fi