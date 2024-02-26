--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-02-26 20:22:47 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16521)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    cno integer NOT NULL,
    dname character varying(100) NOT NULL,
    cname character varying(100)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16508)
-- Name: dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept (
    dname character varying(100) NOT NULL,
    numphds integer
);


ALTER TABLE public.dept OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16561)
-- Name: enroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enroll (
    sid integer NOT NULL,
    dname character varying(100) NOT NULL,
    cno integer NOT NULL,
    sectno integer NOT NULL,
    grade character varying(100)
);


ALTER TABLE public.enroll OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16536)
-- Name: major; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.major (
    dname character varying(100) NOT NULL,
    sid integer NOT NULL
);


ALTER TABLE public.major OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16513)
-- Name: prof; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prof (
    pname character varying(100),
    dname character varying(100)
);


ALTER TABLE public.prof OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16551)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    dname character varying(100) NOT NULL,
    cno integer NOT NULL,
    sectno integer NOT NULL,
    pname character varying(100)
);


ALTER TABLE public.section OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16502)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    sid integer NOT NULL,
    sname character varying(100),
    sex character(1),
    age integer,
    year integer,
    gpa double precision
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16501)
-- Name: student_sid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_sid_seq OWNER TO postgres;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 215
-- Name: student_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_sid_seq OWNED BY public.student.sid;


--
-- TOC entry 3467 (class 2604 OID 16505)
-- Name: student sid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN sid SET DEFAULT nextval('public.student_sid_seq'::regclass);


--
-- TOC entry 3634 (class 0 OID 16521)
-- Dependencies: 219
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (cno, dname, cname) FROM stdin;
302	Computer Sciences	Intro to Programming
310	Chemical Engineering	Thermodynamics
310	Sanitary Engineering	Intro to Garbage
365	Civil Engineering	City Planning
375	Civil Engineering	Highway Engineering
461	Mathematics	College Geometry 1
462	Mathematics	College Geometry 2
467	Computer Sciences	Intro to Data Structures
514	Industrial Engineering	Manpower Utilization
561	Civil Engineering	Advanced City Planning
561	Sanitary Engineering	Advanced Garbage Collection
701	Computer Sciences	Compiler Construction
726	Computer Sciences	Nonlinear Programming
\.


--
-- TOC entry 3632 (class 0 OID 16508)
-- Dependencies: 217
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept (dname, numphds) FROM stdin;
Computer Sciences	47
Chemical Engineering	32
Civil Engineering	88
Industrial Engineering	41
Mathematics	129
Sanitary Engineering	3
\.


--
-- TOC entry 3637 (class 0 OID 16561)
-- Dependencies: 222
-- Data for Name: enroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enroll (sid, dname, cno, sectno, grade) FROM stdin;
1	Chemical Engineering	310	1	3.0
2	Computer Sciences	302	1	3.0
3	Civil Engineering	375	1	3.5
4	Mathematics	461	1	4.0
5	Industrial Engineering	514	1	3.0
6	Computer Sciences	302	2	3.5
7	Computer Sciences	302	1	4.0
8	Computer Sciences	302	1	4.0
9	Civil Engineering	375	1	3.0
10	Computer Sciences	302	1	2.0
11	Computer Sciences	302	2	3.0
12	Computer Sciences	302	2	2.5
13	Computer Sciences	302	2	2.5
14	Mathematics	462	1	2.5
15	Chemical Engineering	310	1	3.0
16	Computer Sciences	467	1	3.0
16	Computer Sciences	701	1	3.0
17	Mathematics	461	1	3.0
18	Civil Engineering	375	1	2.0
18	Mathematics	461	1	3.5
19	Mathematics	461	1	3.5
20	Computer Sciences	302	1	2.5
21	Computer Sciences	467	1	3.0
21	Industrial Engineering	514	1	3.5
22	Computer Sciences	302	1	3.0
22	Computer Sciences	467	1	3.0
23	Civil Engineering	561	1	4.0
24	Computer Sciences	302	2	4.0
25	Computer Sciences	302	1	3.5
26	Mathematics	462	1	3.5
27	Industrial Engineering	514	1	2.5
28	Mathematics	461	1	3.0
29	Civil Engineering	365	1	3.0
29	Civil Engineering	375	1	3.0
29	Civil Engineering	561	1	3.0
30	Computer Sciences	467	1	4.0
31	Computer Sciences	302	1	3.5
32	Civil Engineering	561	1	2.0
33	Civil Engineering	365	1	2.0
33	Computer Sciences	726	1	3.0
34	Civil Engineering	561	1	1.0
35	Mathematics	461	1	3.0
36	Civil Engineering	375	1	3.0
37	Mathematics	462	1	3.0
38	Computer Sciences	302	2	3.0
39	Computer Sciences	302	1	3.0
40	Mathematics	462	1	3.5
41	Computer Sciences	701	1	3.0
42	Computer Sciences	701	1	3.5
43	Computer Sciences	467	1	2.5
44	Computer Sciences	726	1	4.0
45	Chemical Engineering	310	1	3.0
46	Computer Sciences	726	1	4.0
47	Civil Engineering	561	1	0.0
47	Civil Engineering	365	1	1.0
48	Civil Engineering	561	1	1.5
49	Chemical Engineering	310	1	3.5
49	Industrial Engineering	514	1	3.5
50	Industrial Engineering	514	1	4.0
51	Computer Sciences	726	1	3.0
52	Computer Sciences	302	1	1.0
52	Computer Sciences	467	1	4.0
53	Mathematics	462	1	4.0
54	Civil Engineering	375	1	3.0
55	Mathematics	461	1	2.5
56	Chemical Engineering	310	1	2.5
57	Computer Sciences	467	1	3.5
58	Industrial Engineering	514	1	2.0
59	Mathematics	462	1	3.5
60	Civil Engineering	561	1	2.5
61	Computer Sciences	726	1	2.0
61	Civil Engineering	561	1	3.5
62	Computer Sciences	726	1	2.5
63	Computer Sciences	701	1	2.5
64	Computer Sciences	726	1	3.5
64	Civil Engineering	561	1	4.0
66	Civil Engineering	365	1	1.5
66	Civil Engineering	375	1	4.0
67	Computer Sciences	467	1	3.5
67	Computer Sciences	701	1	4.0
68	Computer Sciences	726	1	3.5
69	Computer Sciences	467	1	2.0
69	Computer Sciences	302	2	3.5
70	Civil Engineering	561	1	3.5
71	Computer Sciences	701	1	2.5
72	Computer Sciences	726	1	3.5
73	Civil Engineering	375	1	3.0
74	Civil Engineering	365	1	2.5
75	Computer Sciences	726	1	3.0
76	Civil Engineering	365	1	3.5
77	Computer Sciences	701	1	2.0
78	Industrial Engineering	514	1	3.0
79	Civil Engineering	365	1	4.0
80	Computer Sciences	726	1	4.0
81	Civil Engineering	561	1	2.5
82	Computer Sciences	726	1	3.5
83	Computer Sciences	726	1	3.0
84	Computer Sciences	726	1	3.0
85	Civil Engineering	375	1	3.5
86	Computer Sciences	467	1	2.5
86	Computer Sciences	701	1	3.0
87	Computer Sciences	701	1	4.0
88	Chemical Engineering	310	1	2.0
89	Computer Sciences	701	1	3.5
90	Computer Sciences	726	1	3.5
90	Mathematics	462	1	3.5
91	Mathematics	462	1	4.0
92	Computer Sciences	726	1	4.0
93	Chemical Engineering	310	1	4.0
94	Mathematics	461	1	2.0
96	Civil Engineering	561	1	3.0
96	Civil Engineering	365	1	4.0
97	Industrial Engineering	514	1	3.0
98	Industrial Engineering	514	1	4.0
99	Computer Sciences	701	1	3.5
100	Computer Sciences	726	1	2.0
101	Mathematics	462	1	4.0
102	Mathematics	461	1	3.5
103	Computer Sciences	701	1	4.0
104	Sanitary Engineering	561	1	2.5999999046325684
104	Computer Sciences	302	2	2.7999999523162842
\.


--
-- TOC entry 3635 (class 0 OID 16536)
-- Dependencies: 220
-- Data for Name: major; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.major (dname, sid) FROM stdin;
Computer Sciences	1
Computer Sciences	2
Computer Sciences	3
Computer Sciences	4
Computer Sciences	5
Computer Sciences	6
Computer Sciences	7
Computer Sciences	8
Computer Sciences	9
Computer Sciences	10
Computer Sciences	11
Computer Sciences	12
Computer Sciences	13
Computer Sciences	14
Computer Sciences	15
Computer Sciences	16
Computer Sciences	17
Computer Sciences	18
Computer Sciences	19
Computer Sciences	20
Computer Sciences	21
Computer Sciences	22
Computer Sciences	23
Computer Sciences	24
Chemical Engineering	25
Chemical Engineering	26
Chemical Engineering	27
Chemical Engineering	28
Chemical Engineering	29
Chemical Engineering	30
Chemical Engineering	31
Chemical Engineering	32
Chemical Engineering	33
Chemical Engineering	34
Chemical Engineering	35
Civil Engineering	36
Civil Engineering	37
Civil Engineering	38
Civil Engineering	39
Civil Engineering	40
Civil Engineering	41
Civil Engineering	42
Civil Engineering	43
Civil Engineering	44
Civil Engineering	45
Civil Engineering	46
Civil Engineering	47
Civil Engineering	48
Civil Engineering	49
Civil Engineering	50
Civil Engineering	51
Civil Engineering	52
Civil Engineering	53
Civil Engineering	54
Civil Engineering	55
Civil Engineering	56
Civil Engineering	57
Civil Engineering	58
Civil Engineering	59
Civil Engineering	60
Civil Engineering	61
Civil Engineering	62
Civil Engineering	63
Industrial Engineering	64
Industrial Engineering	65
Industrial Engineering	66
Industrial Engineering	67
Industrial Engineering	68
Industrial Engineering	69
Industrial Engineering	70
Industrial Engineering	71
Industrial Engineering	72
Industrial Engineering	73
Industrial Engineering	74
Industrial Engineering	75
Industrial Engineering	76
Industrial Engineering	77
Industrial Engineering	78
Industrial Engineering	79
Industrial Engineering	80
Industrial Engineering	81
Industrial Engineering	82
Industrial Engineering	83
Mathematics	84
Mathematics	85
Mathematics	86
Mathematics	87
Mathematics	88
Mathematics	89
Mathematics	90
Mathematics	91
Mathematics	92
Mathematics	93
Mathematics	94
Mathematics	95
Mathematics	96
Mathematics	97
Mathematics	98
Mathematics	99
Mathematics	100
Mathematics	101
Mathematics	102
Mathematics	103
Sanitary Engineering	104
Mathematics	1
Mathematics	2
\.


--
-- TOC entry 3633 (class 0 OID 16513)
-- Dependencies: 218
-- Data for Name: prof; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prof (pname, dname) FROM stdin;
Jones, J.	Computer Sciences
Smith, S.	Industrial Engineering
Brown, S.	Civil Engineering
Brian, C.	Computer Sciences
Edison, L.	Chemical Engineering
Bucket, T.	Sanitary Engineering
Robinson, T.	Mathematics
Clark, E.	Civil Engineering
Walter, A.	Industrial Engineering
Randolph, B.	Civil Engineering
\.


--
-- TOC entry 3636 (class 0 OID 16551)
-- Dependencies: 221
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.section (dname, cno, sectno, pname) FROM stdin;
Chemical Engineering	310	1	Edison, L.
Civil Engineering	365	1	Randolph, B.
Civil Engineering	375	1	Brown, S.
Civil Engineering	561	1	Randolph, B.
Computer Sciences	302	1	Jones, J.
Computer Sciences	302	2	Smith, S.
Computer Sciences	467	1	Jones, J.
Computer Sciences	701	1	Clark, E.
Computer Sciences	726	1	Brian, C.
Industrial Engineering	514	1	Walter, A.
Mathematics	461	1	Robinson, T.
Mathematics	462	1	Robinson, T.
Sanitary Engineering	561	1	Bucket, T.
\.


--
-- TOC entry 3631 (class 0 OID 16502)
-- Dependencies: 216
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (sid, sname, sex, age, year, gpa) FROM stdin;
1	Jacobs, T.	m	29	5	3.5999999046325684
2	Pierson, E.	m	32	5	3.5
3	Zeene, Ben N.	m	21	5	3.9000000953674316
4	Sulfate, Barry M.	m	19	2	2.799999952316284
5	Form, Clara O.	f	18	1	3.299999952316284
6	Scott, Kim J.	m	20	1	3.799999952316284
7	Sather, Roberto B.	m	22	4	2.200000047683716
8	Stanley, Leotha T.	m	21	3	3.5999999046325684
9	Smith, Joyce A.	f	21	4	2
10	Jones, David S.	m	19	2	3.5
11	Paul, Mary W.	f	23	5	3.5999999046325684
12	Soong, V.	f	24	5	3.5
13	Kellerman, S.	f	21	3	2.9000000953674316
14	Cheong, R.	m	25	4	3
15	Borchart, Sandra L.	f	26	5	3.9000000953674316
16	Alsberg, David J.	m	25	5	3.5
17	Thorton, James Q.	m	28	4	2.700000047683716
18	Gooch	m	26	1	1.399999976158142
19	Smith, L.	m	43	4	0.699999988079071
20	Korpel, E.	f	19	3	3.5
21	Surk, K.	m	23	2	2.5
22	Emile, R.	m	18	1	2
23	Bomber, C.	f	22	4	3.200000047683716
24	Carter, Jimmy	m	56	5	3.5
25	Kissinger, Henry	m	58	5	3.4000000953674316
26	Ford, Gerald	m	60	5	3.5
27	Anderson, P.	f	18	1	3.200000047683716
28	Austin, G.	m	25	5	3.5
29	Hamilton, S.	m	21	3	2.799999952316284
30	Baker, C.	f	18	1	3.5
31	Andrews, R.	m	19	2	2.799999952316284
32	Liu, Huihusan	m	29	5	3.9000000953674316
33	Chao, Tsechih	f	23	5	3.5999999046325684
34	Kasten, Norman L.	m	23	2	2.5
35	Mathews, John W.	m	29	5	3.5999999046325684
36	Burroughs, Susan S.	f	18	1	3
37	Dunbar, D.	m	30	5	3.4000000953674316
38	Auen, B.	m	21	3	2.700000047683716
39	Shoemaker, A.	f	22	4	3.5
40	Rosemeyer, S.	f	21	3	2.9000000953674316
41	Fisher, C.	f	22	4	3.5
42	Trude, T.	m	19	2	2.9000000953674316
43	Ksar, J.	m	20	3	3.4000000953674316
44	Moeri, S.	f	20	4	3.200000047683716
45	June, Granson	f	18	1	3.0999999046325684
46	Micheal, Zadicki T.	m	22	2	2.700000047683716
47	Roger, Blotter N.	m	21	3	1.899999976158142
48	Natividad, A.	f	25	5	4
49	Villa-lobos, M.	m	47	5	3.700000047683716
50	Moomchi, B.	m	32	5	3.5
51	Jetplane, Leaving O.	m	30	1	0
52	Fy, Clara I.	f	18	2	2
53	Atny, Mary H.	f	26	5	3.799999952316284
54	Maximillian	m	98	5	3
55	Glitch, R.	m	19	1	2.799999952316284
56	Starry, J.	f	22	4	3.299999952316284
57	Hiemerschmitz, A.	f	19	1	2.700000047683716
58	Marshmallton	m	20	3	3
59	Ziebart, F.	m	22	4	1.7999999523162842
60	Calcmity, J.	f	23	3	2.5999999046325684
61	Kennedy, Ed	m	55	3	2.299999952316284
62	Moses, A.	m	18	1	3.200000047683716
63	Kool, Joseph F.	m	35	5	3.700000047683716
64	Fred, Edwin B.	m	80	5	4
65	Ripper, Jack T.	m	18	1	0.5
66	Altenhaus, Stuart	m	21	4	2.799999952316284
67	Altenhaus, Gloria	f	22	5	4
68	Crist, J.	m	23	4	3
69	Heilskov, G.	m	23	4	2.5
70	Caucutt, B.	m	24	5	3
71	Mark, B.	m	24	4	3.5999999046325684
72	Barnes, J.	m	45	5	2.299999952316284
73	Quarnty, G.	f	20	2	4
74	Andrus, J.	f	21	3	3.700000047683716
75	Jones, A.	f	23	5	3.200000047683716
76	Zorhoff, C.	m	20	3	3
77	Paull, Thomas H.	m	23	4	2.5999999046325684
78	Cool, J.	m	18	2	2.5999999046325684
79	Evert, Chris	f	21	4	3.9000000953674316
80	Connors, Jimmy	m	25	1	0.20000000298023224
81	Smith, Ike Z.	m	33	1	1.100000023841858
82	News, Nightly	m	15	1	1.899999976158142
83	Jones, Ivan L.	m	55	5	3.5
84	Smith, R.	m	19	3	2.700000047683716
85	Mayer, N.	f	21	5	3.5
86	Gonring, J.	m	21	4	3.700000047683716
87	Mueller, D.	m	20	3	3.299999952316284
88	Bates, M.	m	22	4	3.299999952316284
89	Longlastname, A.	f	99	5	4
90	Zappa, F.	m	16	4	4
91	Ghandi, I.	f	78	1	3.5
92	Kirk, J.	m	34	5	2.200000047683716
93	Andermanthenol, K.	m	26	5	3.700000047683716
94	Uoiea, Z.	f	19	2	3.299999952316284
95	Grzlbltz, Q.	m	43	5	2.5
96	Birch, M.	f	23	5	3.5
97	Morgan, D.	m	18	1	3.5
98	Taylor, R.	m	20	3	2.799999952316284
99	Jones, J.	f	21	1	1.100000023841858
100	Gringo, C.	m	25	5	2.9000000953674316
101	Davis, Scott P.	m	19	3	3.700000047683716
102	Bates, Michael L.	m	22	4	3.4000000953674316
103	Kaisler, Janet M.	f	21	4	3.5
104	Baskett, Wayse T.	m	23	3	2.0999999046325684
\.


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 215
-- Name: student_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_sid_seq', 1, false);


--
-- TOC entry 3473 (class 2606 OID 16525)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (dname, cno);


--
-- TOC entry 3471 (class 2606 OID 16512)
-- Name: dept dept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept
    ADD CONSTRAINT dept_pkey PRIMARY KEY (dname);


--
-- TOC entry 3479 (class 2606 OID 16565)
-- Name: enroll enroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_pkey PRIMARY KEY (sid, dname, cno, sectno);


--
-- TOC entry 3475 (class 2606 OID 16540)
-- Name: major major_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.major
    ADD CONSTRAINT major_pkey PRIMARY KEY (dname, sid);


--
-- TOC entry 3477 (class 2606 OID 16555)
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (dname, cno, sectno);


--
-- TOC entry 3469 (class 2606 OID 16507)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (sid);


--
-- TOC entry 3481 (class 2606 OID 16526)
-- Name: course course_dname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_dname_fkey FOREIGN KEY (dname) REFERENCES public.dept(dname);


--
-- TOC entry 3485 (class 2606 OID 16566)
-- Name: enroll enroll_cno_dname_sectno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_cno_dname_sectno_fkey FOREIGN KEY (cno, dname, sectno) REFERENCES public.section(cno, dname, sectno);


--
-- TOC entry 3486 (class 2606 OID 16571)
-- Name: enroll enroll_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_sid_fkey FOREIGN KEY (sid) REFERENCES public.student(sid);


--
-- TOC entry 3482 (class 2606 OID 16541)
-- Name: major major_dname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.major
    ADD CONSTRAINT major_dname_fkey FOREIGN KEY (dname) REFERENCES public.dept(dname);


--
-- TOC entry 3483 (class 2606 OID 16546)
-- Name: major major_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.major
    ADD CONSTRAINT major_sid_fkey FOREIGN KEY (sid) REFERENCES public.student(sid);


--
-- TOC entry 3480 (class 2606 OID 16516)
-- Name: prof prof_dname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prof
    ADD CONSTRAINT prof_dname_fkey FOREIGN KEY (dname) REFERENCES public.dept(dname);


--
-- TOC entry 3484 (class 2606 OID 16556)
-- Name: section section_dname_cno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_dname_cno_fkey FOREIGN KEY (dname, cno) REFERENCES public.course(dname, cno);


-- Completed on 2024-02-26 20:22:47 IST

--
-- PostgreSQL database dump complete
--

