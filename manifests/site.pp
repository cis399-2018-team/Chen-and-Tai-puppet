node ip-10-0-3-37 {
	include sshd
	include apache
	include user
}
#new injoker_2
node ip-10-0-3-235 {
	include sshd
	include user
}

node ip-10-0-3-102 {
	include sshd
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
