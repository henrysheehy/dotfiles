#!/bin/sh
################################################
#     * Push user-defined environment to *     #
#            * global directory *              #
#             Henry Joseph Sheehy              #
#           Copyright August 2023              #
#               GNU 2.0 License                #
################################################
# Recommended that you do not modify this file
# Instead, modify its config file located at
CONF=$HOME/.config/.environment

# This programme pushes changes to
ENV=/etc/environment

## Remove commented and empty lines:

APPEND=$(sed '/^\([[:space:]]*$\|#\)/d' $CONF)

SENTENCE="# User-defined global variables"

FILE=$(sed -ne '0,/^'"$SENTENCE"'$/p' $ENV )
echo "${FILE}

${APPEND}" | sudo tee $ENV
