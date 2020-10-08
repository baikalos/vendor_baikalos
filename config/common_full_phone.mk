# Inherit full common baikalos stuff
$(call inherit-product, vendor/baikalos/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include baikalos LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/baikalos/overlay/dictionaries

$(call inherit-product, vendor/baikalos/config/telephony.mk)
