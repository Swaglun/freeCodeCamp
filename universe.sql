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
    name character varying,
    billion_stars integer NOT NULL,
    light_years_from_earth integer,
    diameter_in_light_years integer
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
    planet_id integer,
    name character varying,
    orbital_period_days numeric(6,2) NOT NULL,
    earth_solar_system boolean
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
-- Name: orbital_telescopes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbital_telescopes (
    orbital_telescopes_id integer NOT NULL,
    name character varying NOT NULL,
    launched boolean,
    type text
);


ALTER TABLE public.orbital_telescopes OWNER TO freecodecamp;

--
-- Name: orbital_telescopes_orbital_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbital_telescopes_orbital_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbital_telescopes_orbital_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: orbital_telescopes_orbital_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbital_telescopes_orbital_telescope_id_seq OWNED BY public.orbital_telescopes.orbital_telescopes_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying,
    type character varying NOT NULL,
    earth_masses numeric(7,2)
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
    galaxy_id integer,
    name character varying,
    type character varying NOT NULL,
    solar_masses integer
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
-- Name: orbital_telescopes orbital_telescopes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_telescopes ALTER COLUMN orbital_telescopes_id SET DEFAULT nextval('public.orbital_telescopes_orbital_telescope_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 25000, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 2537000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 400, 600000000, 500000);
INSERT INTO public.galaxy VALUES (4, 'Canis Major', 1, 25000, 1000);
INSERT INTO public.galaxy VALUES (5, 'M87', 400, 53500000, 120000);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1', 500, 10000000, 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 27.00, true);
INSERT INTO public.moon VALUES (2, 3, 'Ganymede', 7.15, true);
INSERT INTO public.moon VALUES (3, 5, 'Titan', 15.95, true);
INSERT INTO public.moon VALUES (4, 3, 'Callisto', 16.69, true);
INSERT INTO public.moon VALUES (5, 3, 'Io', 1.77, true);
INSERT INTO public.moon VALUES (6, 3, 'Europa', 3.55, true);
INSERT INTO public.moon VALUES (7, 6, 'Triton', 5.88, true);
INSERT INTO public.moon VALUES (8, 5, 'Enceladus', 1.37, true);
INSERT INTO public.moon VALUES (9, 10, 'Titania', 8.71, true);
INSERT INTO public.moon VALUES (10, 10, 'Oberon', 13.46, true);
INSERT INTO public.moon VALUES (11, 11, 'Charon', 6.39, true);
INSERT INTO public.moon VALUES (12, 5, 'Rhea', 4.52, true);
INSERT INTO public.moon VALUES (13, 5, 'Iapetus', 79.32, true);
INSERT INTO public.moon VALUES (14, 5, 'Dione', 2.74, true);
INSERT INTO public.moon VALUES (15, 5, 'Tethys', 1.89, true);
INSERT INTO public.moon VALUES (16, 10, 'Miranda', 1.41, true);
INSERT INTO public.moon VALUES (17, 10, 'Ariel', 2.52, true);
INSERT INTO public.moon VALUES (18, 10, 'Umbriel', 4.14, true);
INSERT INTO public.moon VALUES (19, 4, 'Phobos', 0.32, true);
INSERT INTO public.moon VALUES (20, 4, 'Deimos', 1.26, true);
INSERT INTO public.moon VALUES (21, 6, 'Nereid', 360.13, true);


--
-- Data for Name: orbital_telescopes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbital_telescopes VALUES (1, 'Hubble', true, 'Optical');
INSERT INTO public.orbital_telescopes VALUES (2, 'James Webb', true, 'Multi-Wavelength');
INSERT INTO public.orbital_telescopes VALUES (3, 'Nancy Grace Roman', false, 'Infrared');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 'Earth', 'Terrestrial', 1.00);
INSERT INTO public.planet VALUES (3, 2, 'Jupiter', 'Gas Giant', 318.00);
INSERT INTO public.planet VALUES (4, 2, 'Mars', 'Terrestrial', 0.11);
INSERT INTO public.planet VALUES (5, 2, 'Saturn', 'Gas Giant', 95.00);
INSERT INTO public.planet VALUES (6, 2, 'Neptune', 'Ice Giant', 17.00);
INSERT INTO public.planet VALUES (7, 7, 'Proxima Centauri b', 'Terrestrial Exoplanet', 1.17);
INSERT INTO public.planet VALUES (8, 2, 'Mercury', 'Terrestrial', 0.06);
INSERT INTO public.planet VALUES (9, 2, 'Venus', 'Terrestrial', 0.82);
INSERT INTO public.planet VALUES (10, 2, 'Uranus', 'Ice Giant', 14.50);
INSERT INTO public.planet VALUES (11, 2, 'Pluto', 'Dwarf', 0.01);
INSERT INTO public.planet VALUES (12, 2, 'Eris', 'Dwarf', 0.01);
INSERT INTO public.planet VALUES (13, 1, 'Hypothetical Planet', 'Super-Earth', 5.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'S Andromedae', 'Supernova', 8);
INSERT INTO public.star VALUES (2, 1, 'Sun', 'G2V', 1);
INSERT INTO public.star VALUES (3, 1, 'Sirius B', 'White Dwarf', 1);
INSERT INTO public.star VALUES (4, 1, 'Sirius A', 'Main Sequence', 2);
INSERT INTO public.star VALUES (5, 1, 'Betelgeuse', 'Red Supergiant', 15);
INSERT INTO public.star VALUES (6, 1, 'Vega', 'A-Type Main Sequence', 2);
INSERT INTO public.star VALUES (7, 1, 'Proxima Centauri', 'Red Dwarf', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: orbital_telescopes_orbital_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbital_telescopes_orbital_telescope_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: orbital_telescopes orbital_telescopes_orbital_telescope_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_telescopes
    ADD CONSTRAINT orbital_telescopes_orbital_telescope_id_key UNIQUE (orbital_telescopes_id);


--
-- Name: orbital_telescopes orbital_telescopes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbital_telescopes
    ADD CONSTRAINT orbital_telescopes_pkey PRIMARY KEY (orbital_telescopes_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

