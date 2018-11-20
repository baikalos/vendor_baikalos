# Charger
#ifneq ($(WITH_CM_CHARGER),false)
#    BOARD_HAL_STATIC_LIBRARIES := libhealthd.cm
#endif

include vendor/baikalos/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/baikalos/config/BoardConfigQcom.mk
endif

include vendor/baikalos/config/BoardConfigSoong.mk

PRODUCT_COPY_FILES += \
    vendor/baikalos/config/sysconfig/baikal_whitelist.xml:system/etc/sysconfig/baikal_whitelist.xml \
    vendor/baikalos/config/permissions/privapp-permissions-baikal.xml:system/etc/permissions/privapp-permissions-baikal.xml \
