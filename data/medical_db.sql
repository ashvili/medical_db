--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender (
    id smallint NOT NULL,
    name character varying(50)
);


ALTER TABLE public.gender OWNER TO postgres;

--
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.gender ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: medical_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_card (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    middle_name character varying(50),
    date_birth date,
    gender_id smallint,
    phone character varying(50),
    job_info character varying(150),
    document_info character varying(50),
    note text,
    address character varying(150),
    date_created date,
    state_id smallint
);


ALTER TABLE public.medical_card OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.medical_card ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: patient_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_state (
    id smallint NOT NULL,
    name character varying(50)
);


ALTER TABLE public.patient_state OWNER TO postgres;

--
-- Name: patient_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.patient_state ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.patient_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gender (id, name) FROM stdin;
1	М
2	Ж
\.


--
-- Data for Name: medical_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_card (id, first_name, last_name, middle_name, date_birth, gender_id, phone, job_info, document_info, note, address, date_created, state_id) FROM stdin;
6	Андрей	Малахов	\N	1970-06-01	1	н/д	телевизор	\N	говорит	\N	\N	2
5	Николай	Басков	\N	1970-05-01	1	н/д	концерты	\N	поет	\N	\N	3
7	Филипп	Киркоров	\N	1950-05-05	1	н/д	израиль	\N	поет	\N	\N	1
8	Лолита	Милявская	\N	1969-07-06	2	\N	телек	\N	поет	\N	\N	3
9	Потап и Настя	Каменских	\N	1990-01-01	2	\N	эстрада	\N	\N	\N	\N	3
\.


--
-- Data for Name: patient_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient_state (id, name) FROM stdin;
1	Лечится
2	Вылечен
3	Направлен в стационар
\.


--
-- Name: gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_id_seq', 2, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 10, true);


--
-- Name: patient_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_state_id_seq', 3, true);


--
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- Name: medical_card patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_card
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: patient_state patient_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_state
    ADD CONSTRAINT patient_state_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

