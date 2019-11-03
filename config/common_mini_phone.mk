# Inherit mini common BAIKALOS stuff
$(call inherit-product, vendor/baikalos/config/common_mini.mk)
$(call inherit-product, vendor/baikalos/config/common_apn.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/baikalos/config/telephony.mk)
