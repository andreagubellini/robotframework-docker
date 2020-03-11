#!/bin/bash
set -e
if [ "$THREADS" -eq 0 ]; then
echo "#========! EXECUTING COMMAND robot $ROBOTARGS --outputdir /outputs/ /$TESTDIR/ !========#"
xvfb-run -a --server-args="-screen 0 1280x800x24 -ac -nolisten tcp -dpi 96 +extension RANDR" \
        robot --outputdir /outputs/ /$TESTDIR/
else
echo "#========! EXECUTING COMMAND pabot $ROBOTARGS --outputdir /outputs/ /$TESTDIR/ !========#"
xvfb-run -a --server-args="-screen 0 1280x800x24 -ac -nolisten tcp -dpi 96 +extension RANDR" \
        pabot --outputdir /outputs/ /$TESTDIR/
fi