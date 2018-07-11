node ip-10-0-3-230 {
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}

node ip-10-0-3-20 {
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}


