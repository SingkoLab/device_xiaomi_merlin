export KBUILD_BUILD_USER=Subreker
export KBUILD_BUILD_HOST=singko-prjkt
export BUILD_USERNAME=Subreker
export BUILD_HOSTNAME=singko-prjkt
export TARGET_KERNEL_BUILD_USER=Subreker
export TARGET_KERNEL_BUILD_HOST=singko-prjkt

# Clone dependencies
git clone --depth 1 https://github.com/singko-prjkt/vendor_xiaomi_merlin -b 14 vendor/xiaomi/merlin

git clone --depth 1 https://gitlab.com/MT6768Lab/KernelTree kernel/xiaomi/mt6768

git clone --depth 1 https://github.com/singko-prjkt/device_mediatek_sepolicy_vndr -b 14 device/mediatek/sepolicy_vndr

git clone --depth 1 https://github.com/singko-prjkt/hardware_mediatek -b 14 hardware/mediatek

# Configure the patches path
patchDir="device/xiaomi/merlin/patches"

# Patch RenderEngineThreaded
echo "Applying RenderEngineThreaded patches!"
rm -rf frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp
cp ${patchDir}/frameworks/native/libs/renderengine/threaded/RenderEngineThreaded.cpp frameworks/native/libs/renderengine/threaded/
