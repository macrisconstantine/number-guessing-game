--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    best_game integer,
    games_played integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.users (username, best_game, games_played) FROM stdin;
fred	4	7
user_1754806199243	1	2
user_1754806199244	1	5
user_1754806212770	1	2
user_1754806212771	1	5
user_1754806293716	\N	0
user_1754806293715	\N	0
nino	\N	0
user_1754806421205	732	2
user_1754806421206	218	5
user_1754806456367	156	2
user_1754806456368	415	5
user_1754806530144	654	2
user_1754806530145	37	5
user_1754806618127	106	2
user_1754806618128	211	5
\.


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

