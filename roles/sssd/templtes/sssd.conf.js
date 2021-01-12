[sssd]
services = nss, pam, autofs
config_file_version = 2
domains = default

[nss]
homedir_substring = /home

[pam]
offline_credentials_expiration = 60

[domain/default]
ldap_id_use_start_tls = True
cache_credentials = True
ldap_search_base = {{hostvars[groups['openldap'][0]]['_ldap_domain']}}
id_provider = ldap
auth_provider = ldap
chpass_provider = ldap
access_provider = ldap
sudo_provider = ldap
ldap_uri = ldaps://{{hostvars[groups['openldap'][0]]['_openldap_fqdn']}}:636
ldap_default_bind_dn = cn=readonly,{{_openldap_domain}}
ldap_default_authtok = {{_password}}
ldap_tls_reqcert = demand
ldap_tls_cacert = /etc/ssl/certs/ca-bundle.trust.crt
ldap_tls_cacertdir = /etc/pki/tls
ldap_search_timeout = 50
ldap_network_timeout = 60
ldap_access_order = filter
ldap_access_filter = memberOf=cn=allowedusers,ou=groups,{{hostvars[groups['openldap'][0]]['_ldap_domain']}}

