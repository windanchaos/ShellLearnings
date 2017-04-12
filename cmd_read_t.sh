#!/bin/bash

TIP="Input your account: "
read -t 5 -p "$TIP" account
if [ -n "$account" ]; then
		echo "Account: $account"
else
		echo "Account: anonymous"
fi
