#!/bin/bash
sleep 1 && conkystart &
sleep 1 && devileggs &
sleep 1 && tomboy --panel-applet &
sleep 1 && pidgin --nologin &
sleep 1 && keepass2 &

exit $?