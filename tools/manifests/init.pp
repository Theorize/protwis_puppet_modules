class tools {

    # package install list
    $packages = $operatingsystem ? {
        "Ubuntu" => [
            "expect",
            "htop",
            "vim",
            "clustalo",
            "ncbi-blast+",
        ],
        "CentOS" => [
            "expect",
            "htop",
            "clustal-omega",
            # "ncbi-blast+",
        ],
    }

    # install packages
    package { $packages:
        ensure => present,
        require => Exec["update-package-repo"]
    }
}
