
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radacct`
  ADD  INDEX `acctstoptime`
    (acctstoptime)
;
