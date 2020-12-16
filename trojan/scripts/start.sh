#!/system/bin/sh

MODDIR=${0%/*}

start_proxy () {
  ${MODDIR}/trojan.service start &> /data/trojan/run/service.log && \
  if [ -f /data/trojan/appid.list ] ; then
    ${MODDIR}/trojan.tproxy enable &>> /data/trojan/run/service.log
  fi
}
if [ ! -f /data/trojan/manual ] ; then
  start_proxy
  inotifyd ${MODDIR}/trojan.inotify ${MODDIR}/.. &>> /data/trojan/run/service.log &
fi
