			---------------------------------------------------
			-- INDIA GENERAL ELECTIONS RESULT ANALYSIS 2024--
			---------------------------------------------------
/*
  Total_Seats: 543
*/

SELECT 
    COUNT(DISTINCT Parliament_Constituency) AS Total_Seats
FROM 
    constituencywise_results;


/*
  What is the total number of seats available for elections in each state?

  State_Name                    Total_Seats_Available
  ---------------------------------------------------
  Andaman & Nicobar Islands      1
  Andhra Pradesh                 25
  Arunachal Pradesh              2
  Assam                          14
  Bihar                          40
  Chandigarh                     1
  Chhattisgarh                   11
  Dadra & Nagar Haveli and Daman & Diu 2
  Delhi                          7
  Goa                            2
  Gujarat                        26
  Haryana                        10
  Himachal Pradesh               4
  Jammu and Kashmir              5
  Jharkhand                      14
  Karnataka                      28
  Kerala                         20
  Ladakh                         1
  Lakshadweep                    1
  Madhya Pradesh                 29
  Maharashtra                    48
  Manipur                        2
  Meghalaya                      2
  Mizoram                        1
  Nagaland                       1
  Odisha                         21
  Puducherry                     1
  Punjab                         13
  Rajasthan                      25
  Sikkim                         1
  Tamil Nadu                     39
  Telangana                      17
  Tripura                        2
  Uttar Pradesh                  80
  Uttarakhand                    5
  West Bengal                    42
*/

SELECT 
    s.State AS State_Name,
    COUNT(cr.Constituency_ID) AS Total_Seats_Available
FROM 
    constituencywise_results cr
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
GROUP BY 
    s.State
ORDER BY 
    s.State;


/*
  Total Seats Won by NDA Alliance.

  NDA_Total_Seats_Won: 292
*/

-- Using Party Names
SELECT
    SUM(CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
                'Janata Dal (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
                'Janata Dal (Secular) - JD(S)',
                'Lok Janshakti Party (Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;

-- OR

-- Using Party IDs
SELECT
    SUM(CASE 
            WHEN Party_ID IN (
                83,   -- Bharatiya Janata Party (BJP)
                160,  -- Telugu Desam (TDP)
                369,  -- Janata Dal (United) - JD(U)
                664,  -- Shiv Sena (SHS)
                804,  -- AJSU Party (AJSUP)
                805,  -- Apna Dal (Soneylal) - ADAL
                860,  -- Asom Gana Parishad (AGP)
                1142, -- Hindustani Awam Morcha (Secular) - HAMS
                1458, -- Janasena Party (JnP)
                1658, -- Janata Dal (Secular) - JD(S)
                1745, -- Lok Janshakti Party (Ram Vilas) - LJPRV
                2070, -- Nationalist Congress Party (NCP)
                3165, -- Rashtriya Lok Dal (RLD)
                3529  -- Sikkim Krantikari Morcha (SKM)
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;

/*
  Seats Won by NDA Alliance Parties

  Party                                 Won
  ------------------------------------  ---
  Bharatiya Janata Party - BJP           240
  Telugu Desam - TDP                     16
  Janata Dal (United) - JD(U)            12
  Shiv Sena - SHS                        7
  Lok Janshakti Party (Ram Vilas) - LJPRV 5
  Janata Dal (Secular) - JD(S)           2
  Janasena Party - JnP                   2
  Rashtriya Lok Dal - RLD                2
  Sikkim Krantikari Morcha - SKM         1
  Nationalist Congress Party - NCP       1
  Hindustani Awam Morcha (Secular) - HAMS 1
  Asom Gana Parishad - AGP               1
  AJSU Party - AJSUP                     1
  Apna Dal (Soneylal) - ADAL             1
*/

-- Using Party Names
SELECT 
    Party, 
    Won 
FROM 
    [dbo].partywise_results
WHERE 
    Party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
        'Janata Dal (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
        'Janata Dal (Secular) - JD(S)',
        'Lok Janshakti Party (Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
ORDER BY 
    Won DESC;

-- OR

-- Using Party IDs
SELECT 
    Party, 
    Won 
FROM 
    [dbo].partywise_results
WHERE 
    Party_ID IN (
        83,   -- Bharatiya Janata Party (BJP)
        160,  -- Telugu Desam (TDP)
        369,  -- Janata Dal (United) - JD(U)
        664,  -- Shiv Sena (SHS)
        804,  -- AJSU Party (AJSUP)
        805,  -- Apna Dal (Soneylal) - ADAL
        860,  -- Asom Gana Parishad (AGP)
        1142, -- Hindustani Awam Morcha (Secular) - HAMS
        1458, -- Janasena Party (JnP)
        1658, -- Janata Dal (Secular) - JD(S)
        1745, -- Lok Janshakti Party (Ram Vilas) - LJPRV
        2070, -- Nationalist Congress Party (NCP)
        3165, -- Rashtriya Lok Dal (RLD)
        3529  -- Sikkim Krantikari Morcha (SKM)
    )
ORDER BY 
    Won DESC;

/*
  Total Seats Won by I.N.D.I.A. Alliance

  INDIA_Total_Seats_Won: 234
*/

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India (Marxist) - CPI(M)',
                'Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results;


/*
  Seats Won by The Indian National Developmental Inclusive Alliance (I.N.D.I.A.) Parties.

  Party_Name                      Seats_Won
  Indian National Congress - INC       99
  Samajwadi Party - SP                 37
  All India Trinamool Congress - AITC  29
  Dravida Munnetra Kazhagam - DMK      22
  Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT  9
  Nationalist Congress Party Sharadchandra Pawar - NCPSP  8
  Rashtriya Janata Dal - RJD           4
  Communist Party of India (Marxist) - CPI(M)     4
  Aam Aadmi Party - AAAP               3
  Indian Union Muslim League - IUML    3
  Jharkhand Mukti Morcha - JMM         3
  Jammu & Kashmir National Conference - JKN 2
  Communist Party of India - CPI       2
  Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L) 2
  Viduthalai Chiruthaigal Katchi - VCK 2
  Rashtriya Loktantrik Party - RLTP    1
  Revolutionary Socialist Party - RSP  1
  Bharat Adivasi Party - BHRTADVSIP    1
  Kerala Congress - KEC                1
  Marumalarchi Dravida Munnetra Kazhagam - MDMK  1
*/

SELECT 
    party AS Party_Name,
    won AS Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Indian National Congress - INC',
        'Aam Aadmi Party - AAAP',
        'All India Trinamool Congress - AITC',
        'Bharat Adivasi Party - BHRTADVSIP',
        'Communist Party of India (Marxist) - CPI(M)',
        'Communist Party of India (Marxist-Leninist) (Liberation) - CPI(ML)(L)',
        'Communist Party of India - CPI',
        'Dravida Munnetra Kazhagam - DMK',
        'Indian Union Muslim League - IUML',
        'Jammu & Kashmir National Conference - JKN',
        'Jharkhand Mukti Morcha - JMM',
        'Kerala Congress - KEC',
        'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
        'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
        'Rashtriya Janata Dal - RJD',
        'Rashtriya Loktantrik Party - RLTP',
        'Revolutionary Socialist Party - RSP',
        'Samajwadi Party - SP',
        'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
        'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY 
    Seats_Won DESC;

/*
Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

*/
-- DROP  IF NEEDED
ALTER TABLE partywise_results
DROP COLUMN party_alliance;

-- Add new column field in table partywise_results to get the Party Alliance as NDA, I.N.D.I.A, and OTHER
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

-- I.N.D.I.A Allianz
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

-- NDA Allianz
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

-- OTHER
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;



/*
Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

party_alliance   Seats_Won
NDA              292
I.N.D.I.A       234
OTHER            17
*/

SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;

-- OR

SELECT PARTY_ALLIANCE, SUM(WON) AS Seats_Won 
FROM partywise_results
WHERE party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY PARTY_ALLIANCE;

/*
  Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency

  Winning_Candidate   Party                            party_alliance  Total_Votes   Margin   Constituency_Name   State
  ---------------------------------------------------------------------------------------------------------------
  KISHORI LAL         Indian National Congress - INC   I.N.D.I.A        539228        167196   AMETHI             Uttar Pradesh
*/

SELECT cr.Winning_Candidate, 
       p.Party, 
       p.party_alliance, 
       cr.Total_Votes, 
       cr.Margin, 
       cr.Constituency_Name, 
       s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' 
  AND cr.Constituency_Name = 'AMETHI';

/*
  Distribution of EVM votes versus postal votes for candidates in a specific constituency

Your SQL query correctly retrieves the candidates' details for the Mathura constituency, including their party affiliation, EVM votes, postal votes, total votes, and the constituency name. It also orders the results by total votes in descending order. 

Here’s a breakdown of the query:

```sql
SELECT 
    cd.Candidate,               -- Selecting candidate names
    cd.Party,                   -- Selecting party names
    cd.EVM_Votes,               -- Selecting EVM votes
    cd.Postal_Votes,            -- Selecting postal votes
    cd.Total_Votes,             -- Selecting total votes
    cr.Constituency_Name        -- Selecting constituency name
FROM 
    constituencywise_details cd  -- From constituencywise_details table
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID  -- Joining with constituencywise_results based on Constituency_ID
WHERE 
    cr.Constituency_Name = 'MATHURA'  -- Filtering results for the Mathura constituency
ORDER BY 
    cd.Total_Votes DESC;         -- Ordering results by total votes in descending order
```

### Output
Based on your provided data, the expected output will show the candidates in Mathura sorted by total votes. Here’s what the result would look like:

| Candidate                                      | Party                              | EVM Votes | Postal Votes | Total Votes | Constituency Name |
|------------------------------------------------|-------------------------------------|-----------|--------------|-------------|--------------------|
| HEMAMALINI DHARMENDRA DEOL                     | Bharatiya Janata Party             | 507,535   | 2,529        | 510,064     | MATHURA            |
| MUKESH DHANGAR                                  | Indian National Congress            | 216,043   | 614          | 216,657     | MATHURA            |
| SURESH SINGH                                   | Bahujan Samaj Party                | 188,152   | 265          | 188,417     | MATHURA            |
| BHANU PRATAP SINGH                             | Independent                         | 15,640    | 25           | 15,665      | MATHURA            |
| NOTA                                           | None of the Above                  | 4,527     | 36           | 4,563       | MATHURA            |
| RAKESH KUMAR                                   | Independent                         | 4,492     | 2            | 4,494       | MATHURA            |
| JAGDISH PRASAD KAUSHIK ADVOCATE               | Rashtriya Samta Vikas Party        | 3,567     | 8            | 3,575       | MATHURA            |
| RAVI VERMA                                     | Independent                         | 2,724     | 0            | 2,724       | MATHURA            |
| SHIKHA SHARMA                                   | Independent                         | 2,246     | 5            | 2,251       | MATHURA            |
| KAMAL KANT SHARMA                              | Independent                         | 1,491     | 12           | 1,503       | MATHURA            |
| YOGESH KUMAR TALAN                             | Independent                         | 1,491     | 2            | 1,493       | MATHURA            |
| MONI FALHARI BAPU                             | Independent                         | 1,322     | 4            | 1,326       | MATHURA            |
| KSHETRA PAL SINGH                              | Independent                         | 1,206     | 5            | 1,211       | MATHURA            |
| DR. RASHMI YADAV                               | Independent                         | 1,183     | 6            | 1,189       | MATHURA            |
| PRAVESHANAND PURI                              | Independent                         | 1,081     | 4            | 1,085       | MATHURA            |
| SURESH CHANDRA VAGHEL                          | Rashtriya Shoshit Samaj Party      | 822       | 7            | 829         | MATHURA            |

If you have further queries or need additional data manipulation, let me know!
*/

SELECT 
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cr.Constituency_Name = 'MATHURA'
ORDER BY 
    cd.Total_Votes DESC;

/*

Which parties won the most seats in s State, and how many seats did each party win?

| Party                                              | Seats_Won |
|----------------------------------------------------|-----------|
| Telugu Desam - TDP                                 | 16        |
| Yuvajana Sramika Rythu Congress Party - YSRCP		 | 4         |
| Bharatiya Janata Party - BJP                       | 3         |
| Janasena Party - JnP                               | 2         |

*/

SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    s.state = 'Andhra Pradesh'
GROUP BY 
    p.Party
ORDER BY 
    Seats_Won DESC;

/*
What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

State_Name                          NDA_Seats_Won  INDIA_Seats_Won  OTHER_Seats_Won
-----------------------------------------------------------------------------------
Andaman & Nicobar Islands                  1               0                 0
Andhra Pradesh                             21               0                 4
Arunachal Pradesh                           2               0                 0
Assam                                      10               3                 1
Bihar                                      30               9                 1
Chandigarh                                  0               1                 0
Chhattisgarh                               10               1                 0
Dadra & Nagar Haveli and Daman & Diu       1               0                 1
Delhi                                       7               0                 0
Goa                                         1               1                 0
Gujarat                                    25               1                 0
Haryana                                     5               5                 0
Himachal Pradesh                             4               0                 0
Jammu and Kashmir                            2               2                 1
Jharkhand                                  9               5                 0
Karnataka                                  19               9                 0
Kerala                                      1              19                 0
Ladakh                                       0               0                 1
Lakshadweep                                  0               1                 0
Madhya Pradesh                             29               0                 0
Maharashtra                                17              30                 1
Manipur                                      0               2                 0
Meghalaya                                   0               1                 1
Mizoram                                     0               0                 1
Nagaland                                    0               1                 0
Odisha                                     20               1                 0
Puducherry                                   0               1                 0
Punjab                                       0              10                 3
Rajasthan                                  14              11                 0
Sikkim                                       1               0                 0
Tamil Nadu                                   0              39                 0
Telangana                                   8               8                 1
Tripura                                     2               0                 0
Uttar Pradesh                              36              43                 1
Uttarakhand                                 5               0                 0
West Bengal                                 12              30                 0

*/
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
    s.State
ORDER BY 
    s.State;

/*
Which candidate received the highest number of EVM votes in each constituency (Top 10)?

Constituency_Name     Constituency_ID  Candidate                 EVM_Votes
-------------------------------------------------------------------------------
DHUBRI                S032             RAKIBUL HUSSAIN          1468549
INDORE                S1226            SHANKAR LALWANI          1223746
VIDISHA               S1218            SHIVRAJ SINGH CHOUHAN    1111556
BANGALORERURAL       S1023            DR C N MANJUNATH         1075553
RAIPUR                S268             BRIJMOHAN AGRAWAL        1047447
DIAMONDHARBOUR       S2521            ABHISHEK BANERJEE       1043493
NAVSARI               S0625            C R PATIL                1023366
GANDHINAGAR          S066             AMIT SHAH                999984
BANGALORENORTH       S1024            SHOBHA KARANDLAJE        982805
MALKAJGIRI           S297             EATALA RAJENDER          980712

*/

SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;


/*
Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

Constituency_Name            Winning_Candidate                         Runnerup_Candidate
---------------------------------------------------------------------------------------------
AHMEDNAGAR                  NILESH DNYANDEV LANKE                    DR. SUJAY RADHAKRISHNA VIKHEPATIL
AKOLA                       ANUP SANJAY DHOTRE                        ABHAY KASHINATH PATIL
AMRAVATI                    BALWANT BASWANT WANKHADE                 NAVNEET RAVI RANA
AURANGABAD                  BHUMARE SANDIPANRAO ASARAM               IMTIAZ JALEEL SYED
BARAMATI                    SUPRIYA SULE                               SUNETRA AJITDADA PAWAR
BEED                        BAJRANG MANOHAR SONWANE                   PANKAJA GOPINATHRAO MUNDE
BHANDARAGONDIYA            DR. PRASHANT YADAORAO PADOLE             SUNIL BABURAO MENDHE
BHIWANDI                   BALYA MAMA - SURESH GOPINATH MHATRE       KAPIL MORESHWAR PATIL
BULDHANA                   JADHAV PRATAPRAO GANPATRAO               NARENDRA DAGDU KHEDEKAR
CHANDRAPUR                 DHANORKAR PRATIBHA SURESH ALIAS BALUBHAU  MUNGANTIWAR SUDHIR SACCHIDANAND
DHULE                      BACHHAV SHOBHA DINESH                     BHAMRE SUBHASH RAMRAO
DINDORI                    BHASKAR MURLIDHAR BHAGARE                 DR. BHARATI PRAVIN PAWAR
GADCHIROLI-CHIMUR         DR. KIRSAN  NAMDEO                        ASHOK  MAHADEORAO NETE
HATKANANGALE               DHAIRYASHEEL SAMBHAJIRAO MANE            SATYAJEET BABASAHEB PATIL (AABA) SARUDKAR
HINGOLI                    AASHTIKAR PATIL NAGESH BAPURAO           BABURAO KADAM KOHALIKAR
JALGAON                    SMITA UDAY WAGH                           KARAN BALASAHEB PATIL - PAWAR
JALNA                      KALYAN VAIJINATHRAO KALE                 DANVE RAOSAHEB DADARAO
KALYAN                     DR SHRIKANT EKNATH SHINDE                VAISHALI DAREKAR - RANE
KOLHAPUR                   CHHATRAPATI SHAHU SHAHAJI                 SANJAY SADASHIVRAO MANDLIK
LATUR                      DR. KALGE SHIVAJI BANDAPPA                SUDHAKAR TUKARAM SHRANGARE
MADHA                      MOHITE-PATIL DHAIRYASHEEL RAJSINH        RANJEETSINGH HINDURAO NAIK NIMBALKAR
MAVAL                      SHRIRANG APPA CHANDU BARNE               SANJOG BHIKU WAGHERE PATIL
MUMBAINORTH                PIYUSH GOYAL                              BHUSHAN PATIL
MUMBAINORTHCENTRAL        GAIKWAD VARSHA EKNATH                     ADV UJWAL NIKAM
MUMBAINORTHEAST           SANJAY DINA PATIL                         MIHIR CHANDRAKANT KOTECHA
MUMBAINORTHWEST           RAVINDRA DATTARAM WAIKAR                 AMOL GAJANAN KIRTIKAR
MUMBAISOUTH                ARVIND GANPAT SAWANT                      YAMINI YASHWANT JADHAV
MUMBAISOUTHCENTRAL        ANIL YESHWANT DESAI                       RAHUL RAMESH SHEWALE
NAGPUR                     NITIN JAIRAM GADKARI                      VIKAS THAKRE
NANDED                     CHAVAN VASANTRAO BALWANTRAO              CHIKHALIKAR PRATAPRAO GOVINDRAO
NANDURBAR                  ADV GOWAAL KAGADA PADAVI                 DR HEENA VIJAYKUMAR GAVIT
NASHIK                     RAJABHAU (PARAG) PRAKASH WAJE            GODSE HEMANT TUKARAM
OSMANABAD                  OMPRAKASH BHUPALSINH ALIAS PAVAN RAJENIMBALKAR ARCHANA RANAJAGJITSINH PATIL
PALGHAR                    DR. HEMANT VISHNU SAVARA                 BHARTI BHARAT KAMDI
PARBHANI                   JADHAV SANJAY ( BANDU ) HARIBHAU         JANKAR MAHADEV JAGANNATH
PUNE                       MURLIDHAR MOHOL                           DHANGEKAR RAVINDRA HEMRAJ
RAIGAD                     TATKARE SUNIL DATTATREY                  ANANT GEETE
RAMTEK                     Shyamkumar (Babalu) Daulat Barve        RAJU DEONATH PARVE
RATNAGIRI-SINDHUDURG      NARAYAN TATU RANE                         VINAYAK BHAURAO RAUT
RAVER                      KHADSE RAKSHA NIKHIL                      SHRIRAM DAYARAM PATIL
SANGLI                     VISHAL (DADA) PRAKASHBAPU PATIL         SANJAY (KAKA) PATIL
SATARA                     SHRIMANT CHH UDAYANRAJE PRATAPSINHAMAHARAJ BHONSLE  SHASHIKANT JAYVANTRAO SHINDE
SHIRDI                     BHAUSAHEB RAJARAM WAKCHAURE             LOKHANDE SADASHIV KISAN
SHIRUR                     DR. AMOL RAMSING KOLHE                    ADHALRAO SHIVAJI DATTATREY
SOLAPUR                    PRANITI SUSHILKUMAR SHINDE                RAM VITTHAL SATPUTE
THANE                      NARESH GANPAT MHASKE                      RAJAN BABURAO VICHARE
WARDHA                     AMAR SHARADRAO KALE                       RAMDAS CHANDRABHAN TADAS
YAVATMAL-WASHIM           SANJAY UTTAMRAO DESHMUKH                  RAJSHRITAI HEMANT PATIL (MAHALLE)

*/
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;
/*
Your explanation of the SQL query is clear and thorough. Here’s a breakdown of the key points you highlighted:

### 1. Common Table Expression (CTE) - RankedCandidates
- **Purpose**: The CTE `RankedCandidates` is designed to rank candidates based on their total votes in each constituency.
- **Data Selection**: 
  - It retrieves essential data, including constituency ID, candidate names, party affiliations, and vote counts (EVM and postal).
  - **Total Votes Calculation**: It sums EVM and postal votes to get the total votes for each candidate.
- **Ranking Mechanism**:
  - The `ROW_NUMBER()` function assigns ranks to candidates within each constituency based on their total votes.
  - The ranking is done separately for each constituency (`PARTITION BY`) and in descending order (`ORDER BY`), so the candidate with the highest total votes gets rank 1.
- **Joins**: 
  - The CTE combines data from multiple tables to get a complete view of candidates and their respective constituencies.
  - The filter restricts the data to candidates from Maharashtra.

### 2. Main Query
- **Data Retrieval**: The main query pulls from the `RankedCandidates` CTE to identify the winning and runner-up candidates for each constituency.
- **Winning Candidate Selection**:
  - The use of `CASE` in combination with `MAX` helps extract the candidate with the highest rank (1) for each constituency.
- **Runner-Up Candidate Selection**:
  - Similarly, it retrieves the candidate with the second highest rank (2) using a `CASE` statement.
- **Join with Constituency Names**: The main query joins with the `constituencywise_results` table to get the corresponding constituency names.
- **Grouping and Ordering**:
  - The results are grouped by constituency name to ensure accurate mapping of winners and runners-up.
  - The final result is ordered alphabetically by constituency name for clarity.

### Overall Analysis
This approach effectively combines ranking and filtering to present a clear picture of election results in Maharashtra, allowing for easy identification of the winners and runners-up in each constituency. Your breakdown captures the logic and flow of the query well! If you have any specific areas you’d like to delve deeper into or if there’s anything else you’d like to add, let me know!
*/


/*
For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?

The expected output of the query for the state of Maharashtra should look like this:

| **Total_Seats** | **Total_Candidates** | **Total_Parties** | **Total_Votes** | **Total_EVM_Votes** | **Total_Postal_Votes** |
|-----------------|----------------------|-------------------|-----------------|---------------------|------------------------|
| 48              | 1114                 | 7                 | 57179133        | 56969710            | 209423                 |

This represents:
- **Total_Seats**: The total number of seats in Maharashtra (48).
- **Total_Candidates**: The total number of candidates contesting in Maharashtra (1114).
- **Total_Parties**: The total number of political parties in Maharashtra (7).
- **Total_Votes**: The sum of all votes, including both EVM and postal votes.
- **Total_EVM_Votes**: The total votes cast via EVM (56969710).
- **Total_Postal_Votes**: The total postal votes (209423).
*/

SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Maharashtra';


			---------------------------------------------------
						-- Project Completed--
			---------------------------------------------------

