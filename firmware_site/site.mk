
##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	mesh-vpn-tunneldigger \
	respondd \
	status-page \
	web-advanced \
	web-wizard \
        web-mesh-vpn-fastd

# new for multidomain
GLUON_MULTIDOMAIN=1

GLUON_SITE_PACKAGES := \
        respondd-module-airtime \
        gluon-authorized-keys \
	gluon-config-mode-domain-select \
	gluon-web-admin \
	gluon-radvd \
	iwinfo \
	iptables
#	haveged

# from eulenfunk:
#GLUON_SITE_PACKAGES += \
# gluon-quickfix
#
# from sargon:
#GLUON_SITE_PACKAGES += \
#	roamguide
#
# from ssidchanger-packages:
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer

# from ffki-packages:
#GLUON_SITE_PACKAGES += \
#	gluon-config-mode-ppa
	
# Always call `make` from the command line with the desired release version!
# otherwise this is generated:
DEFAULT_GLUON_RELEASE := 2020.2.2~exp$(shell date '+%y%m%d01')
#	DEFAULT_GLUON_RELEASE := 2021.1.1

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0
#GLUON_BRANCH ?= experimental
#GLUON_BRANCH ?= stable
#export GLUON_BRANCH

GLUON_AUTOUPDATER_BRANCH ?= stable
export GLUON_AUTOUPDATER_BRANCH

GLUON_AUTOUPDATER_ENABLED ?= 1
export GLUON_AUTOUPDATER_ENABLED

GLUON_DEPRECATED ?= update
export GLUON_DEPRECATED

GLUON_TARGET ?= ar71xx-generic
export GLUON_TARGET

GLUON_REGION ?= eu
GLUON_WLAN_MESH ?= 11s

GLUON_LANGS ?= en de

# support for USB UMTS/3G devices
USB_PACKAGES_3G := \
	kmod-usb-serial \
	kmod-usb-serial-wwan \
	kmod-usb-serial-option \
	chat \
	ppp

# support for USB GPS devices
USB_PACKAGES_GPS := \
	kmod-usb-acm \
	ugps

# support for HID devices (keyboard, mouse, ...)
USB_PACKAGES_HID := \
	kmod-usb-hid \
	kmod-hid-generic

# support for USB tethering
USB_PACKAGES_TETHERING := \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether

# storage support for USB
USB_PACKAGES_STORAGE := \
	block-mount \
	kmod-fs-ext4 \
	kmod-fs-vfat \
	kmod-usb-storage \
	kmod-usb-storage-extras \
	blkid \
	swap-utils \
	kmod-nls-cp1250 \
	kmod-nls-cp1251 \
	kmod-nls-cp437 \
	kmod-nls-cp775 \
	kmod-nls-cp850 \
	kmod-nls-cp852 \
	kmod-nls-cp866 \
	kmod-nls-iso8859-1 \
	kmod-nls-iso8859-13 \
	kmod-nls-iso8859-15 \
	kmod-nls-iso8859-2 \
	kmod-nls-koi8r \
	kmod-nls-utf8

USB_X86_GENERIC_NETWORK_MODULES := \
	kmod-usb-ohci-pci \
	kmod-sky2 \
	kmod-atl2 \
	kmod-igb \
	kmod-3c59x \
	kmod-e100 \
	kmod-e1000 \
	kmod-e1000e \
	kmod-natsemi \
	kmod-ne2k-pci \
	kmod-pcnet32 \
	kmod-8139too \
	kmod-r8169 \
	kmod-sis900 \
	kmod-tg3 \
	kmod-via-rhine \
	kmod-via-velocity \
	kmod-forcedeth

# from ffki-packages:
USB_PACKAGES_STORAGE += \
	gluon-usb-media \
	gluon-config-mode-usb-media

# add addition network drivers and usb stuff only to targets where disk space does not matter
ifeq ($(GLUON_TARGET),x86-generic)
	# support the USB stack on x86 devices
	# and add a few common USB NICs
	GLUON_SITE_PACKAGES += \
#		$(USB_PACKAGES_STORAGE) \
		$(USB_PACKAGES_HID) \
		$(USB_PACKAGES_TETHERING) \
		$(USB_PACKAGES_3G) \
		$(USB_PACKAGES_GPS) \
		$(USB_X86_GENERIC_NETWORK_MODULES)
endif

#ifeq ($(GLUON_TARGET),ar71xx-generic)
#	GLUON_TLWR1043_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWR842_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWDR4300_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWR2543_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WRT160NL_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_DIR825B1_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_DIR505A1_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_GLINET_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WNDR3700_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WZRHPG450H_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WZRHPAG300H_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_ARCHERC7_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#endif

#ifeq ($(GLUON_TARGET),mpc85xx-generic)
#	GLUON_TLWDR4900_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#endif
