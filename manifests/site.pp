node ip-10-0-3-37 {
	include sshd
	include apache
	include user
}

# update /etc/puppet on puppet master (use puppet master node name)
node ip-10-0-3-167 {
	include sshd
	
	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
    }
}
