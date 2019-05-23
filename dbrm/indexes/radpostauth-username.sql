
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radpostauth`
  ADD  INDEX `username`
    (username)
;
