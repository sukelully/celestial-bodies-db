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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    diameter_ly integer,
    distance_million_ly numeric(5,2),
    num_stars text
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
    orbit_days numeric(10,2),
    atmosphere boolean,
    surface_temp text
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
    star_id integer,
    type text NOT NULL,
    moons integer,
    orbit_days numeric(10,2),
    has_life boolean DEFAULT false
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
-- Name: spaceships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceships (
    spaceships_id integer NOT NULL,
    name character varying(30) NOT NULL,
    source_media text
);


ALTER TABLE public.spaceships OWNER TO freecodecamp;

--
-- Name: spaceships_spaceships_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceships_spaceships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceships_spaceships_id_seq OWNER TO freecodecamp;

--
-- Name: spaceships_spaceships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceships_spaceships_id_seq OWNED BY public.spaceships.spaceships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type text NOT NULL,
    age_million_years integer,
    mass_m numeric(5,2) NOT NULL
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
-- Name: spaceships spaceships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships ALTER COLUMN spaceships_id SET DEFAULT nextval('public.spaceships_spaceships_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 140000, 0.03, '100-400 billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 2.54, '1 trillion');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Spiral', 50000, 29.00, '100 billion');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 60000, 23.00, '100 billion');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 120000, 53.00, '1 trillion');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Disrupted Barred Spiral', 14000, 0.16, '30 billion');
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Dwarf Galaxy', 7000, 0.20, '3 billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 27.30, false, '-233 to 123 °C');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.30, false, '-40 °C');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.30, false, '-40 °C');
INSERT INTO public.moon VALUES (4, 'Io', 3, 1.77, true, '-163 °C');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3.55, true, '-171 °C');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 7.16, true, '-163 °C');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 16.69, true, '-139 °C');
INSERT INTO public.moon VALUES (8, 'Enceladus', 4, 1.40, false, '-198 °C');
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 4.50, true, '-179 to -220 °C');
INSERT INTO public.moon VALUES (10, 'Titan', 4, 15.90, true, '-179 °C');
INSERT INTO public.moon VALUES (11, 'Iapetus', 4, 79.30, false, '-143 to -183 °C');
INSERT INTO public.moon VALUES (12, 'Miranda', 5, 1.40, false, '213 °C');
INSERT INTO public.moon VALUES (13, 'Titania', 5, 8.70, false, '-203 °C');
INSERT INTO public.moon VALUES (14, 'Triton', 6, 5.90, false, '-135 °C');
INSERT INTO public.moon VALUES (15, 'Charon', 11, 6.40, false, '−220 °C');
INSERT INTO public.moon VALUES (16, 'Mimas', 4, 0.94, false, '-209.15');
INSERT INTO public.moon VALUES (17, 'Tethys', 4, 1.89, false, '-187.15 °C');
INSERT INTO public.moon VALUES (18, 'Phoebe', 4, 550.56, false, '-200°C');
INSERT INTO public.moon VALUES (19, 'Janus', 4, 0.69, false, '-210 °C');
INSERT INTO public.moon VALUES (20, 'Herse', 3, 715.40, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 2, 687.00, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 79, 4333.00, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 82, 10756.00, false);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Gas Giant', 27, 30687.00, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Gas Giant', 14, 60190.00, false);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 'Terrestrial', 0, 225.00, false);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 'Terrestrial', 0, 88.00, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7, 'Exoplanet', NULL, 11.20, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 7, 'Exoplanet', NULL, 5.10, false);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, 'Dwarf Planet', 5, 90520.00, false);
INSERT INTO public.planet VALUES (12, 'Ceres', 1, 'Dwarf Planet', 0, 1680.00, false);
INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1, 365.24, true);


--
-- Data for Name: spaceships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceships VALUES (1, 'Planet Express', 'Futurama');
INSERT INTO public.spaceships VALUES (2, 'Starship Enterprise', 'Star Trek');
INSERT INTO public.spaceships VALUES (3, 'Millenium Falcon', 'Star Wars');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 'Yellow Dwarf', 4600, 1.00);
INSERT INTO public.star VALUES (2, 'Polaris', 1, 'Yellow Supergiant', 56, 1.26);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 11, 16.50);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 'Spectroscopic Binary', 60, 1.88);
INSERT INTO public.star VALUES (5, 'R71', 6, 'Blue Supergiant', NULL, 27.00);
INSERT INTO public.star VALUES (6, 'AB8', 7, 'Wolf-Rayet', 3, 61.00);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 'Red Dwarf', 4853, 0.12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spaceships_spaceships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceships_spaceships_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceships spaceships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_name_key UNIQUE (name);


--
-- Name: spaceships spaceships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_pkey PRIMARY KEY (spaceships_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

