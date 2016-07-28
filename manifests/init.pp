# = Class: puppetdashboard
#
# This is the main puppetdashboard class
#
#
# == Parameters
#
# Module specific parameters
#
# [*db_host*]
#   Host of the production database
#
# [*db_port*]
#   Port of the production database
#
# [*db_name*]
#   Name of the production database
#
# [*db_user*]
#   User for production database
#
# [*db_password*]
#   Password for production database
#
# [*ca_server*]
#   Specify CA server
#
# [*inventory_server*]
#   Specify a unique inventory server
#
# [*enable_inventory_service*]
#   Enable inventory service
#
# [*filebucket_server*]
#   Specify a unique file bucket server
#
# [*use_file_bucket_diffs*]
#   Enable file bucket diffs
#
# [*no_longer_reporting_cutoff*]
#   Specify time in seconds since last report before a node is considered no longer reporting
#   Default: 3600 (1 hour)
#
# [*optimize_cron*]
#   Enable DB optimization rake task
#
# [*clean_old_reports*]
#   Clean up old reports
#
# [*config_file_db*]
#   Path of the database.yml configuration file.
#   Its content (for the production environment) is base on the above
#   parameters
#
# [*template_db*]
#   A custom temlate file to use for the database.yml instead of the default
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, puppetdashboard class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $puppetdashboard_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, puppetdashboard main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $puppetdashboard_source
#
# [*source_dir*]
#   If defined, the whole puppetdashboard configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $puppetdashboard_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $puppetdashboard_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, puppetdashboard main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $puppetdashboard_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $puppetdashboard_options
#
# [*service_autorestart*]
#   Automatically restarts the puppetdashboard service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $puppetdashboard_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $puppetdashboard_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $puppetdashboard_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $puppetdashboard_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for puppetdashboard checks
#   Can be defined also by the (top scope) variables $puppetdashboard_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $puppetdashboard_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $puppetdashboard_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $puppetdashboard_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $puppetdashboard_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for puppetdashboard port(s)
#   Can be defined also by the (top scope) variables $puppetdashboard_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling puppetdashboard. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $puppetdashboard_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $puppetdashboard_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $puppetdashboard_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $puppetdashboard_audit_only
#   and $audit_only
#
# Default class params - As defined in puppetdashboard::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of puppetdashboard package
#
# [*service*]
#   The name of puppetdashboard service
#
# [*service_workers*]
#   The name of puppet dashboard workers service
#
# [*service_status*]
#   If the puppetdashboard service init script supports status argument
#
# [*process*]
#   The name of puppetdashboard process
#
# [*process_args*]
#   The name of puppetdashboard arguments. Used by puppi and monitor.
#   Used only in case the puppetdashboard process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user puppetdashboard runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $puppetdashboard_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $puppetdashboard_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include puppetdashboard"
# - Call puppetdashboard as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class puppetdashboard (
  $db_host                    = params_lookup( 'db_host' ),
  $db_port                    = params_lookup( 'db_port' ),
  $db_name                    = params_lookup( 'db_name' ),
  $db_user                    = params_lookup( 'db_user' ),
  $db_password                = params_lookup( 'db_password' ),
  $ca_server                  = params_lookup( 'ca_server' ),
  $inventory_server           = params_lookup( 'inventory_server' ),
  $enable_inventory_service   = params_lookup( 'enable_inventory_service' ),
  $filebucket_server          = params_lookup( 'filebucket_server' ),
  $use_file_bucket_diffs      = params_lookup( 'use_file_bucket_diffs' ),
  $no_longer_reporting_cutoff = params_lookup( 'no_longer_reporting_cutoff' ),
  $optimize_cron              = params_lookup( 'optimize_cron' ),
  $clean_old_reports          = params_lookup( 'clean_old_reports' ),
  $setup_mysql                = params_lookup( 'setup_mysql' ),
  $config_file_db             = params_lookup( 'config_file_db' ),
  $template_db                = params_lookup( 'template_db' ),
  $my_class                   = params_lookup( 'my_class' ),
  $source                     = params_lookup( 'source' ),
  $source_dir                 = params_lookup( 'source_dir' ),
  $source_dir_purge           = params_lookup( 'source_dir_purge' ),
  $template                   = params_lookup( 'template' ),
  $service_autorestart        = params_lookup( 'service_autorestart' , 'global' ),
  $options                    = params_lookup( 'options' ),
  $version                    = params_lookup( 'version' ),
  $absent                     = params_lookup( 'absent' ),
  $disable                    = params_lookup( 'disable' ),
  $disableboot                = params_lookup( 'disableboot' ),
  $monitor                    = params_lookup( 'monitor' , 'global' ),
  $monitor_tool               = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target             = params_lookup( 'monitor_target' , 'global' ),
  $puppi                      = params_lookup( 'puppi' , 'global' ),
  $puppi_helper               = params_lookup( 'puppi_helper' , 'global' ),
  $firewall                   = params_lookup( 'firewall' , 'global' ),
  $firewall_tool              = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src               = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst               = params_lookup( 'firewall_dst' , 'global' ),
  $debug                      = params_lookup( 'debug' , 'global' ),
  $audit_only                 = params_lookup( 'audit_only' , 'global' ),
  $package                    = params_lookup( 'package' ),
  $service                    = params_lookup( 'service' ),
  $service_workers            = params_lookup( 'service_workers' ),
  $service_status             = params_lookup( 'service_status' ),
  $process                    = params_lookup( 'process' ),
  $process_args               = params_lookup( 'process_args' ),
  $process_user               = params_lookup( 'process_user' ),
  $config_dir                 = params_lookup( 'config_dir' ),
  $config_file                = params_lookup( 'config_file' ),
  $config_file_mode           = params_lookup( 'config_file_mode' ),
  $config_file_owner          = params_lookup( 'config_file_owner' ),
  $config_file_group          = params_lookup( 'config_file_group' ),
  $config_file_init           = params_lookup( 'config_file_init' ),
  $pid_file                   = params_lookup( 'pid_file' ),
  $data_dir                   = params_lookup( 'data_dir' ),
  $log_dir                    = params_lookup( 'log_dir' ),
  $log_file                   = params_lookup( 'log_file' ),
  $port                       = params_lookup( 'port' ),
  $protocol                   = params_lookup( 'protocol' )
  ) inherits puppetdashboard::params {

  $bool_setup_mysql=any2bool($setup_mysql)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $puppetdashboard::bool_absent ? {
    true  => 'absent',
    false => $puppetdashboard::version,
  }

  $manage_service_enable = $puppetdashboard::bool_disableboot ? {
    true    => false,
    default => $puppetdashboard::bool_disable ? {
      true    => false,
      default => $puppetdashboard::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $puppetdashboard::bool_disable ? {
    true    => 'stopped',
    default =>  $puppetdashboard::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $puppetdashboard::bool_service_autorestart ? {
    true    => Service[puppetdashboard],
    false   => undef,
  }

  $manage_file = $puppetdashboard::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $puppetdashboard::bool_absent == true
  or $puppetdashboard::bool_disable == true
  or $puppetdashboard::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $puppetdashboard::bool_absent == true
  or $puppetdashboard::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $puppetdashboard::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $puppetdashboard::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $puppetdashboard::source ? {
    ''        => undef,
    default   => $puppetdashboard::source,
  }

  $manage_file_content = $puppetdashboard::template ? {
    ''        => undef,
    default   => template($puppetdashboard::template),
  }

  ### MySQL grants
  if $bool_setup_mysql {
    class {
      'puppetdashboard::mysql':
        before => [Service['puppetdashboard'], Service['puppetdashboard-workers']];
    }
  }

  ### Managed resources
  package { 'puppetdashboard':
    ensure => $puppetdashboard::manage_package,
    name   => $puppetdashboard::package,
  }

  service { 'puppetdashboard':
    ensure    => $puppetdashboard::manage_service_ensure,
    name      => $puppetdashboard::service,
    enable    => $puppetdashboard::manage_service_enable,
    hasstatus => $puppetdashboard::service_status,
    pattern   => $puppetdashboard::process,
    require   => Package['puppetdashboard'],
  }

  service { 'puppetdashboard-workers':
    ensure    => $puppetdashboard::manage_service_ensure,
    name      => $puppetdashboard::service_workers,
    enable    => $puppetdashboard::manage_service_enable,
    hasstatus => $puppetdashboard::service_status,
    pattern   => $puppetdashboard::process,
    require   => Package['puppetdashboard'],
  }

  file { 'puppetdashboard.conf':
    ensure  => $puppetdashboard::manage_file,
    path    => $puppetdashboard::config_file,
    mode    => $puppetdashboard::config_file_mode,
    owner   => $puppetdashboard::config_file_owner,
    group   => $puppetdashboard::config_file_group,
    require => Package['puppetdashboard'],
    notify  => $puppetdashboard::manage_service_autorestart,
    source  => $puppetdashboard::manage_file_source,
    content => $puppetdashboard::manage_file_content,
    replace => $puppetdashboard::manage_file_replace,
    audit   => $puppetdashboard::manage_audit,
  }

  file { 'puppetdashboard.conf_db':
    ensure  => $puppetdashboard::manage_file,
    path    => $puppetdashboard::config_file_db,
    mode    => $puppetdashboard::config_file_mode,
    owner   => $puppetdashboard::config_file_owner,
    group   => $puppetdashboard::config_file_group,
    require => Package['puppetdashboard'],
    notify  => $puppetdashboard::manage_service_autorestart,
    content => template( $puppetdashboard::template_db ),
    replace => $puppetdashboard::manage_file_replace,
    audit   => $puppetdashboard::manage_audit,
  }

  # Enable service start on Debian and Ubuntu
  if $::operatingsystem == 'Ubuntu'
  or $::operatingsystem == 'Debian' {
    file { 'default-puppetdashboard':
      ensure  => $puppetdashboard::manage_file,
      path    => $puppetdashboard::config_file_init,
      require => Package[puppetdashboard],
      content => template('puppetdashboard/default.init-ubuntu'),
      mode    => $puppetdashboard::config_file_mode,
      owner   => $puppetdashboard::config_file_owner,
      group   => $puppetdashboard::config_file_group,
      notify  => $puppetdashboard::manage_service_autorestart,
    }
    file { 'default-puppetdashboard-workers':
      ensure  => $puppetdashboard::manage_file,
      path    => "${puppetdashboard::config_file_init}-workers",
      require => Package[puppetdashboard],
      content => template('puppetdashboard/default-workers.init-ubuntu'),
      mode    => $puppetdashboard::config_file_mode,
      owner   => $puppetdashboard::config_file_owner,
      group   => $puppetdashboard::config_file_group,
      notify  => $puppetdashboard::manage_service_autorestart,
    }
  }

  # The whole puppetdashboard configuration directory can be recursively overriden
  if $puppetdashboard::source_dir and $puppetdashboard::source_dir != '' {
    file { 'puppetdashboard.dir':
      ensure  => directory,
      path    => $puppetdashboard::config_dir,
      require => Package['puppetdashboard'],
      notify  => $puppetdashboard::manage_service_autorestart,
      source  => $puppetdashboard::source_dir,
      recurse => true,
      purge   => $puppetdashboard::source_dir_purge,
      replace => $puppetdashboard::manage_file_replace,
      audit   => $puppetdashboard::manage_audit,
    }
  }

  ### Database Optimization
  ### TODO: Enable custom cron values
  if $puppetdashboard::optimize_cron == true {
    cron { 'optimize-db':
      ensure  => 'present',
      command => "cd ${data_dir} && /usr/bin/rake RAILS_ENV=production db:raw:optimize",
      user    => 'root',
      hour    => 2,
      minute  => 30,
      monthda => 1,
    }
  }

  ### Clean up old reports
  ### Cleans up reports older then 3 months
  ### TODO: Enable custom prune values
  if $puppetdashboard::clean_old_reports == true {
    cron { 'clean-reports':
      ensure   => 'present',
      command  => "cd ${data_dir} && /usr/bin/rake RAILS_ENV=production reports:prune upto=3 unit=mon",
      user     => 'root',
      hour     => 3,
      minute   => 30,
      monthday => 1,
    }
  }

  ### Include custom class if $my_class is set
  if $puppetdashboard::my_class {
    include $puppetdashboard::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $puppetdashboard::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'puppetdashboard':
      ensure    => $puppetdashboard::manage_file,
      variables => $classvars,
      helper    => $puppetdashboard::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $puppetdashboard::bool_monitor == true {
    monitor::port { "puppetdashboard_${puppetdashboard::protocol}_${puppetdashboard::port}":
      protocol => $puppetdashboard::protocol,
      port     => $puppetdashboard::port,
      target   => $puppetdashboard::monitor_target,
      tool     => $puppetdashboard::monitor_tool,
      enable   => $puppetdashboard::manage_monitor,
    }
    monitor::process { 'puppetdashboard_process':
      process  => $puppetdashboard::process,
      service  => $puppetdashboard::service,
      pidfile  => $puppetdashboard::pid_file,
      user     => $puppetdashboard::process_user,
      argument => $puppetdashboard::process_args,
      tool     => $puppetdashboard::monitor_tool,
      enable   => $puppetdashboard::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $puppetdashboard::bool_firewall == true {
    firewall { "puppetdashboard_${puppetdashboard::protocol}_${puppetdashboard::port}":
      source      => $puppetdashboard::firewall_src,
      destination => $puppetdashboard::firewall_dst,
      protocol    => $puppetdashboard::protocol,
      port        => $puppetdashboard::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $puppetdashboard::firewall_tool,
      enable      => $puppetdashboard::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $puppetdashboard::bool_debug == true {
    file { 'debug_puppetdashboard':
      ensure  => $puppetdashboard::manage_file,
      path    => "${settings::vardir}/debug-puppetdashboard",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
