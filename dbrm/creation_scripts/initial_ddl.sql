
-- $Id$ --

CREATE TABLE IF NOT EXISTS `nas` (
    id                  INT(10) NOT NULL AUTO_INCREMENT,
    nasname             VARCHAR(128) NOT NULL,
    shortname           VARCHAR(32),
    type                VARCHAR(30) DEFAULT 'other',
    ports               INT(5),
    secret              VARCHAR(60) NOT NULL DEFAULT 'secret',
    server              VARCHAR(64),
    community           VARCHAR(50),
    description         VARCHAR(200) DEFAULT 'RADIUS Client',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radacct` (
    radacctid            BIGINT(21) NOT NULL AUTO_INCREMENT,
    acctsessionid        VARCHAR(64) NOT NULL DEFAULT '',
    acctuniqueid         VARCHAR(32) NOT NULL DEFAULT '',
    username             VARCHAR(64) NOT NULL DEFAULT '',
    realm                VARCHAR(64) DEFAULT '',
    nasipaddress         VARCHAR(15) NOT NULL DEFAULT '',
    nasportid            VARCHAR(15),
    nasporttype          VARCHAR(32),
    acctstarttime        DATETIME,
    acctupdatetime       DATETIME,
    acctstoptime         DATETIME,
    acctinterval         INT(12),
    acctsessiontime      INT(12) UNSIGNED,
    acctauthentic        VARCHAR(32),
    connectinfo_start    VARCHAR(50),
    connectinfo_stop     VARCHAR(50),
    acctinputoctets      BIGINT(20),
    acctoutputoctets     BIGINT(20),
    calledstationid      VARCHAR(50) NOT NULL DEFAULT '',
    callingstationid     VARCHAR(50) NOT NULL DEFAULT '',
    acctterminatecause   VARCHAR(32) NOT NULL DEFAULT '',
    servicetype          VARCHAR(32),
    framedprotocol       VARCHAR(32),
    framedipaddress      VARCHAR(15) NOT NULL DEFAULT '',
    framedipv6address    VARCHAR(45) NOT NULL DEFAULT '',
    framedipv6prefix     VARCHAR(45) NOT NULL DEFAULT '',
    framedinterfaceid    VARCHAR(44) NOT NULL DEFAULT '',
    delegatedipv6prefix  VARCHAR(45) NOT NULL DEFAULT '',
    PRIMARY KEY(radacctid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radcheck` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    username            VARCHAR(64) NOT NULL DEFAULT '',
    attribute           VARCHAR(64) NOT NULL DEFAULT '',
    op                  CHAR(2) NOT NULL DEFAULT '==',
    value               VARCHAR(253) NOT NULL DEFAULT '',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radgroupcheck` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    groupname           VARCHAR(64) NOT NULL DEFAULT '',
    attribute           VARCHAR(64) NOT NULL DEFAULT '',
    op                  CHAR(2) NOT NULL DEFAULT '==',
    value               VARCHAR(253) NOT NULL DEFAULT '',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radgroupreply` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    groupname           VARCHAR(64) NOT NULL DEFAULT '',
    attribute           VARCHAR(64) NOT NULL DEFAULT '',
    op                  CHAR(2) NOT NULL DEFAULT '=',
    value               VARCHAR(253) NOT NULL DEFAULT '',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radippool` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    pool_name           VARCHAR(30) NOT NULL,
    framedipaddress     VARCHAR(15) NOT NULL DEFAULT '',
    nasipaddress        VARCHAR(15) NOT NULL DEFAULT '',
    calledstationid     VARCHAR(30) NOT NULL,
    callingstationid    VARCHAR(30) NOT NULL,
    expiry_time         DATETIME,
    username            VARCHAR(64) NOT NULL DEFAULT '',
    pool_key            VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radpostauth` (
    id                  INT(11) NOT NULL AUTO_INCREMENT,
    username            VARCHAR(64) NOT NULL DEFAULT '',
    pass                VARCHAR(64) NOT NULL DEFAULT '',
    reply               VARCHAR(32) NOT NULL DEFAULT '',
    authdate            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP DEFAULT_GENERATED ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radreply` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    username            VARCHAR(64) NOT NULL DEFAULT '',
    attribute           VARCHAR(64) NOT NULL DEFAULT '',
    op                  CHAR(2) NOT NULL DEFAULT '=',
    value               VARCHAR(253) NOT NULL DEFAULT '',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `radusergroup` (
    id                  INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    username            VARCHAR(64) NOT NULL DEFAULT '',
    groupname           VARCHAR(64) NOT NULL DEFAULT '',
    priority            INT(11) NOT NULL DEFAULT '1',
    PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

