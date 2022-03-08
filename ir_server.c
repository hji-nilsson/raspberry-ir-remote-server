/**
 * @file  ir_server.c
 * @brief Entry point and main loop of IR server application
 */

/* -- Includes ------------------------------------------------------------------------------------------------------ */

#include <stdio.h>
#include "lirc_client.h"

/* -- Private macros ------------------------------------------------------------------------------------------------ */

/* -- Private type definitions -------------------------------------------------------------------------------------- */

/* -- Private variables --------------------------------------------------------------------------------------------- */

/* -- Private function prototypes ----------------------------------------------------------------------------------- */

/* -- Public functions ---------------------------------------------------------------------------------------------- */

/**
 * @brief  IR server entry point and main loop
 * @param  void
 * @retval int, functional code returned on exit. Will return 0 if OK.
 */
int main(void) {
    printf("Starting IR server...\n");
    const int fd = lirc_get_local_socket(NULL, 0);
    printf("IR socket: %d\n", fd);

    if (fd < 0) {
        printf("Process error: Could not get local socket\n");
        return -1;
    }

    if (lirc_send_one(fd, "RC-830", "KEY_POWER") == -1) {
        printf("Process error: Unable to send IR command\n");
    }

    return 0;
}

/* -- Private (static) functions ------------------------------------------------------------------------------------ */

