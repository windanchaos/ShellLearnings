#!/bin/bash

if [ -f oneshot ]; then
    echo "found oneshot"
else
    touch oneshot
    echo "# This file is generated automatically." > oneshot
    echo "# It is only used to indicate that the checkout action for svn has been completed." >> oneshot
    echo "# The created date: " $(date +%Y%m%d-%H%M%S) >> oneshot
    echo "isCheckout=true" >> oneshot
    echo "touch oneshot"
fi
