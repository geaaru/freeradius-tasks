
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radippool`
  ADD  INDEX `callingstationid`
    (callingstationid)
;
