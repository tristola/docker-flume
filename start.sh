#!/bin/sh

./bin/flume-ng agent --conf conf --conf-file /opt/config/flume/example.conf --name a1 -Dflume.root.logger=INFO,console

