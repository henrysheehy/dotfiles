#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh Messaging`
then
    exit
else
    exec signal-desktop &
    exec whatsapp-for-linux &
fi
exit
