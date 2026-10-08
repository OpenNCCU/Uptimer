-- Slow checks to 5 minutes. The per-minute cron was re-reading check_results
-- on every tick and exhausting the D1 free rows_read quota.
UPDATE monitors
SET interval_sec = 300,
    updated_at = CAST(strftime('%s','now') AS INTEGER)
WHERE interval_sec < 300;
