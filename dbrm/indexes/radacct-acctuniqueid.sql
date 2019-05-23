
-- $Id$
USE `DB_NAME`;
ALTER TABLE `radacct`
  ADD UNIQUE INDEX `acctuniqueid`
    (acctuniqueid)
;
