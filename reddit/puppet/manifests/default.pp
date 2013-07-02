exec { "apt-get update":
    command => "apt-get update",
    user    => root,
    path    => "/usr/bin:/bin"
}

package { "curl":
    ensure => "installed"
}

exec { "download install script":
    command => "curl https://raw.github.com/reddit/reddit/b6c457aa136ba38274cabaedf42caa5875199acb/install-reddit.sh > /tmp/install-reddit.sh",
    user    => root,
    path    => "/usr/bin:/bin",
    require => Package["curl"]
}

exec { "make install script executable":
    command => "/bin/chmod +x /tmp/install-reddit.sh",
    user    => root,
    path    => "/usr/bin:/bin",
    require => Exec["download install script"]
}

exec { "replace reddit.local with 127.0.0.1":
    command => "sed -i 's/reddit.local/127.0.0.1/' /tmp/install-reddit.sh",
    user    => root,
    path    => "/usr/bin:/bin",
    require => Exec["download install script"]
}

exec { "install reddit":
    command => "/tmp/install-reddit.sh",
    user    => root,
    timeout => 9999,
    require => [
        Exec["apt-get update"],
        Exec["make install script executable"],
        Exec["replace reddit.local with 127.0.0.1"]
    ]
}
