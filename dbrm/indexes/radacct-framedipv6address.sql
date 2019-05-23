
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radacct`
  ADD  INDEX `framedipv6address`
    (framedipv6address)
;
