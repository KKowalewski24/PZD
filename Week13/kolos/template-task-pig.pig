data = load '/user/cloudera/TODO'
    USING PigStorage('TODO')
    as (TODO);


--dump result;
--store result into './resout';
