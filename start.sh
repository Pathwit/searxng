#!/bin/bash
# SearXNG 启动脚本 - 运行在8011端口

cd /www/wwwroot/s.pathwit.com/searxng

# 设置环境变量
export SEARXNG_DEBUG=0
export SEARXNG_SECRET="a2d523795b161f0b4bf28f1acb2d93adcf364a03e4c0d196c5a15aaba0f76053"
export GRANIAN_RELOAD="false"
export GRANIAN_PROCESS_NAME="searxng"
export GRANIAN_INTERFACE="wsgi"
export GRANIAN_HOST="::"
export GRANIAN_PORT="8011"
export GRANIAN_WEBSOCKETS="false"
export GRANIAN_BLOCKING_THREADS="4"
export GRANIAN_WORKERS_KILL_TIMEOUT="30s"
export GRANIAN_BLOCKING_THREADS_IDLE_TIMEOUT="5m"
export GRANIAN_WORKERS="1"

# 激活虚拟环境并运行
./local/py3/bin/granian searx.webapp:app

