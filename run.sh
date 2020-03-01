#!/bin/bash

set -e

xvfb-run -a --server-args="-screen 0 1280x800x24 -ac -nolisten tcp -dpi 96 +extension RANDR" \
        robot --outputdir /outputs/ /tests/*.robot