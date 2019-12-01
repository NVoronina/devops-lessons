#!/bin/bash

#on second machine cron
# 0 6 * * *
find ~/files -type f -mtime 7 -exec rm -rf {} \;