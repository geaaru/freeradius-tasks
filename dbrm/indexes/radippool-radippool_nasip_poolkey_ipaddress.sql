
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radippool`
  ADD  INDEX `radippool_nasip_poolkey_ipaddress`
    (nasipaddress,pool_key,framedipaddress)
;
