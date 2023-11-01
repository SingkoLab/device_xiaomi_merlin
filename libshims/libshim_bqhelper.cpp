#include <media/stagefright/bqhelper/GraphicBufferSource.h>
#include <media/stagefright/bqhelper/ComponentWrapper.h>

using namespace android;

extern "C" {
status_t _ZN7android19GraphicBufferSource9configureERKNS_2spINS_16ComponentWrapperEEEiijjj(GraphicBufferSource *thisptr,
    const sp<ComponentWrapper>& component, int32_t dataSpace, int32_t bufferCount, 
    uint32_t frameWidth, uint32_t frameHeight, uint32_t consumerUsage) {
        return thisptr->configure(component, dataSpace, bufferCount,
            frameWidth, frameHeight, (uint64_t) consumerUsage);
    }
}
