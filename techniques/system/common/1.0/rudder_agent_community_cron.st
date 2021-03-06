# Cron file for Rudder
#
# Will manually run cf-agent in case cf-execd is no longer running. cf-agent will fire up a new cf-execd.
#
# To temporarily avoid this behaviour, touch /opt/rudder/etc/disable-agent.
# Don't forget to remove that file when you're done!

0,5,10,15,20,25,30,35,40,45,50,55 * * * * root if [ ! -e ${g.rudder_base}/etc/disable-agent -a `ps -efww | grep -E "(cf-execd|cf-agent)" | grep -E "${sys.workdir}/bin/(cf-execd|cf-agent)" | grep -v grep | wc -l` -eq 0 ]; then ${sys.workdir}/bin/cf-agent -f failsafe.cf \&\& ${sys.workdir}/bin/cf-agent; fi
