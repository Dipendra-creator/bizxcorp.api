--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.address (
    id bigint NOT NULL,
    pincode character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    city bigint,
    state bigint,
    country bigint
);


--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: authsession; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authsession (
    id bigint NOT NULL,
    token character varying(255),
    user_device character varying(255),
    user_ip character varying(255),
    user_agent character varying(255),
    last_used_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    "user" bigint
);


--
-- Name: authsession_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authsession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authsession_id_seq OWNED BY public.authsession.id;


--
-- Name: city_lookup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_lookup (
    id bigint NOT NULL,
    city_code character varying(255),
    city_name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    state bigint,
    country bigint
);


--
-- Name: city_lookup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_lookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: city_lookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_lookup_id_seq OWNED BY public.city_lookup.id;


--
-- Name: country_lookup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country_lookup (
    id bigint NOT NULL,
    country_name character varying(255),
    country_code character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: country_lookup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.country_lookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: country_lookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.country_lookup_id_seq OWNED BY public.country_lookup.id;


--
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id bigint NOT NULL,
    name character varying(255),
    number_of_employees integer,
    description character varying(255),
    tag character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    type bigint,
    address bigint
);


--
-- Name: organization_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_id_seq OWNED BY public.organization.id;


--
-- Name: organization_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_type (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: organization_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organization_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organization_type_id_seq OWNED BY public.organization_type.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: state_lookup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.state_lookup (
    id bigint NOT NULL,
    state_name character varying(255),
    state_code character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    country bigint
);


--
-- Name: state_lookup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.state_lookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: state_lookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.state_lookup_id_seq OWNED BY public.state_lookup.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    name character varying(255),
    dob date,
    email character varying(255),
    username character varying(255),
    password character varying(255),
    phone character varying(255),
    role character varying(255),
    status character varying(255),
    experience integer,
    organization_join_date date,
    salary bigint,
    number_of_posts integer,
    last_seen date,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    address bigint,
    organization bigint
);


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: authsession id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authsession ALTER COLUMN id SET DEFAULT nextval('public.authsession_id_seq'::regclass);


--
-- Name: city_lookup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_lookup ALTER COLUMN id SET DEFAULT nextval('public.city_lookup_id_seq'::regclass);


--
-- Name: country_lookup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_lookup ALTER COLUMN id SET DEFAULT nextval('public.country_lookup_id_seq'::regclass);


--
-- Name: organization id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization ALTER COLUMN id SET DEFAULT nextval('public.organization_id_seq'::regclass);


--
-- Name: organization_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_type ALTER COLUMN id SET DEFAULT nextval('public.organization_type_id_seq'::regclass);


--
-- Name: state_lookup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state_lookup ALTER COLUMN id SET DEFAULT nextval('public.state_lookup_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: authsession authsession_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authsession
    ADD CONSTRAINT authsession_pkey PRIMARY KEY (id);


--
-- Name: city_lookup city_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_lookup
    ADD CONSTRAINT city_lookup_pkey PRIMARY KEY (id);


--
-- Name: country_lookup country_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_lookup
    ADD CONSTRAINT country_lookup_pkey PRIMARY KEY (id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: organization_type organization_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_type
    ADD CONSTRAINT organization_type_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: state_lookup state_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state_lookup
    ADD CONSTRAINT state_lookup_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: address address_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_city_fkey FOREIGN KEY (city) REFERENCES public.city_lookup(id) ON DELETE CASCADE;


--
-- Name: address address_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_country_fkey FOREIGN KEY (country) REFERENCES public.country_lookup(id) ON DELETE CASCADE;


--
-- Name: address address_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_state_fkey FOREIGN KEY (state) REFERENCES public.state_lookup(id) ON DELETE CASCADE;


--
-- Name: authsession authsession_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authsession
    ADD CONSTRAINT authsession_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: city_lookup city_lookup_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_lookup
    ADD CONSTRAINT city_lookup_country_fkey FOREIGN KEY (country) REFERENCES public.country_lookup(id) ON DELETE CASCADE;


--
-- Name: city_lookup city_lookup_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_lookup
    ADD CONSTRAINT city_lookup_state_fkey FOREIGN KEY (state) REFERENCES public.state_lookup(id) ON DELETE CASCADE;


--
-- Name: organization organization_address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_address_fkey FOREIGN KEY (address) REFERENCES public.address(id) ON DELETE CASCADE;


--
-- Name: organization organization_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_type_fkey FOREIGN KEY (type) REFERENCES public.organization_type(id) ON DELETE CASCADE;


--
-- Name: state_lookup state_lookup_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state_lookup
    ADD CONSTRAINT state_lookup_country_fkey FOREIGN KEY (country) REFERENCES public.country_lookup(id) ON DELETE CASCADE;


--
-- Name: user user_address_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_address_fkey FOREIGN KEY (address) REFERENCES public.address(id) ON DELETE CASCADE;


--
-- Name: user user_organization_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_organization_fkey FOREIGN KEY (organization) REFERENCES public.organization(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20230922154506);
