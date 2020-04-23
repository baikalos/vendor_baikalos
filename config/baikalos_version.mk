# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%Y%0m%0d")

BAIKALOS_BRANCH=q

# BAIKALOS RELEASE VERSION
BAIKALOS_VERSION_MAJOR = 10
BAIKALOS_VERSION_MINOR = 0
BAIKALOS_VERSION_MAINTENANCE = 0

PRODUCT_VERSION_MAJOR := $(BAIKALOS_VERSION_MAJOR)
PRODUCT_VERSION_MINOR := $(BAIKALOS_VERSION_MINOR)
PRODUCT_VERSION_MAINTENANCE := $(BAIKALOS_VERSION_MAINTENANCE)

VERSION := $(BAIKALOS_VERSION_MAJOR).$(BAIKALOS_VERSION_MINOR)

ifndef BAIKALOS_BUILD_TYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^BAIKALOS_||g')
        BAIKALOS_BUILD_TYPE := $(RELEASE_TYPE)
    else
        BAIKALOS_BUILD_TYPE := UNOFFICIAL
    endif
endif

ifdef BAIKALOS_BUILD_TYPE
    ifeq ($(BAIKALOS_BUILD_TYPE), OFFICIAL)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d-%H%M)
    endif
    ifeq ($(BAIKALOS_BUILD_TYPE), NIGHTLY)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d-%H%M)
    endif
    ifeq ($(BAIKALOS_BUILD_TYPE), WEEKLY)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d-%H%M)
    endif
    ifeq ($(BAIKALOS_BUILD_TYPE), EXPERIMENTAL)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d-%H%M)
    endif
    ifeq ($(BAIKALOS_BUILD_TYPE), UNOFFICIAL)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d-%H%M)
    endif
    ifeq ($(BAIKALOS_BUILD_TYPE), DEV)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-$(BAIKALOS_BUILD_TYPE)-$(shell date -u +%Y%0m%0d)
    endif
else
#We reset back to UNOFFICIAL
        BAIKALOS_VERSION := $(TARGET_PRODUCT)-10-UNOFFICIAL-$(shell date -u +%Y%0m%0d-%H%M)
endif
# Set all version

BAIKALOS_MOD_VERSION := $(BAIKALOS_VERSION)

# BAIKALOS System Version
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.baikalos.display.version=$(BAIKALOS_VERSION) \
    ro.baikalos.buildtype=$(BAIKALOS_BUILD_TYPE) \
    ro.baikalos.version.update=$(BAIKALOS_BRANCH)-$(VERSION) \
    ro.modversion=$(BAIKALOS_VERSION) \
    ro.baikalos.version=$(VERSION)-$(BAIKALOS_BUILD_TYPE) \
    baikalos.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.baikalos.version=$(BAIKALOS_VERSION) \
    ro.modversion=$(BAIKALOS_MOD_VERSION) \
    ro.baikalos.fingerprint=$(PLATFORM_VERSION)-$(BUILD_ID)-$(BAIKALOS_BUILD_TYPE)-$(shell date +%Y%m%d)


# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.baikalos.branch=$(BAIKALOS_BRANCH) \
    ro.romstats.url=https://stats.baikalos.ru/ \
    ro.romstats.name=BAIKALOS \
    ro.romstats.buildtype=$(BAIKALOS_BUILD_TYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1

