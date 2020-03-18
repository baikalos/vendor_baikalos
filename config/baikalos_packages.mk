# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
#    LockClock 

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    PhaseBeam \
    ThemePicker \
    WallpaperPicker2

# su
PRODUCT_PACKAGES += \
    adb_root

#ifeq ($(WITH_SU),true)
#PRODUCT_PACKAGES += \
#    su
#endif

# Extra Optional packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    Calculator \
    BluetoothExt \
#    Launcher3Dark

# MusicFX
PRODUCT_PACKAGES += \
    MusicFX

# Omni-Record
#PRODUCT_PACKAGES += \
#    OmniRecord

# Phonograph
PRODUCT_PACKAGES += \
    Phonograph

# Jelly
PRODUCT_PACKAGES += \
    Jelly

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws


# Touch Gestures - Experimental
PRODUCT_PACKAGES += \
    TouchGestures

# Fonts packages
#PRODUCT_PACKAGES += \
#    invictrix-fonts

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_BAIKALOS_CHARGER),true)
PRODUCT_PACKAGES += \
    baikalos_charger_res_images \
    font_log.png \
    libhealthd.baikalos
endif

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

#PRODUCT_PACKAGES += \
#    AndroidDarkThemeOverlay \
#    SettingsDarkThemeOverlay

# Bootanimation include
#PRODUCT_PACKAGES += \
#    bootanimation.zip 

# Boot animation include
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))

# determine the smaller dimension
TARGET_BOOTANIMATION_SIZE := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -lt $(TARGET_SCREEN_HEIGHT) ]; then \
    echo $(TARGET_SCREEN_WIDTH); \
  else \
    echo $(TARGET_SCREEN_HEIGHT); \
  fi )

# get a sorted list of the sizes
bootanimation_sizes := $(subst .zip,, $(shell ls vendor/baikalos/prebuilt/common/bootanimation))
bootanimation_sizes := $(shell echo -e $(subst $(space),'\n',$(bootanimation_sizes)) | sort -rn)

# find the appropriate size and set
define check_and_set_bootanimation
$(eval TARGET_BOOTANIMATION_NAME := $(shell \
  if [ -z "$(TARGET_BOOTANIMATION_NAME)" ]; then \
    if [ $(1) -le $(TARGET_BOOTANIMATION_SIZE) ]; then \
      echo $(1); \
      exit 0; \
    fi; \
  fi; \
  echo $(TARGET_BOOTANIMATION_NAME); ))
endef
$(foreach size,$(bootanimation_sizes), $(call check_and_set_bootanimation,$(size)))

ifeq ($(TARGET_BOOTANIMATION_HALF_RES),true)
PRODUCT_COPY_FILES += \
    vendor/baikalos/prebuilt/common/bootanimation/halfres/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/baikalos/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif
endif

# BAIKALOS OTA
ifeq ($(BAIKALOS_BUILDTYPE),OFFICIAL)
PRODUCT_PACKAGES +=  \
   BaikalDelta
endif

# BAIKALOS packages
PRODUCT_PACKAGES += \
    AicpExtras \
    BaikalExtras \
    FontUbuntuOverlay \
    FontOpenSansOverlay \
    FontComfortaaOverlay \
    FontCaviarDreamsOverlay \
    FontExotwoOverlay \
    FontSnigletOverlay \
    FontSignikaOverlay \
    FontOxaniumOverlay \
    TilesWallpaper


# include AICP overalys (Themes support)
-include packages/overlays/AICP/product_packages.mk

# include BaikalOS overalys
-include packages/overlays/baikalos/product_packages.mk
