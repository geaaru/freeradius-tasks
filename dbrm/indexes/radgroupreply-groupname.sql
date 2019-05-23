
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radgroupreply`
  ADD  INDEX `groupname`
    (groupname)
;
