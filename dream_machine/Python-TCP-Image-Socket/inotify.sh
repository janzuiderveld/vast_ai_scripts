#!/bin/sh
MONITORDIR="/content/vast_ai/dream_machine/8081_images0"
inotifywait -m -r -e create --format '%w%f' "${MONITORDIR}" | while read NEWFILE
do
        echo "${NEWFILE}" >> Sketch-Simulator/out.log
done