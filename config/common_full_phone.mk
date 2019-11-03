# Inherit full common BAIKALOS stuff
$(call inherit-product, vendor/baikalos/config/common_full.mk)
$(call inherit-product, vendor/baikalos/config/common_apn.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include BAIKALOS LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/baikalos/overlay/dictionaries

$(call inherit-product, vendor/baikalos/config/telephony.mk)
