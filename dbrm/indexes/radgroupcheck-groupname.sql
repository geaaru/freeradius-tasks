
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radgroupcheck`
  ADD  INDEX `groupname`
    (groupname)
;
