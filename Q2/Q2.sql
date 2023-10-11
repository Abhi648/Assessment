/*A. How many types of tigers can be found in the taxonomy table of the dataset?*/
SELECT COUNT(*) FROM Rfam.taxonomy WHERE species LIKE '%tigr%';

/*the "ncbi_id" of the Sumatran Tiger*/
SELECT ncbi_id FROM taxonomy WHERE species LIKE '%Panthera tigris sumatrae%';

/*B. columns that can be used to connect the tables in the given database*/
SELECT column_name, table_name FROM information_schema.columns
WHERE table_name IN ('taxonomy','rfamseq','family','clan_membership', 'clan', 'full_region')
ORDER BY table_name, column_name;

/*C. Query to find the type of rice with the longest DNA sequence*/
DESCRIBE taxonomy;
SELECT taxonomy.species AS rice_type, MAX(rfamseq.length) AS max_sequence_length
FROM rfamseq
JOIN taxonomy ON rfamseq.ncbi_id = taxonomy.ncbi_id
WHERE taxonomy.species = 'Poaceae'
GROUP BY taxonomy.species
ORDER BY max_sequence_length DESC
LIMIT 1;




SELECT rfamseq.accession, taxonomy.species, MAX(rfamseq.length) AS longest_sequence_length
FROM rfamseq
JOIN taxonomy ON rfamseq.ncbi_id = taxonomy.ncbi_id
WHERE rfamseq.length > 1000000
GROUP BY taxonomy.species
ORDER BY longest_sequence_length DESC
LIMIT 15 OFFSET 120;





