class zsh {

    # Install dependencies
    package { 'git':
        ensure => installed,
    }

    package { 'curl':
        ensure => installed,
    }

    # Install ZSH
    package { 'zsh':
        ensure => latest,
        # require => Exec['apt-get update']
    }

    # Clone oh-my-zsh
    exec { 'clone oh-my-zsh':
        cwd     => "/home/vagrant",
        user    => "vagrant",
        command => "git clone https://github.com/robbyrussell/oh-my-zsh /home/vagrant/.oh-my-zsh",
        creates => "/home/vagrant/.oh-my-zsh",
        require => [Package['git'], Package['zsh'], Package['curl']]
    }


    # Set the shell
    exec { "chsh -s /usr/bin/zsh vagrant":
        unless  => "grep -E '^vagrant.+:/usr/bin/zsh$' /etc/passwd",
        require => Package['zsh']
    }
}