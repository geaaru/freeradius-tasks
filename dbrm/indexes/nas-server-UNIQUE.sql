
-- $Id$ --
USE `DB_NAME`;
ALTER TABLE `nas`
  ADD UNIQUE INDEX `server-UNIQUE`
    (server)
    ;
