--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (333, 2018, 'Final', 520, 521, 4, 2);
INSERT INTO public.games VALUES (334, 2018, 'Third Place', 522, 523, 2, 0);
INSERT INTO public.games VALUES (335, 2018, 'Semi-Final', 521, 523, 2, 1);
INSERT INTO public.games VALUES (336, 2018, 'Semi-Final', 520, 522, 1, 0);
INSERT INTO public.games VALUES (337, 2018, 'Quarter-Final', 521, 524, 3, 2);
INSERT INTO public.games VALUES (338, 2018, 'Quarter-Final', 523, 525, 2, 0);
INSERT INTO public.games VALUES (339, 2018, 'Quarter-Final', 522, 526, 2, 1);
INSERT INTO public.games VALUES (340, 2018, 'Quarter-Final', 520, 527, 2, 0);
INSERT INTO public.games VALUES (341, 2018, 'Eighth-Final', 523, 528, 2, 1);
INSERT INTO public.games VALUES (342, 2018, 'Eighth-Final', 525, 529, 1, 0);
INSERT INTO public.games VALUES (343, 2018, 'Eighth-Final', 522, 530, 3, 2);
INSERT INTO public.games VALUES (344, 2018, 'Eighth-Final', 526, 531, 2, 0);
INSERT INTO public.games VALUES (345, 2018, 'Eighth-Final', 521, 532, 2, 1);
INSERT INTO public.games VALUES (346, 2018, 'Eighth-Final', 524, 533, 2, 1);
INSERT INTO public.games VALUES (347, 2018, 'Eighth-Final', 527, 534, 2, 1);
INSERT INTO public.games VALUES (348, 2018, 'Eighth-Final', 520, 535, 4, 3);
INSERT INTO public.games VALUES (349, 2014, 'Final', 536, 535, 1, 0);
INSERT INTO public.games VALUES (350, 2014, 'Third Place', 537, 526, 3, 0);
INSERT INTO public.games VALUES (351, 2014, 'Semi-Final', 535, 537, 1, 0);
INSERT INTO public.games VALUES (352, 2014, 'Semi-Final', 536, 526, 7, 1);
INSERT INTO public.games VALUES (353, 2014, 'Quarter-Final', 537, 538, 1, 0);
INSERT INTO public.games VALUES (354, 2014, 'Quarter-Final', 535, 522, 1, 0);
INSERT INTO public.games VALUES (355, 2014, 'Quarter-Final', 526, 528, 2, 1);
INSERT INTO public.games VALUES (356, 2014, 'Quarter-Final', 536, 520, 1, 0);
INSERT INTO public.games VALUES (357, 2014, 'Eighth-Final', 526, 539, 2, 1);
INSERT INTO public.games VALUES (358, 2014, 'Eighth-Final', 528, 527, 2, 0);
INSERT INTO public.games VALUES (359, 2014, 'Eighth-Final', 520, 540, 2, 0);
INSERT INTO public.games VALUES (360, 2014, 'Eighth-Final', 536, 541, 2, 1);
INSERT INTO public.games VALUES (361, 2014, 'Eighth-Final', 537, 531, 2, 1);
INSERT INTO public.games VALUES (362, 2014, 'Eighth-Final', 538, 542, 2, 1);
INSERT INTO public.games VALUES (363, 2014, 'Eighth-Final', 535, 529, 1, 0);
INSERT INTO public.games VALUES (364, 2014, 'Eighth-Final', 522, 543, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (520, 'France');
INSERT INTO public.teams VALUES (521, 'Croatia');
INSERT INTO public.teams VALUES (522, 'Belgium');
INSERT INTO public.teams VALUES (523, 'England');
INSERT INTO public.teams VALUES (524, 'Russia');
INSERT INTO public.teams VALUES (525, 'Sweden');
INSERT INTO public.teams VALUES (526, 'Brazil');
INSERT INTO public.teams VALUES (527, 'Uruguay');
INSERT INTO public.teams VALUES (528, 'Colombia');
INSERT INTO public.teams VALUES (529, 'Switzerland');
INSERT INTO public.teams VALUES (530, 'Japan');
INSERT INTO public.teams VALUES (531, 'Mexico');
INSERT INTO public.teams VALUES (532, 'Denmark');
INSERT INTO public.teams VALUES (533, 'Spain');
INSERT INTO public.teams VALUES (534, 'Portugal');
INSERT INTO public.teams VALUES (535, 'Argentina');
INSERT INTO public.teams VALUES (536, 'Germany');
INSERT INTO public.teams VALUES (537, 'Netherlands');
INSERT INTO public.teams VALUES (538, 'Costa Rica');
INSERT INTO public.teams VALUES (539, 'Chile');
INSERT INTO public.teams VALUES (540, 'Nigeria');
INSERT INTO public.teams VALUES (541, 'Algeria');
INSERT INTO public.teams VALUES (542, 'Greece');
INSERT INTO public.teams VALUES (543, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 364, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 543, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

