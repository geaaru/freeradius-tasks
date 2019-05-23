
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radacct`
  ADD  INDEX `delegatedipv6prefix`
    (delegatedipv6prefix)
;
