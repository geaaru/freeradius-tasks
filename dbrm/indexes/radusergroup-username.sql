
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radusergroup`
  ADD  INDEX `username`
    (username)
;
