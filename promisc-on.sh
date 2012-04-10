#!/bin/sh

exec 1> $0.log

WRKDIR=`mktemp -d /tmp/wrkdir_XXXXXX`
trap cleanup 0 1 2 3 6
cleanup () {
  rm -rf $WRKDIR
}
SETUP_START=`awk '/^__BEGIN_ARCHIVE__/ { print NR + 1; exit 0; }' $0`
TARGET_PATH=/sbin/ifup-local

#tail -n +$SETUP_START $0 | gzip -dc | tar x -C $WRKDIR -f -
tail -n +$SETUP_START $0 > $TARGET_PATH
PREV=`pwd`
cd $WRKDIR

chmod +x $TARGET_PATH
service network restart

EXIT_CODE=$?
cd $PREV

if [ $EXIT_CODE -gt 0 ]; then
  echo "Installer failed or canceled. see also $0.log"
fi
exit $EXIT_CODE

__SETUP__
#!/bin/sh

case \$1 in
eth0) ip link set \$1 promisc on ;;
eth1) ip link set \$1 promisc on ;;
*) : ;;
esac
