--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.0

-- Started on 2025-02-13 21:57:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 855 (class 1247 OID 24580)
-- Name: especialidadeprofessor; Type: TYPE; Schema: public; Owner: neondb_owner
--

CREATE TYPE public.especialidadeprofessor AS ENUM (
    'Desenvolvedor',
    'Cientista de Dados',
    'UX/UI',
    'Engenheiro de Dados'
);


ALTER TYPE public.especialidadeprofessor OWNER TO neondb_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 32778)
-- Name: alunos; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    sobrenome character varying(80) NOT NULL,
    cpf character varying(11) NOT NULL,
    ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.alunos OWNER TO neondb_owner;

--
-- TOC entry 219 (class 1259 OID 32777)
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 219
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- TOC entry 222 (class 1259 OID 32788)
-- Name: professores; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.professores (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    sobrenome character varying(80) NOT NULL,
    cpf character varying(11) NOT NULL,
    especialidade public.especialidadeprofessor NOT NULL
);


ALTER TABLE public.professores OWNER TO neondb_owner;

--
-- TOC entry 221 (class 1259 OID 32787)
-- Name: professores_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.professores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professores_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 221
-- Name: professores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.professores_id_seq OWNED BY public.professores.id;


--
-- TOC entry 218 (class 1259 OID 32769)
-- Name: turmas; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.turmas (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    data_inicio date NOT NULL,
    data_termino date NOT NULL
);


ALTER TABLE public.turmas OWNER TO neondb_owner;

--
-- TOC entry 217 (class 1259 OID 32768)
-- Name: turmas_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.turmas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turmas_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 217
-- Name: turmas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.turmas_id_seq OWNED BY public.turmas.id;


--
-- TOC entry 226 (class 1259 OID 32814)
-- Name: turmasalunos; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.turmasalunos (
    id integer NOT NULL,
    id_turma integer NOT NULL,
    id_alunos integer NOT NULL
);


ALTER TABLE public.turmasalunos OWNER TO neondb_owner;

--
-- TOC entry 225 (class 1259 OID 32813)
-- Name: turmasalunos_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.turmasalunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turmasalunos_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 225
-- Name: turmasalunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.turmasalunos_id_seq OWNED BY public.turmasalunos.id;


--
-- TOC entry 224 (class 1259 OID 32797)
-- Name: turmasprofessor; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.turmasprofessor (
    id integer NOT NULL,
    id_turma integer NOT NULL,
    id_professor integer NOT NULL
);


ALTER TABLE public.turmasprofessor OWNER TO neondb_owner;

--
-- TOC entry 223 (class 1259 OID 32796)
-- Name: turmasprofessor_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.turmasprofessor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turmasprofessor_id_seq OWNER TO neondb_owner;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 223
-- Name: turmasprofessor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.turmasprofessor_id_seq OWNED BY public.turmasprofessor.id;


--
-- TOC entry 3211 (class 2604 OID 32781)
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 32791)
-- Name: professores id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.professores ALTER COLUMN id SET DEFAULT nextval('public.professores_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 32772)
-- Name: turmas id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmas ALTER COLUMN id SET DEFAULT nextval('public.turmas_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 32817)
-- Name: turmasalunos id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasalunos ALTER COLUMN id SET DEFAULT nextval('public.turmasalunos_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 32800)
-- Name: turmasprofessor id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasprofessor ALTER COLUMN id SET DEFAULT nextval('public.turmasprofessor_id_seq'::regclass);


--
-- TOC entry 3384 (class 0 OID 32778)
-- Dependencies: 220
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.alunos VALUES (5, 'Thainá Tuanne', 'Borges da Silva', '97461673000', true);
INSERT INTO public.alunos VALUES (6, 'Jabel Tiago', 'Martins', '91461673001', true);
INSERT INTO public.alunos VALUES (7, 'Gilmar', 'Borges da Silva', '98461673020', true);
INSERT INTO public.alunos VALUES (8, 'Maria Madalena', 'Demboski da Silva', '20499364007', false);
INSERT INTO public.alunos VALUES (9, 'Letícia', 'Leal', '66308635006', true);
INSERT INTO public.alunos VALUES (10, 'Anne Eduarda', 'Borges da Silva', '11251481019', true);
INSERT INTO public.alunos VALUES (11, 'Alanne Caroline', 'Borges da Silva', '67190014004', false);
INSERT INTO public.alunos VALUES (12, 'Jardon Moises', 'Martins', '03171150069', true);


--
-- TOC entry 3386 (class 0 OID 32788)
-- Dependencies: 222
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.professores VALUES (1, 'André', 'Tadesco', '82358634131', 'Desenvolvedor');
INSERT INTO public.professores VALUES (2, 'Margarete', 'Auxiliadora', '74837840590', 'Cientista de Dados');
INSERT INTO public.professores VALUES (3, 'Josué', 'Abreu', '55614325247', 'UX/UI');
INSERT INTO public.professores VALUES (4, 'Fernanda', 'Souza', '65243637793', 'Engenheiro de Dados');


--
-- TOC entry 3382 (class 0 OID 32769)
-- Dependencies: 218
-- Data for Name: turmas; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.turmas VALUES (1, 'Desenvolvimento Full Stack', '2025-02-13', '2025-12-19');
INSERT INTO public.turmas VALUES (2, 'Banco de Dados', '2025-02-13', '2025-12-19');
INSERT INTO public.turmas VALUES (3, 'Desenvolvedor Java', '2025-02-13', '2025-12-19');


--
-- TOC entry 3390 (class 0 OID 32814)
-- Dependencies: 226
-- Data for Name: turmasalunos; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.turmasalunos VALUES (33, 1, 5);
INSERT INTO public.turmasalunos VALUES (34, 2, 6);
INSERT INTO public.turmasalunos VALUES (35, 1, 7);
INSERT INTO public.turmasalunos VALUES (36, 3, 8);
INSERT INTO public.turmasalunos VALUES (37, 2, 9);
INSERT INTO public.turmasalunos VALUES (38, 3, 10);
INSERT INTO public.turmasalunos VALUES (39, 1, 11);
INSERT INTO public.turmasalunos VALUES (40, 2, 12);


--
-- TOC entry 3388 (class 0 OID 32797)
-- Dependencies: 224
-- Data for Name: turmasprofessor; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.turmasprofessor VALUES (1, 1, 1);
INSERT INTO public.turmasprofessor VALUES (2, 2, 2);
INSERT INTO public.turmasprofessor VALUES (3, 1, 3);
INSERT INTO public.turmasprofessor VALUES (4, 3, 4);
INSERT INTO public.turmasprofessor VALUES (5, 2, 3);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 219
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.alunos_id_seq', 12, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 221
-- Name: professores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.professores_id_seq', 4, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 217
-- Name: turmas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.turmas_id_seq', 3, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 225
-- Name: turmasalunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.turmasalunos_id_seq', 40, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 223
-- Name: turmasprofessor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.turmasprofessor_id_seq', 5, true);


--
-- TOC entry 3221 (class 2606 OID 32786)
-- Name: alunos alunos_cpf_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_cpf_key UNIQUE (cpf);


--
-- TOC entry 3223 (class 2606 OID 32784)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 32795)
-- Name: professores professores_cpf_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_cpf_key UNIQUE (cpf);


--
-- TOC entry 3227 (class 2606 OID 32793)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 32776)
-- Name: turmas turmas_nome_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_nome_key UNIQUE (nome);


--
-- TOC entry 3219 (class 2606 OID 32774)
-- Name: turmas turmas_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 32819)
-- Name: turmasalunos turmasalunos_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasalunos
    ADD CONSTRAINT turmasalunos_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 32802)
-- Name: turmasprofessor turmasprofessor_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasprofessor
    ADD CONSTRAINT turmasprofessor_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 32825)
-- Name: turmasalunos turmasalunos_id_alunos_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasalunos
    ADD CONSTRAINT turmasalunos_id_alunos_fkey FOREIGN KEY (id_alunos) REFERENCES public.alunos(id) ON DELETE CASCADE;


--
-- TOC entry 3235 (class 2606 OID 32820)
-- Name: turmasalunos turmasalunos_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasalunos
    ADD CONSTRAINT turmasalunos_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id) ON DELETE CASCADE;


--
-- TOC entry 3232 (class 2606 OID 32808)
-- Name: turmasprofessor turmasprofessor_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasprofessor
    ADD CONSTRAINT turmasprofessor_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.professores(id) ON DELETE CASCADE;


--
-- TOC entry 3233 (class 2606 OID 32803)
-- Name: turmasprofessor turmasprofessor_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.turmasprofessor
    ADD CONSTRAINT turmasprofessor_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id) ON DELETE CASCADE;


--
-- TOC entry 2068 (class 826 OID 24578)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2067 (class 826 OID 24577)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-02-13 21:57:52

--
-- PostgreSQL database dump complete
--

