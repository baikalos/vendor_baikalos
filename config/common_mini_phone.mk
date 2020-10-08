# Inherit mini common BaikalOS stuff
$(call inherit-product, vendor/baikalos/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/baikalos/config/telephony.mk)
