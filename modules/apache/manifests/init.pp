class apache {
	package {
		"apache2": ensure => installed;
	}

	file { "/etc/apache2/apache2.conf":
			source => [
					"puppet:///modules/apache/apache2.conf",
					],
			mode => 444,
			owner => root,
			group => root,
			require => Package["appache2"],

	}

	service { "appache2":
			ensure => running,
			enable => ture,
			require => [Package["apache2"], File["/etc/apache2/apache2.conf"]],
			subscribe => File["/etc/apache2/apache2.conf"]

	}
}