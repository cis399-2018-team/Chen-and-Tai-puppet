class sshd {
	package {
			"openssh-server": ensure => installed;
	}

	file { " /etc/sshd.conf":
			source => [
					# from modules/sshd/files/$hostname/sshd.conf
					"puppet:///modules/sshd/$hostname/sshd.conf",
					# from modules/ssh/files/ssh.conf
					"puppet:///modules/sshd/files/sshd.conf",
			],
			mode   => 444,
			owner  => root,
			group  => root, 
			# package must be installed before configuration file
			require => Package["openssh-server"],	
	}

	service { "sshd":
			# automatically start at boot time
			enable	  => true,
			# restart service if it is not running
			ensure	  => running,
			# "service sshd status" returns useful service status info
			hasstatus => true,
			# package and configuration must be present for service
			require   => [ Package["openssh-server"],
						   File["/etc/sshd.conf"] ],
			# changes to configuration cause service restart
			subscribe => File["/etc/sshd.conf"],
			}

	

}