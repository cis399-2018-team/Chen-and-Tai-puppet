class apache {
	package {
		"apache2": ensure => installed;
	}

	file { "/etc/apache2/apache2.conf":
			source => "puppet:///modules/apache/apache2.conf",
			mode => 644,
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
	file { "/var/www/html":
			ensure => directory,
			require => package["apache2"],
			recurse => true,
			owner => root,
			group => root,
			source => "puppet:///modules/apache/test.html",
			mode => 644,

	}
}