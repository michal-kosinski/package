\i /usr/share/postgresql/contrib/pgcrypto.sql

CREATE FUNCTION encrypt(text) RETURNS text
    AS '
select crypt ($1,gen_salt(''bf''));
'
    LANGUAGE sql;
