export BUILD_USERNAME=Floryn
export BUILD_HOSTNAME=SingkoLab
export KBUILD_BUILD_USER=Floryn
export KBUILD_BUILD_HOST=SingkoLab
export TARGET_KERNEL_BUILD_USER=Floryn
export TARGET_KERNEL_BUILD_HOST=SingkoLab

# Clone dependencies
git clone --depth 1 https://github.com/SingkoLab/vendor_xiaomi_merlin -b 14 vendor/xiaomi/merlin

git clone --depth 1 https://gitlab.com/MT6768Lab/KernelTree kernel/xiaomi/mt6768

git clone --depth 1 https://github.com/SingkoLab/device_mediatek_sepolicy_vndr -b 14 device/mediatek/sepolicy_vndr

git clone --depth 1 https://github.com/SingkoLab/hardware_mediatek -b 14 hardware/mediatek

git clone --depth 1 https://github.com/SingkoLab/hardware_xiaomi -b 14 hardware/xiaomi

# Configure the patches path
patchDir="device/xiaomi/merlin/patches"

# Patch RenderEngineThreaded
echo "Applying RenderEngineThreaded patches!"
rm -rf frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp
cp ${patchDir}/frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp frameworks/native/libs/renderengine/threaded/

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"
