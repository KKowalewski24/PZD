--
-- Tresc polecenia: Dla każdego roku podaj gracza z najwyższą wartością zdobytych punktów (run - przejście przez bazę domową).
--

-- Tworzenie bazy
CREATE DATABASE baseball;

CREATE TABLE baseball.batting (
    yearid   INT,
    round    STRING,
    playerid STRING,
    teamid   STRING,
    lgid     STRING,
    g        INT,
    ab       INT,
    r        INT,
    h        INT,
    a2b      INT,
    a3b      INT,
    hr       INT,
    rbi      INT,
    sb       INT,
    cs       INT,
    bb       INT,
    so       INT,
    ibb      INT,
    hbp      INT,
    sh       INT,
    sf       INT,
    gid      INT
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/BattingPost.csv' OVERWRITE INTO TABLE baseball.batting;

-- Działa natomiast lepsza jest wersja poniżej
-- CREATE TABLE baseball.batting_summed STORED AS ORC
-- AS
-- SELECT playerid, yearid, SUM(r) AS summed_runs
-- FROM baseball.batting
-- GROUP BY playerid, yearid;
--
-- CREATE TABLE baseball.batting_year STORED AS ORC
-- AS
-- SELECT yearid, MAX(summed_runs) AS maximum
-- FROM baseball.batting_summed
-- GROUP BY yearid;
--
-- SELECT DISTINCT batting_year.yearid, batting_summed.playerid, batting_year.maximum
-- FROM baseball.batting_summed, baseball.batting_year
-- WHERE batting_summed.yearid = batting_year.yearid
--   AND batting_summed.summed_runs = batting_year.maximum;

SELECT b1.yearid AS year, b1.playerid AS player
FROM baseball.batting b1
         INNER JOIN (
                        SELECT yearid, MAX(r) AS max_runs
                        FROM baseball.batting
                        GROUP BY yearid
                    ) b2 ON b1.yearid = b2.yearid AND b1.r = b2.max_runs;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;

-- Wynik
--  	year	player
-- 1	1884	hinespa01
-- 2	1885	kellyki01
-- 3	1886	pfefffr01
-- 4	1886	welchcu01
-- 5	1887	lathaar01
-- 6	1887	richaha01
-- 7	1887	roweja01
-- 8	1888	lathaar01
-- 9	1888	mccarto01
-- 10	1889	collihu01
-- 11	1890	collihu01
-- 12	1892	longhe01
-- 13	1903	parenfr01
-- 14	1905	donlimi01
-- 15	1906	davisge01
-- 16	1906	hahned01
-- 17	1906	isbelfr01
-- 18	1906	jonesfi01
-- 19	1906	tinkejo01
-- 20	1907	tinkejo01
-- 21	1908	eversjo01
-- 22	1909	leachto01
-- 23	1910	bakerfr01
-- 24	1910	murphda02
-- 25	1911	bakerfr01
-- 26	1912	herzobu01
-- 27	1913	collied01
-- 28	1913	oldriru01
-- 29	1914	gowdyha01
-- 30	1915	hoopeha01
-- 31	1916	hoopeha01
-- 32	1917	collied01
-- 33	1917	felscha01
-- 34	1917	jacksjo01
-- 35	1918	flackma01
-- 36	1918	holloch01
-- 37	1918	killebi01
-- 38	1918	mcinnst01
-- 39	1918	pickch01
-- 40	1918	sheanda01
-- 41	1918	whitege01
-- 42	1919	grohhe01
-- 43	1919	roushed01
-- 44	1920	speaktr01
-- 45	1921	friscfr01
-- 46	1922	bancrda01
-- 47	1922	duganjo01
-- 48	1922	grohhe01
-- 49	1923	ruthba01
-- 50	1924	kellyge01
-- 51	1925	mooreed01
-- 52	1926	ruthba01
-- 53	1926	southbi01
-- 54	1927	combsea01
-- 55	1928	ruthba01
-- 56	1929	simmoal01
-- 57	1930	bishoma01
-- 58	1930	cochrmi01
-- 59	1931	martipe01
-- 60	1932	gehrilo01
-- 61	1933	jackstr01
-- 62	1933	ottme01
-- 63	1933	terrybi01
-- 64	1934	martipe01
-- 65	1935	gehrich01
-- 66	1936	powelja03
-- 67	1937	selkige01
-- 68	1938	dimagjo01
-- 69	1938	gehrilo01
-- 70	1939	kellech01
-- 71	1940	goodmiv01
-- 72	1940	greenha01
-- 73	1940	mccosba01
-- 74	1940	werbebi01
-- 75	1941	kellech01
-- 76	1942	rolfere01
-- 77	1943	crosefr01
-- 78	1944	sandera01
-- 79	1945	cavarph01
-- 80	1945	cramedo01
-- 81	1945	greenha01
-- 82	1946	yorkru01
-- 83	1947	johnsbi03
-- 84	1948	elliobo01
-- 85	1948	mitchda01
-- 86	1949	brownbo03
-- 87	1949	henrito01
-- 88	1949	woodlge01
-- 89	1950	berrayo01
-- 90	1950	brownbo03
-- 91	1950	colemje01
-- 92	1950	dimagjo01
-- 93	1950	woodlge01
-- 94	1951	woodlge01
-- 95	1952	mantlmi01
-- 96	1952	mcdougi01
-- 97	1952	snidedu01
-- 98	1953	bauerha01
-- 99	1953	camparo01
-- 100	1954	thompha02
-- 101	1955	collijo01
-- 102	1956	mantlmi01
-- 103	1956	slaugen01
-- 104	1957	aaronha01
-- 105	1957	berrayo01
-- 106	1957	loganjo01
-- 107	1958	bauerha01
-- 108	1959	landiji01
-- 109	1960	mantlmi01
-- 110	1960	richabo01
-- 111	1961	howarel01
-- 112	1962	treshto01
-- 113	1963	gilliji01
-- 114	1964	mantlmi01
-- 115	1965	fairlro01
-- 116	1966	robinfr02
-- 117	1967	brocklo01
-- 118	1968	brocklo01
-- 119	1968	hortowi01
-- 120	1968	kalinal01
-- 121	1969	ageeto01
-- 122	1969	belanma01
-- 123	1969	bosweke01
-- 124	1969	cartyri01
-- 125	1969	clenddo01
-- 126	1969	gonzato01
-- 127	1969	jonescl01
-- 128	1970	mayle01
-- 129	1970	powelbo01
-- 130	1971	cashda01
-- 131	1971	roberbo01
-- 132	1971	robinfr02
-- 133	1972	morgajo02
-- 134	1972	tenacge01
-- 135	1973	campabe01
-- 136	1974	bandosa01
-- 137	1974	garvest01
-- 138	1974	lopesda01
-- 139	1974	wynnji01
-- 140	1975	yastrca01
-- 141	1976	chambch01
-- 142	1976	rivermi01
-- 143	1977	jacksre01
-- 144	1978	whitero01
-- 145	1979	stargwi01
-- 146	1980	schmimi01
-- 147	1981	lopesda01
-- 148	1982	mcgeewi01
-- 149	1982	smithlo01
-- 150	1982	yountro01
-- 151	1983	murraed02
-- 152	1983	ripkeca01
-- 153	1983	schmimi01
-- 154	1984	gwynnto01
-- 155	1984	whitalo01
-- 156	1985	brettge01
-- 157	1985	mcgeewi01
-- 158	1985	sundbji01
-- 159	1986	riceji01
-- 160	1987	brunato01
-- 161	1987	brunato01
-- 162	1987	colemvi01
-- 163	1987	gaettga01
-- 164	1987	gagnegr01
-- 165	1987	gagnegr01
-- 166	1987	gladdda01
-- 167	1987	leonaje01
-- 168	1987	penato01
-- 169	1987	puckeki01
-- 170	1988	saxst01
-- 171	1989	clarkwi02
-- 172	1989	henderi01
-- 173	1990	hatchbi01
-- 174	1991	pendlte01
-- 175	1992	winfida01
-- 176	1993	molitpa01
-- 177	1995	griffke02
-- 178	1996	lopezja01
-- 179	1997	thomeji01
-- 180	1997	willima04
-- 181	1998	oneilpa01
-- 182	1999	thomeji01
-- 183	1999	varitja01
-- 184	2000	perezti01
-- 185	2001	sandere02
-- 186	2002	bondsba01
-- 187	2003	cabremi01
-- 188	2004	beltrca01
-- 189	2005	biggicr01
-- 190	2006	beltrca01
-- 191	2007	youklke01
-- 192	2008	pedrodu01
-- 193	2009	utleych01
-- 194	2010	cruzne02
-- 195	2010	hamiljo03
-- 196	2010	murphda07
-- 197	2010	renteed01
-- 198	2011	berkmla01
-- 199	2012	descada01
-- 200	2013	ellsbja01
-- 201	2013	ortizda01
-- 202	2014	pencehu01
-- 203	2015	zobribe01
-- 204	2016	rizzoan01
-- 205	2017	springe01
-- 206	2018	beninan01
-- 207	2019	altuvjo01
-- 208	2019	bregmal01
-- 209	2019	lemahdj01
-- 210	2019	ozunama01
-- 211	2019	sotoju01
-- 212	2019	springe01
