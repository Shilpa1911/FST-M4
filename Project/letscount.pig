
inputFile1 = LOAD 'hdfs:///user/skarana/M4_BigDataProject' USING PigStorage('\t') AS (name:chararray, speech:chararray);


grpd = GROUP inputFile1 BY name;

cntd = FOREACH grpd GENERATE group, COUNT(inputFile1.name) AS cnt;


orderDesc = ORDER cntd BY cnt DESC;


STORE orderDesc INTO 'hdfs:///user/skarana/M4_BigDataProject/Resultset';