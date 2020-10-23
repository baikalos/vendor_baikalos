# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# baikalos System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.baikalos.display.version=$(BAIKALOS_VERSION) \
    ro.baikalos.buildtype=$(BAIKALOS_BUILDTYPE) \
    ro.baikalos.version.update=$(BAIKALOS_BRANCH)-$(VERSION) \
    ro.modversion=$(BAIKALOS_VERSION) \
    ro.baikalos.version=$(VERSION)-$(BAIKALOS_BUILDTYPE)

# additions for LOS-recovery
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version=$(VERSION)

# baikalos Stats
ADDITIONAL_BUILD_PROPERTIES += \
    ro.baikalos.branch=$(BAIKALOS_BRANCH) \
    ro.romstats.url=https://stats.baikalos.ru/ \
    ro.romstats.name=BAIKALOS \
    ro.romstats.buildtype=$(BAIKALOS_BUILDTYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1
