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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: collection; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.collection OWNER TO freecodecamp;

--
-- Name: collection_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.collection_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_collection_id_seq OWNER TO freecodecamp;

--
-- Name: collection_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.collection_collection_id_seq OWNED BY public.collection.collection_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric(4,2),
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    distance_from_earth numeric(4,2),
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric(4,2),
    description text,
    planet_type integer,
    star_id integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    distance_from_earth numeric(4,2),
    age_in_millions_of_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: collection collection_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.collection ALTER COLUMN collection_id SET DEFAULT nextval('public.collection_collection_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.collection VALUES (1, 'Home', NULL);
INSERT INTO public.collection VALUES (2, 'Alien', NULL);
INSERT INTO public.collection VALUES (3, 'Unknown', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Adromeda Galaxy', 3.50, 3);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'The Antennae Galaxies', 19.50, 43);
INSERT INTO public.galaxy VALUES (3, 'Backward', 'The Backward Galaxy', 53.20, 35);
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'The Black Eye Galaxy', 42.50, 44);
INSERT INTO public.galaxy VALUES (5, 'Bodes', 'Bodes Galaxy', 55.40, 221);
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 'The Butterfly Galaxy', 52.40, 422);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'The only natural satellite of Earth', 2.57, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger and closer of the two natural satellites of Mars', 1.40, 4600);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and farther of the two natural satellites of Mars', 2.30, 4600);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'The innermost of the four Galilean moons of Jupiter', 28.20, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'The smallest of the four Galilean moons orbiting Jupiter', 28.20, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest and most massive moon of Jupiter', 28.20, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'The second largest moon of Jupiter', 28.20, 4500);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 'The smallest and innermost of Saturns major moons', 1.27, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'The sixth-largest moon of Saturn', 1.27, 4500);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 'The fifth-largest moon of Saturn', 1.27, 4500);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'The fourth-largest moon of Saturn', 1.27, 4500);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 'The smallest and innermost of Uranus five major moons', 18.20, 4600);
INSERT INTO public.moon VALUES (20, 'Oberon', 1, 'The second-largest moon of Uranus', 18.20, 4600);
INSERT INTO public.moon VALUES (19, 'Titania', 2, 'The largest of the moons of Uranus', 18.20, 4600);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 'The third-largest moon of Uranus', 18.20, 4600);
INSERT INTO public.moon VALUES (17, 'Ariel', 9, 'The fourth-largest of the 27 known moons of Uranus', 18.20, 4600);
INSERT INTO public.moon VALUES (15, 'Iapetus', 10, 'The third-largest natural satellite of Saturn', 1.27, 4500);
INSERT INTO public.moon VALUES (14, 'Hyperion', 11, 'A moon of Saturn discovered by William Cranch Bond', 1.27, 4500);
INSERT INTO public.moon VALUES (13, 'Titan', 12, 'The largest moon of Saturn', 1.27, 4500);
INSERT INTO public.moon VALUES (12, 'Rhea', 12, 'The second-largest moon of Saturn', 1.27, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 0.39, 'Smallest planet in our solar system', 1, 1, 4500);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 0.72, 'Second planet from the sun', 2, 2, 4500);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 1.00, 'Our home planet', 3, 3, 4500);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 1.52, 'The red planet', 4, 4, 4500);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 5.20, 'Largest planet in our solar system', 5, 5, 4500);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 9.58, 'The ringed planet', 6, 6, 4500);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 19.18, 'The ice giant', 1, 1, 4500);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 30.07, 'The windiest planet', 2, 2, 4500);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 39.48, 'Dwarf planet', 3, 3, 4500);
INSERT INTO public.planet VALUES (10, 'Ceres', false, true, 2.77, 'Largest object in the asteroid belt', 4, 4, 4500);
INSERT INTO public.planet VALUES (11, 'Haumea', false, true, 43.13, 'Dwarf planet shaped like a rugby ball', 5, 5, 4500);
INSERT INTO public.planet VALUES (12, 'Makemake', false, true, 45.79, 'Dwarf planet without an atmosphere', 6, 6, 4500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stephenson 2-18', 1, 'A big star', 22.52, 91);
INSERT INTO public.star VALUES (2, 'UT Scuti', 2, 'A big star', 91.51, 221);
INSERT INTO public.star VALUES (3, 'WOH G64', 3, 'A big star', 71.55, 519);
INSERT INTO public.star VALUES (4, 'RW Chephei', 4, 'A big star', 32.61, 9951);
INSERT INTO public.star VALUES (5, 'Westerlund 1-26', 5, 'A big star', 59.21, 2981);
INSERT INTO public.star VALUES (6, 'HD 143183', 6, 'A big star', 99.29, 551);


--
-- Name: collection_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.collection_collection_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: collection collection_collection_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_collection_id_key UNIQUE (collection_id);


--
-- Name: collection collection_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: collection pk_collection_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT pk_collection_id PRIMARY KEY (collection_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

