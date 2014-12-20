#include "plugins.h"

#define PLUGIN(plugin) void init_plugin_##plugin(void);
PLUGINS
#undef PLUGIN

#include "plugins/debug.h"
#include "plugins/loop.h"
#include "plugins/rgbled.h"
#include <Arduino.h>
#include "abus/ABus.h"

static int cnt = 0;
void setup() {
	#define PLUGIN(plugin) init_plugin_##plugin();
	PLUGINS
	#undef PLUGIN
//}

#if 0
	ABus.subscribe([] (uint16_t msgId, void* pArg) {

		// handle message
		switch(msgId) {
			case MSG_LOOP_TICK:
				LOG_DEBUG("MSG_LOOP_TICK");
				cnt += 1;
#if DEBUG_LEVEL >= _DEBUG_
				#define THRESHOLD 1
#else
				#define THRESHOLD 1000
#endif

				if(cnt == THRESHOLD) {
					ABus.send(MSG_RGBLED_OFF);
				} else if(cnt == (2*THRESHOLD)) {
					ABus.send(MSG_RGBLED_ON);
					cnt = 0;
				}
				break;
		}
	});
#endif

}
