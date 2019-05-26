
-- $Id$ --
USE `DB_NAME`;
ALTER TABLE `radacct`
  ADD UNIQUE INDEX `acctsessionid_nasidentifier_username-UNIQUE`
    (acctsessionid,nasidentifier,username)
    ;
