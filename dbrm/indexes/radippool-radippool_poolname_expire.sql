
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radippool`
  ADD  INDEX `radippool_poolname_expire`
    (pool_name,expiry_time)
;
