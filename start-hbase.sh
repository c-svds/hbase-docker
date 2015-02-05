#!/bin/bash
#
# Script to start docker and update the /etc/hosts file to point to
# the hbase-docker container
#
# hbase thrift and master server logs are written to the local
# logs directory
#

echo "Starting HBase container"
rm -rf logs/
mkdir -p logs
id=$(docker run -d -v $PWD/log:/opt/hbase/logs -p :2181 -p :9090 -p :60000 -p :60020 -p :60010 -p :60030 csvds/hbase)

echo "Container has ID $id"

echo "Now connect to hbase at localhost on the standard ports"
echo "  ZK 2181, Thrift 9090, Master 60000, Region 60020"
echo "Or connect to host hbase-docker (in the container) on the same ports"
echo ""
echo "For docker status:"
echo "$ id=$id"
echo "$ docker ps $$id"
