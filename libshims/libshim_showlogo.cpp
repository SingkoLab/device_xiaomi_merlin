#include <gui/SurfaceComposerClient.h>
#include <private/gui/ComposerServiceAIDL.h>
#include <ui/Size.h>

#include "include/DisplayConfig.h"

using namespace android;

DisplayConfig convertDisplayModeToConfig(ui::DisplayMode mode) {
    DisplayConfig config;

    // id
    config.resolution = mode.resolution;
    config.xDpi = mode.xDpi;
    config.yDpi = mode.yDpi;
    // supportedHdrTypes
    config.refreshRate = mode.refreshRate;
    config.appVsyncOffset = mode.appVsyncOffset;
    config.sfVsyncOffset = mode.sfVsyncOffset;
    config.presentationDeadline = mode.presentationDeadline;
    config.configGroup = mode.group;
    return config;
}

namespace SurfaceComposerClient {
    std::optional<PhysicalDisplayId> getInternalDisplayId() {
        std::vector<int64_t> displayIds;
        sp<gui::ISurfaceComposer> mComposerService = ComposerServiceAIDL::getComposerService();
        binder::Status status = mComposerService->getPhysicalDisplayIds(&displayIds);
        return (!status.isOk() || displayIds.empty())
                ? std::nullopt
                : DisplayId::fromValue<PhysicalDisplayId>(
                            static_cast<uint64_t>(displayIds.front()));
    }

    // TODO(b/74619554): Remove this stopgap once the framework is display-agnostic.
    sp<IBinder> getInternalDisplayToken() {
        const auto displayId = getInternalDisplayId();
        if (!displayId) return nullptr;
        sp<IBinder> display;
        sp<gui::ISurfaceComposer> mComposerService = ComposerServiceAIDL::getComposerService();
        binder::Status status =
                mComposerService->getPhysicalDisplayToken(static_cast<int64_t>(displayId->value),
                                                            &display);
        return status.isOk() ? display : nullptr;
    }
}

extern "C" {

void * _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjiiRKNS_2spINS_7IBinderEEENS_3gui13LayerMetadataEPj(
    void *thisptr, const String8 &name, uint32_t w, uint32_t h,
    PixelFormat format, uint32_t flags, const sp<IBinder> &parentHandle,
    LayerMetadata metadata, uint32_t *outTransformHint);

void * _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlENS_13LayerMetadataEPj(
    void *thisptr, const String8 &name, uint32_t w, uint32_t h,
    PixelFormat format, uint32_t flags, SurfaceControl *parent,
    LayerMetadata metadata, uint32_t *outTransformHint) {
  return _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjiiRKNS_2spINS_7IBinderEEENS_3gui13LayerMetadataEPj(
      thisptr, name, w, h, format, flags, parent->getHandle(), metadata, outTransformHint);
}

void *_ZN7android14SurfaceControl10getSurfaceEv(void *thisptr);

void *_ZNK7android14SurfaceControl10getSurfaceEv(void *thisptr) {
  return _ZN7android14SurfaceControl10getSurfaceEv(thisptr);
}

status_t _ZN7android21SurfaceComposerClient20getActiveDisplayModeERKNS_2spINS_7IBinderEEEPNS_2ui11DisplayModeE(
    void *thisptr, const sp<IBinder> &display, ui::DisplayMode *mode);

status_t _ZN7android21SurfaceComposerClient22getActiveDisplayConfigERKNS_2spINS_7IBinderEEEPNS_13DisplayConfigE(
    void *thisptr, const sp<IBinder> &display, DisplayConfig *config) {
    ui::DisplayMode mode;
    status_t result = _ZN7android21SurfaceComposerClient20getActiveDisplayModeERKNS_2spINS_7IBinderEEEPNS_2ui11DisplayModeE(thisptr, display, &mode);
    if (result != NO_ERROR) {
        return result;
    }
    *config = convertDisplayModeToConfig(mode);
    return NO_ERROR;
}

status_t _ZN7android21SurfaceComposerClient11Transaction5applyEbb(
    void *thisptr, bool synchronous, bool oneWay);

status_t _ZN7android21SurfaceComposerClient11Transaction5applyEb(void *thisptr,
                                                        bool synchronous) {
  return _ZN7android21SurfaceComposerClient11Transaction5applyEbb(
      thisptr, synchronous, false /* oneWay */);
}

ui::Size _ZN7android2ui4Size7INVALIDE;
}
