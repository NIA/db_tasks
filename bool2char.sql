CREATE OR REPLACE FUNCTION bool2char( inbl IN NUMBER )
RETURN VARCHAR2
IS
    retval VARCHAR2(5);
BEGIN
    IF (inbl IS null) THEN
        retval := NULL;
    ELSIF (inbl = 0) THEN
        retval := 'FALSE';
    ELSE
        retval := 'TRUE';
    END IF;
    RETURN(retval);
END bool2char;
