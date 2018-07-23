node ip-10-0-3-230 {
	include sshd
	include apache
}

node ip-10-0-3-20 {
	include sshd
	include apache
}

# update /etc/puppet on puppet master (use puppet master node name)
node ip-10-0-3-167 {
	include sshd
	include apache
	
	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
    }
}
