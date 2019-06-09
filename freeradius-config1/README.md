# Scenario Config1

In this scenario mission is to setup network authentication and accounting for:

  * terminals access: this is did through [pam_radius](https://github.com/FreeRADIUS/pam_radius/)
    module through NAS Ip and user credential.

  * devices access: this is did through EAP-TTLS + MD5 with user credential and
    MAC Address identification from file.

Every type of access is handled by a specific server.

**This scenario requires that certs directory MUST be created with all certificates
needed for configuring FreeReadius EAP module.**
