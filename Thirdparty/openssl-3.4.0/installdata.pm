package OpenSSL::safe::installdata;

use strict;
use warnings;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
    @PREFIX
    @libdir
    @BINDIR @BINDIR_REL_PREFIX
    @LIBDIR @LIBDIR_REL_PREFIX
    @INCLUDEDIR @INCLUDEDIR_REL_PREFIX
    @APPLINKDIR @APPLINKDIR_REL_PREFIX
    @ENGINESDIR @ENGINESDIR_REL_LIBDIR
    @MODULESDIR @MODULESDIR_REL_LIBDIR
    @PKGCONFIGDIR @PKGCONFIGDIR_REL_LIBDIR
    @CMAKECONFIGDIR @CMAKECONFIGDIR_REL_LIBDIR
    $VERSION @LDLIBS
);

our @PREFIX                     = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install' );
our @libdir                     = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib' );
our @BINDIR                     = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/bin' );
our @BINDIR_REL_PREFIX          = ( 'bin' );
our @LIBDIR                     = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib' );
our @LIBDIR_REL_PREFIX          = ( 'lib' );
our @INCLUDEDIR                 = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/include' );
our @INCLUDEDIR_REL_PREFIX      = ( 'include' );
our @APPLINKDIR                 = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/include/openssl' );
our @APPLINKDIR_REL_PREFIX      = ( 'include/openssl' );
our @ENGINESDIR                 = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib/install/lib/engines-3' );
our @ENGINESDIR_REL_LIBDIR      = ( 'install/lib/engines-3' );
our @MODULESDIR                 = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib/install/lib/ossl-modules' );
our @MODULESDIR_REL_LIBDIR      = ( 'install/lib/ossl-modules' );
our @PKGCONFIGDIR               = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib/install/lib/pkgconfig' );
our @PKGCONFIGDIR_REL_LIBDIR    = ( 'install/lib/pkgconfig' );
our @CMAKECONFIGDIR             = ( '/home/arkr/ORB_SLAM3_ARM64/Thirdparty/openssl-3.4.0/install/lib/install/lib/cmake/OpenSSL' );
our @CMAKECONFIGDIR_REL_LIBDIR  = ( 'install/lib/cmake/OpenSSL' );
our $VERSION                    = '3.4.0';
our @LDLIBS                     =
    # Unix and Windows use space separation, VMS uses comma separation
    $^O eq 'VMS'
    ? split(/ *, */, '-ldl -pthread ')
    : split(/ +/, '-ldl -pthread ');

1;
