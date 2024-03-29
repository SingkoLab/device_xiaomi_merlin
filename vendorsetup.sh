export BUILD_USERNAME=TahuGehot
export BUILD_HOSTNAME=SingkoLab
export KBUILD_BUILD_USER=TahuGehot
export KBUILD_BUILD_HOST=SingkoLab
export TARGET_KERNEL_BUILD_USER=TahuGehot
export TARGET_KERNEL_BUILD_HOST=SingkoLab

# Clone dependencies
git clone --depth 1 https://github.com/SingkoLab/vendor_xiaomi_merlin -b 14 vendor/xiaomi/merlin

git clone --depth 1 https://github.com/SingkoLab/KernelTree-MT6768 -b 14 kernel/xiaomi/mt6768

git clone --depth 1 https://github.com/SingkoLab/device_mediatek_sepolicy_vndr -b 14 device/mediatek/sepolicy_vndr

git clone --depth 1 https://github.com/SingkoLab/hardware_mediatek -b 14 hardware/mediatek
