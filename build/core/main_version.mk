# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# baikalos System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.baikalos.display.version=$(BAIKALOS_VERSION) \
    ro.baikalos.buildtype=$(BAIKALOS_BUILD_TYPE) \
    ro.baikalos.version.update=$(BAIKALOS_BRANCH)-$(VERSION) \
    ro.modversion=$(BAIKALOS_VERSION) \
    ro.baikalos.version=$(VERSION)-$(BAIKALOS_BUILD_TYPE)

# additions for LOS-recovery
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version=$(VERSION) \
    ro.lineage.version=-$(shell date +%Y%m%d)-

# baikalos Stats
ADDITIONAL_BUILD_PROPERTIES += \
    ro.baikalos.branch=$(BAIKALOS_BRANCH) \
    ro.romstats.url=https://stats.baikalos.ru/ \
    ro.romstats.name=BaikalOS \
    ro.romstats.buildtype=$(BAIKALOS_BUILD_TYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1
