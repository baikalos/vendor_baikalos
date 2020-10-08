# Inherit mini common BAIKALOS stuff
$(call inherit-product, vendor/baikalos/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
