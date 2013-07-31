# Config vars and files for activemq.
#
# Usage:
#
#     include activemq::config
class activemq::config {
  require boxen::config

  $configdir  = "${boxen::config::configdir}/activemq"
#  $configfile = "${configdir}/activemq.xml"
  $datadir    = "${boxen::config::datadir}/activemq"
  $executable = "${boxen::config::home}/homebrew/bin/activemq"
  $logdir     = "${boxen::config::logdir}/activemq"
  $port       = 61616
}
