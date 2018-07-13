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
			# changes to configuration cause service restart
			subscribe => File["/etc/ssh/sshd_config"],
			# notifying sshd when it changes
			notify    => [ File["/etc/sshd.conf"] ],
			}

	
	ssh_authorized__key { "injokerCIS399":
			ensure =>present,
			user => "ubuntu",
			type => "ssh-rsa",
			key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCbdoZIN0kuw7SZd428Ibv0fsrmijw3lXun+AYQgvcfGhwHNO/fRgGS1LeaEfcIhzJQ/86r2OOMpO0C9w9vnkXSPbspFGofzQu2nH5w7a12i91d47FLd6wVbT9FQYJC+IbYVl1Xw3S9KUsMwgA9ovLfy00ejRWPf2sH/DjCNWCKbXWn7s9B4EWGeClIfrs0FCP+YZ3RsZfahn/oB1FT9dNqHrHaKNjd2TlDWu3oBVJJEUNPZml8gnD/tOhFaJbdZdTU+qNtFHv+AlXrhixhvax0UG2Y/c22ofWOyxeqYS8xgoQRpugkBIGaILkAa0IzB7BzhlfU0QYCOnR1K7D9QAqj",
	}
}
