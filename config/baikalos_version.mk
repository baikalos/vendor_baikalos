# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%Y%0m%0d")

BAIKALOS_BRANCH=q

# BAIKALOS RELEASE VERSION
BAIKALOS_VERSION_MAJOR = 10
BAIKALOS_VERSION_MINOR = 0
BAIKALOS_VERSION_MAINTENANCE = alpha

PRODUCT_VERSION_MAJOR := $(BAIKALOS_VERSION_MAJOR)
PRODUCT_VERSION_MINOR := $(BAIKALOS_VERSION_MINOR)
PRODUCT_VERSION_MAINTENANCE := $(BAIKALOS_VERSION_MAINTENANCE)

VERSION := $(BAIKALOS_VERSION_MAJOR).$(BAIKALOS_VERSION_MINOR)

ifndef BAIKALOS_BUILDTYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^BAIKALOS_||g')
        BAIKALOS_BUILDTYPE := $(RELEASE_TYPE)
    else
        BAIKALOS_BUILDTYPE := UNOFFICIAL
    endif
endif

ifdef BAIKALOS_BUILDTYPE
    ifeq ($(BAIKALOS_BUILDTYPE), NIGHTLY)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)_$(BAIKALOS_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%0m%0d)
    endif
    ifeq ($(BAIKALOS_BUILDTYPE), WEEKLY)
       BAIKALOS_VERSION := $(TARGET_PRODUCT)_$(BAIKALOS_BRANCH)-$(VERSION)-WEEKLY-$(shell date -u +%Y%0m%0d)
    endif
    ifeq ($(BAIKALOS_BUILDTYPE), EXPERIMENTAL)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)_$(BAIKALOS_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%0m%0d)
    endif
    ifeq ($(BAIKALOS_BUILDTYPE), UNOFFICIAL)
        BAIKALOS_VERSION := $(TARGET_PRODUCT)_$(BAIKALOS_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%0m%0d)
    endif
else
#We reset back to UNOFFICIAL
        BAIKALOS_VERSION := $(TARGET_PRODUCT)_$(BAIKALOS_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%0m%0d)
endif

# BAIKALOS System Version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.baikalos.display.version=$(BAIKALOS_VERSION) \
    ro.baikalos.buildtype=$(BAIKALOS_BUILDTYPE) \
    ro.baikalos.version.update=$(BAIKALOS_BRANCH)-$(VERSION) \
    ro.modversion=$(BAIKALOS_VERSION) \
    ro.baikalos.version=$(VERSION)-$(BAIKALOS_BUILDTYPE)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.baikalos.branch=$(BAIKALOS_BRANCH) \
    ro.romstats.url=https://stats.baikalos.ru/ \
    ro.romstats.name=BAIKALOS \
    ro.romstats.buildtype=$(BAIKALOS_BUILDTYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1
