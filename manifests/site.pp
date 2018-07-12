node ip-10-0-3-230 {
}

node ip-10-0-3-20 {
}

# update /etc/puppet on puppet master (use puppet master node name)
node ip-10-0-3-167 {
    cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
    }
}