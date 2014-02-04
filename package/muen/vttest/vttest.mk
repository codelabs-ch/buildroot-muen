################################################################################
#
# vttest
#
################################################################################

VTTEST_VERSION = 2.7+20140116
VTTEST_SOURCE = vttest.tar.gz
VTTEST_SITE = http://invisible-island.net/datafiles/release

$(eval $(autotools-package))
