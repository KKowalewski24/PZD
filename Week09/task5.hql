--
-- Tresc polecenia: Podaj zespoły w kolejności malejącej dla których rzucający
-- (pitch) zdobyli największą liczbę strikeout - SO (wyeliminowanie odbijającego).
--

-- Tworzenie bazy
CREATE DATABASE baseball;

CREATE TABLE baseball.pitching (
    playerid STRING,
    yearid   INT,
    stint    INT,
    teamid   STRING,
    lgid     STRING,
    w        INT,
    l        INT,
    g        INT,
    gs       INT,
    cg       INT,
    sho      INT,
    sv       INT,
    ipouts   INT,
    h        INT,
    er       INT,
    hr       INT,
    bb       INT,
    so       INT,
    baopp    INT,
    era      FLOAT,
    ibb      INT,
    wp       INT,
    hbp      INT,
    bk       INT,
    bfp      INT,
    gf       INT,
    r        INT,
    sh       INT,
    sf       INT,
    gidp     INT
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/Pitching.csv' OVERWRITE INTO TABLE baseball.pitching;

SELECT teamid, sum(so) AS pitchsum
FROM baseball.pitching
GROUP BY teamid
ORDER BY pitchsum DESC;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;

-- Wynik
--  	teamid	pitchsum
-- 1	CHN	104337
-- 2	PHI	97768
-- 3	NYA	93450
-- 4	CIN	93127
-- 5	BOS	93003
-- 6	CLE	92740
-- 7	SLN	92407
-- 8	PIT	92120
-- 9	DET	89629
-- 10	CHA	88044
-- 11	LAN	66974
-- 12	HOU	61687
-- 13	SFN	60761
-- 14	BAL	59728
-- 15	NYN	59621
-- 16	MIN	55379
-- 17	ATL	53877
-- 18	SDN	51203
-- 19	OAK	49104
-- 20	TEX	46426
-- 21	KCA	46411
-- 22	SEA	43483
-- 23	TOR	43089
-- 24	NY1	40822
-- 25	BRO	36712
-- 26	MON	33538
-- 27	BSN	33348
-- 28	WS1	32788
-- 29	PHA	29533
-- 30	COL	28091
-- 31	CAL	27773
-- 32	ARI	26712
-- 33	MIL	25932
-- 34	TBA	25731
-- 35	SLA	25623
-- 36	LAA	21645
-- 37	ML4	20915
-- 38	WAS	20592
-- 39	FLO	20423
-- 40	KC1	10029
-- 41	ML1	10027
-- 42	MIA	9840
-- 43	WS2	8832
-- 44	ANA	7954
-- 45	LS2	4823
-- 46	SL4	4802
-- 47	PH4	4572
-- 48	BL2	3772
-- 49	CL4	3606
-- 50	DTN	3357
-- 51	CN2	2944
-- 52	BR3	2734
-- 53	PRO	2711
-- 54	BLN	2610
-- 55	NY4	2389
-- 56	LS3	2238
-- 57	BFN	2072
-- 58	CL2	1932
-- 59	PT1	1831
-- 60	CL6	1736
-- 61	WS8	1690
-- 62	SLF	1359
-- 63	BLF	1302
-- 64	BUF	1256
-- 65	CHF	1226
-- 66	KCF	1126
-- 67	BRF	1103
-- 68	IN3	1041
-- 69	PTF	1027
-- 70	SE1	963
-- 71	SL5	838
-- 72	CL3	832
-- 73	KC2	828
-- 74	CN1	819
-- 75	TRN	770
-- 76	BSU	753
-- 77	CL5	748
-- 78	WOR	688
-- 79	WSU	684
-- 80	CHU	679
-- 81	IND	664
-- 82	BLU	628
-- 83	NEW	581
-- 84	SLU	550
-- 85	BL3	542
-- 86	TL2	533
-- 87	BLA	529
-- 88	BS2	524
-- 89	CNU	503
-- 90	TL1	501
-- 91	WS9	486
-- 92	IN2	479
-- 93	RC2	477
-- 94	CHP	460
-- 95	SR2	454
-- 96	NYP	449
-- 97	KCN	442
-- 98	BRP	377
-- 99	MLA	376
-- 100	PHP	361
-- 101	BSP	351
-- 102	BFP	351
-- 103	KCU	334
-- 104	PTP	332
-- 105	CN3	331
-- 106	NY2	326
-- 107	CLP	325
-- 108	PHU	310
-- 109	LS1	266
-- 110	BS1	248
-- 111	SL3	235
-- 112	WS7	235
-- 113	BR4	230
-- 114	HAR	213
-- 115	HR1	191
-- 116	PH1	183
-- 117	IN1	182
-- 118	RIC	167
-- 119	ML2	147
-- 120	MLU	139
-- 121	ML3	137
-- 122	BL1	134
-- 123	SR1	132
-- 124	PH2	132
-- 125	WIL	113
-- 126	ALT	93
-- 127	BR2	87
-- 128	CH2	81
-- 129	SL2	71
-- 130	NH1	54
-- 131	CL1	45
-- 132	SPU	44
-- 133	NY3	37
-- 134	TRO	31
-- 135	CH1	22
-- 136	PHN	22
-- 137	SL1	21
-- 138	KEO	20
-- 139	FW1	17
-- 140	RC1	16
-- 141	WS3	14
-- 142	BR1	13
-- 143	ELI	10
-- 144	WS5	10
-- 145	MID	10
-- 146	WS6	6
-- 147	PH3	6
-- 148	WS4	2
-- 149	BL4	0
