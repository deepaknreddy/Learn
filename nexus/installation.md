      yum update -y
      sudo yum install wget -y
      java -version
      sudo yum install java-1.8.0-openjdk.x86_64 -y

download latest nexus:

            cd /opt
            sudo wget -O latest-unix.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
            tar -xvzf latest-unix.tar.gz
            sudo mv nexus-3* nexus
            mv sonatype-work nexusdata
            ls -lh

permissions:
useradd --system --no-create-home nexus
chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/nexusdata


vi /opt/nexus/bin/nexus.vmoptions
make following changes:
-Xms2703m
-Xmx2703m
-XX:MaxDirectMemorySize=2703m
-XX:+UnlockDiagnosticVMOptions
-XX:+LogVMOutput
-XX:LogFile=../nexusdata/nexus3/log/jvm.log
-XX:-OmitStackTraceInFastThrow
-Djava.net.preferIPv4Stack=true
-Dkaraf.home=.
-Dkaraf.base=.
-Dkaraf.etc=etc/karaf
-Djava.util.logging.config.file=etc/karaf/java.util.logging.properties
-Dkaraf.data=../nexusdata/nexus3
-Dkaraf.log=../nexusdata/nexus3/log
-Djava.io.tmpdir=../nexusdata/nexus3/tmp
-Dkaraf.startLocalConsole=false

vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"

vi /opt/nexus/etc/nexus-default.properties
application-port=8081
application-host=0.0.0.0    (change these two if needed,else leave as it is)

Configure the open file limit of the nexus user:
vi /etc/security/limits.conf
add this line,
nexus - nofile 65536


Set Nexus as a System Service:
sudo vi /etc/systemd/system/nexus.service
add the below sentences,

[Unit]
Description=Nexus Service
After=syslog.target network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Group=nexus
Restart=on-failure

[Install]
WantedBy=multi-user.target



add nexus service to boot:

      systemctl daemon-reload
      systemctl enable nexus.service
      systemctl start nexus.service
