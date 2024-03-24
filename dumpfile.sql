--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    description character varying(255),
    title character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    comment_text character varying(255),
    commented_date timestamp(6) without time zone,
    post_id integer,
    id integer,
    edited_date timestamp(6) without time zone
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_comment_id_seq OWNER TO postgres;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follows (
    follow_id integer NOT NULL,
    followed_date timestamp(6) without time zone,
    follower integer,
    following integer
);


ALTER TABLE public.follows OWNER TO postgres;

--
-- Name: follows_follow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.follows_follow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_follow_id_seq OWNER TO postgres;

--
-- Name: follows_follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.follows_follow_id_seq OWNED BY public.follows.follow_id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    like_id integer NOT NULL,
    liked_date timestamp(6) without time zone,
    post_id integer,
    id integer
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_like_id_seq OWNER TO postgres;

--
-- Name: likes_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_like_id_seq OWNED BY public.likes.like_id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    chat_room_id character varying(255),
    count integer NOT NULL,
    not_time_stamp timestamp(6) without time zone,
    notification_from integer NOT NULL,
    notification_from_email character varying(255),
    notification_from_full_name character varying(255),
    notification_from_user_id integer NOT NULL,
    notification_to integer NOT NULL,
    notification_to_email character varying(255),
    notification_to_full_name character varying(255),
    notification_to_user_id integer NOT NULL,
    notification_type smallint,
    read boolean NOT NULL,
    CONSTRAINT notifications_notification_type_check CHECK (((notification_type >= 0) AND (notification_type <= 2)))
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    post_id integer NOT NULL,
    added_date timestamp(6) without time zone,
    content character varying(255),
    image_name character varying(255),
    title character varying(255),
    category_id integer,
    user_id integer,
    image_url character varying(255),
    reported_count integer DEFAULT 0
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post.post_id;


--
-- Name: refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_token (
    id integer NOT NULL,
    expiry_date timestamp(6) with time zone,
    token character varying(255),
    user_id integer
);


ALTER TABLE public.refresh_token OWNER TO postgres;

--
-- Name: refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refresh_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refresh_token_id_seq OWNER TO postgres;

--
-- Name: refresh_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refresh_token_id_seq OWNED BY public.refresh_token.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    reporting_reason character varying(255),
    reported_post_post_id integer,
    reported_user_id integer,
    reporting_user_id integer
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_seq OWNER TO postgres;

--
-- Name: user_blocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_blocks (
    blocking_user_id integer NOT NULL,
    blocked_user_id integer NOT NULL
);


ALTER TABLE public.user_blocks OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    users integer NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    bio character varying(255),
    email character varying(100) NOT NULL,
    full_name character varying(100) NOT NULL,
    password character varying(255),
    user_handle character varying(100) NOT NULL,
    provider character varying(255),
    profile_pic_url character varying(255),
    is_blocked boolean,
    user_presence boolean DEFAULT false NOT NULL,
    reported_count integer DEFAULT 0,
    public_profile boolean,
    CONSTRAINT users_provider_check CHECK (((provider)::text = ANY ((ARRAY['LOCAL'::character varying, 'GOOGLE'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: comment comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- Name: follows follow_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows ALTER COLUMN follow_id SET DEFAULT nextval('public.follows_follow_id_seq'::regclass);


--
-- Name: likes like_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN like_id SET DEFAULT nextval('public.likes_like_id_seq'::regclass);


--
-- Name: notifications notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: post post_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN post_id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- Name: refresh_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token ALTER COLUMN id SET DEFAULT nextval('public.refresh_token_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, description, title) FROM stdin;
1	including grumpy	cat
3	including grumpy	cat
2	All the cats including Grumpys	Catss
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (comment_id, comment_text, commented_date, post_id, id, edited_date) FROM stdin;
3	The post is awesome	2024-02-26 18:32:13.384941	6	3	\N
4	The post is awesome	2024-02-26 18:35:53.193161	6	3	\N
5	The post is awesome	2024-02-26 18:39:13.54124	6	3	\N
44	adfafdsadfs	2024-02-27 15:13:00.671755	5	4	\N
45	nice	2024-02-27 15:16:35.411133	7	4	\N
46	awesome	2024-02-28 09:13:29.066213	5	4	\N
47	super	2024-03-03 11:52:50.281586	6	4	\N
50	Excellent	2024-03-06 09:11:33.237865	9	4	\N
53	Great	2024-03-06 09:27:35.968544	9	41	\N
59	Great9	2024-03-09 05:39:30.809049	25	4	2024-03-09 05:39:36.954359
60	Thats awesome	2024-03-09 05:47:46.484965	25	42	\N
61	Great10	2024-03-10 00:49:54.799695	25	4	\N
64	why	2024-03-24 09:22:22.543078	25	43	\N
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follows (follow_id, followed_date, follower, following) FROM stdin;
93	2024-03-03 23:25:13.469478	4	3
94	2024-03-04 12:27:48.904006	4	44
97	2024-03-04 12:42:52.85156	4	32
153	2024-03-09 05:47:19.814937	42	4
154	2024-03-09 05:47:31.135417	42	41
155	2024-03-09 05:53:31.360682	45	4
103	2024-03-04 12:59:42.826458	4	33
163	2024-03-10 21:36:21.232456	55	42
164	2024-03-20 15:58:32.30606	4	43
165	2024-03-20 18:40:17.184515	46	4
170	2024-03-22 15:06:41.574849	43	41
171	2024-03-23 17:33:46.310078	4	41
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (like_id, liked_date, post_id, id) FROM stdin;
5	2024-02-26 11:20:13.073714	5	3
25	2024-03-04 10:10:50.767009	6	4
26	2024-03-05 12:53:39.316568	5	4
27	2024-03-06 20:24:21.325159	25	41
36	2024-03-10 00:21:18.60353	24	4
40	2024-03-10 00:47:11.036691	25	4
41	2024-03-14 17:52:24.04581	26	4
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (notification_id, chat_room_id, count, not_time_stamp, notification_from, notification_from_email, notification_from_full_name, notification_from_user_id, notification_to, notification_to_email, notification_to_full_name, notification_to_user_id, notification_type, read) FROM stdin;
17	65e219cba817d048c38698ba	0	2024-03-20 18:43:22.138873	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
18	65e219cba817d048c38698ba	0	2024-03-20 18:44:03.567636	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
1	65e219cba817d048c38698ba	0	2024-03-17 11:29:16.599391	4	athul.raj100@gmail.com	Athul Raj	4	42	demo2@gmail.com	demo2 demo	42	0	t
2	65e219cba817d048c38698ba	0	2024-03-17 14:59:25.262937	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
3	65e219cba817d048c38698ba	0	2024-03-17 15:07:14.939875	4	athul.raj100@gmail.com	Athul Raj	4	42	demo2@gmail.com	demo2 demo	42	0	t
4	65e219cba817d048c38698ba	0	2024-03-18 09:45:34.156956	4	athul.raj100@gmail.com	Athul Raj	4	42	demo2@gmail.com	demo2 demo	42	0	t
5	65edc2a39748ff2d7a5a10be	0	2024-03-20 15:49:14.939833	45	demo5@gmail.com	demo5 demo	45	4	athul.raj100@gmail.com	Athul Raj	4	0	t
6	65edc2a39748ff2d7a5a10be	0	2024-03-20 15:49:33.803512	45	demo5@gmail.com	demo5 demo	45	4	athul.raj100@gmail.com	Athul Raj	4	0	t
7	65edc2a39748ff2d7a5a10be	0	2024-03-20 15:49:50.79515	45	demo5@gmail.com	demo5 demo	45	4	athul.raj100@gmail.com	Athul Raj	4	0	t
8	65edc2a39748ff2d7a5a10be	0	2024-03-20 15:50:00.842752	45	demo5@gmail.com	demo5 demo	45	4	athul.raj100@gmail.com	Athul Raj	4	0	t
19	65e219cba817d048c38698ba	0	2024-03-20 18:44:18.082353	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
20	65e739600c22e50187e4061d	0	2024-03-20 18:44:36.48655	46	demo6@gmail.com	demo6 demo	46	4	athul.raj100@gmail.com	Athul Raj	4	0	t
21	65e219cba817d048c38698ba	0	2024-03-21 08:55:28.755632	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
22	65faba70192bcb6710805cde	0	2024-03-21 08:55:51.361667	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
9	65edc2a39748ff2d7a5a10be	0	2024-03-20 15:57:04.011071	45	demo5@gmail.com	demo5 demo	45	4	athul.raj100@gmail.com	Athul Raj	4	0	t
10	65faba70192bcb6710805cde	0	2024-03-20 15:59:13.522372	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
11	65faba70192bcb6710805cde	0	2024-03-20 18:12:20.668246	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
12	65faba70192bcb6710805cde	0	2024-03-20 18:37:00.860014	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
13	65faba70192bcb6710805cde	0	2024-03-20 18:39:48.505386	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
14	65e739600c22e50187e4061d	0	2024-03-20 18:40:27.614106	46	demo6@gmail.com	demo6 demo	46	4	athul.raj100@gmail.com	Athul Raj	4	0	t
15	65e739600c22e50187e4061d	0	2024-03-20 18:41:59.933963	46	demo6@gmail.com	demo6 demo	46	4	athul.raj100@gmail.com	Athul Raj	4	0	t
16	65e219cba817d048c38698ba	0	2024-03-20 18:42:22.322306	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
23	65e219cba817d048c38698ba	0	2024-03-21 09:03:33.227732	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
24	65e219cba817d048c38698ba	0	2024-03-21 09:05:09.39574	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
25	65e219cba817d048c38698ba	0	2024-03-21 09:05:57.70668	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
28	65e219cba817d048c38698ba	0	2024-03-21 09:14:52.970703	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
29	65e219cba817d048c38698ba	0	2024-03-21 09:17:02.74086	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
30	65e219cba817d048c38698ba	0	2024-03-21 09:24:00.467507	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
26	65faba70192bcb6710805cde	0	2024-03-21 09:06:17.263953	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
27	65faba70192bcb6710805cde	0	2024-03-21 09:06:27.200599	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
31	65e219cba817d048c38698ba	0	2024-03-21 09:32:45.104035	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
33	65e219cba817d048c38698ba	0	2024-03-21 09:34:00.163616	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
32	65faba70192bcb6710805cde	0	2024-03-21 09:33:25.024378	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
34	65e219cba817d048c38698ba	0	2024-03-21 09:45:36.581095	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
36	65e219cba817d048c38698ba	0	2024-03-21 09:50:45.163942	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
35	65faba70192bcb6710805cde	0	2024-03-21 09:46:00.20626	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
37	65e219cba817d048c38698ba	0	2024-03-21 10:07:09.778945	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
38	65e219cba817d048c38698ba	0	2024-03-21 18:28:47.144449	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
39	65e219cba817d048c38698ba	0	2024-03-22 09:24:30.154622	4	athul.raj100@gmail.com	Athul Raj	4	42	demo2@gmail.com	demo2 demo	42	0	t
40	65e219cba817d048c38698ba	0	2024-03-22 09:24:41.79785	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
41	65e219cba817d048c38698ba	0	2024-03-22 16:52:05.375209	42	demo2@gmail.com	demo2 demo	42	4	athul.raj100@gmail.com	Athul Raj	4	0	t
42	65e219cba817d048c38698ba	0	2024-03-22 16:52:29.372455	4	athul.raj100@gmail.com	Athul Raj	4	42	demo2@gmail.com	demo2 demo	42	0	t
43	65faba70192bcb6710805cde	0	2024-03-23 16:45:51.459264	43	demo3@gmail.com	demo3 demo	43	4	athul.raj100@gmail.com	Athul Raj	4	0	t
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (post_id, added_date, content, image_name, title, category_id, user_id, image_url, reported_count) FROM stdin;
9	2024-02-11 09:45:46.95	asdrfads	7893493e-67cc-43c1-b3ed-036ef6cf3878.jpg	Title	1	4	\N	0
10	2024-02-11 09:46:54.736	qwqwqw	b65b8382-10bd-4021-8817-78964007f054.jpg	Title	1	4	\N	0
11	2024-02-11 10:04:53.606	afds	44bc664a-16b6-425d-bd77-e3dd3bf950f0.jpeg	Title	1	4	\N	0
12	2024-02-11 10:09:29.016	afdfa	0861fafe-b37a-4137-9f98-d64ecf12c96d.jpeg	Title	1	4	\N	0
13	2024-02-11 10:10:32.651	gffggfhgf	a563e660-66d6-4ac5-bfb4-1cd6689c8a67.jpg	Title	1	4	\N	0
14	2024-02-11 10:15:38.597	rgrg	0c5b0dcd-c8cd-4f8e-aa0c-f6157cc109cc.jpeg	Title	1	4	\N	0
15	2024-02-11 19:45:28.982	afdafadsfasdf	33f561cf-4ca9-441e-8c4e-1419f5a17e44.jpeg	Title	1	4	\N	0
16	2024-02-11 19:45:52.331	afdafadsfasdf	5ddedcfd-cb3a-4619-a829-550783f9befb.jpeg	Title	1	4	\N	0
23	2024-02-11 20:57:38.458	nmnmnmnm	8849cf58-dcd9-4373-b78c-16dbce65affb.jpg	Title	1	4	\N	0
8	2024-02-11 09:45:21.305	asdrfads	7606fa27-1fed-4c65-8335-2c643bfad1ea.jpg	Title	1	4	\N	0
6	2024-02-10 21:42:44.053	fefefeef	9cf3984d-ffb8-48c0-bdcb-8f19c5ecc146.jpeg	Title	1	41	\N	0
5	2024-01-27 09:13:34.28	amgular grumpy	aae3d2f3-11af-4d4d-be9d-a82ec4330811.jpg	cat 	2	41	\N	1
7	2024-02-10 21:44:42.793	dere	15d02198-617b-48a0-9495-8f15b159a3aa.jpg	Title	1	41	\N	1
24	2024-03-06 19:50:15.785	The Art of debugging	b2310878-c454-4696-8d82-e938b8567cfa.jpg	Title	1	4	\N	0
25	2024-03-06 20:23:27.293	WHY??	a1fa3329-41f9-4822-a382-556c3a31036f.png	Title	1	41	\N	1
26	2024-03-14 17:51:05.985	Which one are you?	8b965d04-276e-4051-87b7-89794615ab9b.png	Title	1	4	\N	0
27	2024-03-14 17:52:54.244	10 is the charm 	35b9e712-81ca-4bcc-99da-434fef570a3d.jpg	Title	1	4	\N	0
32	2024-03-15 12:54:19.638	chr	8ac0a233-40d5-4409-b2a4-2a4212761ec2.jpg	Title	1	4	\N	0
38	2024-03-21 11:05:56.351	memeFest	5db3a3c3-8d39-4cc6-8cc2-dba9c7fd6018.jpg	Title	1	42	\N	0
60	2024-03-23 17:36:33.796	simple memes	f296088a-8b42-480f-baf4-0ae0999c2a21.jpg	Title	1	42	\N	0
\.


--
-- Data for Name: refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_token (id, expiry_date, token, user_id) FROM stdin;
659	2024-03-21 13:07:22.594512+05:30	5ac80cd4-fb2b-40bc-8a6b-9c419e8c0709	41
347	2024-03-01 23:37:18.157525+05:30	7135d478-9974-4144-99f4-67ee871c54c5	3
664	2024-03-21 17:22:47.500125+05:30	40f7847f-6488-4818-be3f-72ad5513b955	46
724	2024-03-22 18:31:17.524923+05:30	06b66a39-7d52-4854-a4f9-238f2e1d3b38	1
730	2024-03-23 18:48:41.126476+05:30	75c3a98f-716a-4b3c-867f-1abd9a01691e	4
472	2024-03-09 07:59:41.538323+05:30	a29575a8-015c-438b-9a86-fe112c1b1b25	47
731	2024-03-23 19:16:05.179597+05:30	e942e119-3796-4c62-b9d5-07d7051052eb	42
732	2024-03-24 11:01:01.611534+05:30	e3b915e2-d5c3-43cd-8f77-e3db59fca118	43
630	2024-03-20 17:28:59.885468+05:30	f97b3f64-e935-4192-8c05-eeb02947ec57	45
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, reporting_reason, reported_post_post_id, reported_user_id, reporting_user_id) FROM stdin;
6	Spam	5	41	4
8	Spam	7	41	4
9	Spam	25	41	4
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_USER
\.


--
-- Data for Name: user_blocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_blocks (blocking_user_id, blocked_user_id) FROM stdin;
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (users, role) FROM stdin;
1	1
3	2
4	2
32	2
33	2
41	2
42	2
43	2
44	2
45	2
46	2
47	2
55	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, bio, email, full_name, password, user_handle, provider, profile_pic_url, is_blocked, user_presence, reported_count, public_profile) FROM stdin;
44	demo dg 4	demo4@gmail.com	demo4demo	$2a$10$OqeOh6nQCW0XoaeeM0vkxulPFeDuPp0Q29wczGrYdPwlLH9Lmj52.	demo4	LOCAL	https://memegramawsbucket1.s3.us-east-2.amazonaws.com//myfolder/images/defaultProfilePicture.jpeg	f	f	0	t
41	demo dg	demo@gmail.com	demo demo	$2a$10$Jxd0Fv8hHO6k2IDo2h2QMe69dKMZOUYpkX3fKT7YCzYdKD1X1ctOe	demo2	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/MEMEGRAM.png	f	f	3	f
47	demo dg 7	demo7@gmail.com	demo7 demo	$2a$10$Tc1OvoqT6rMBhiXoacS6EuBEHvxpqey8TzR4uzmqmkMwJ8kqeoXn6	demo7	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/spandey.jpg	f	f	0	t
46	demo dg 6	demo6@gmail.com	demo6 demo	$2a$10$sryANgmEXhqzhTZfS6MxGexl3QIsiVOYR/qPxOX7l6qc8iKEMzJrC	demo6	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/dq.jpg	f	f	0	t
1	Admin	admin@gmail.com	admin	$2a$10$cntA3YtDjqB8kwVNxB2A5uStGhtlUk251ZEbY90b5yOml2tz/QTYC	admin	LOCAL	https://memegramawsbucket1.s3.us-east-2.amazonaws.com//myfolder/images/defaultProfilePicture.jpeg	f	t	0	t
3	go lang dev	aarathy@gmail.com	aarathy nair	$2a$10$cntA3YtDjqB8kwVNxB2A5uStGhtlUk251ZEbY90b5yOml2tz/QTYC	aarathy	LOCAL	https://memegramawsbucket1.s3.us-east-2.amazonaws.com//myfolder/images/defaultProfilePicture.jpeg	f	f	0	t
32	Memes are the essence of life, the happy pills 	athul.raj101@gmail.com	Athul101 Raj	$2a$10$wyMYJTvFgx0g4Fp8PDo98uhZv9D24q3ng4o7zGEhdDbF4eGl3A/om	athul	LOCAL	https://memegramawsbucket1.s3.us-east-2.amazonaws.com//myfolder/images/defaultProfilePicture.jpeg	f	f	0	t
33	Having a great day, coming here to chill and see some good memes	athul.raj102@gmail.com	Athul102 Raj	$2a$10$rPuZn.SwtDVeDsNRf7HriuwmnOuY7e65GlK1CzY6A09fDLQdLYLZu	athul	LOCAL	https://memegramawsbucket1.s3.us-east-2.amazonaws.com//myfolder/images/defaultProfilePicture.jpeg	f	f	0	t
42	demo dg 2	demo2@gmail.com	demo2 demo	$2a$10$Mdwp/JctxrKP1VPa0oIwjuU1ITVeVeIyvoh11sWClwp1zwO0d2RPG	demo3	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/ssr.jpg	f	t	0	t
4	Java spring Boot developer with Angular 	athul.raj100@gmail.com	Athul Raj	$2a$10$yOFPpx3NcDME0Gxpb.Z2Gu7oAPCdjfMUHuQF0JIRhLMo1Yx/OdfJ2	athul	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/octo.jpeg	f	f	0	t
43	demo dg 3	demo3@gmail.com	demo3 demo	$2a$10$UOX0tVOSzdsq4ItalgB6iONL87QFM/LOk.gMuGWeqEQ/eulq6eo06	demo3	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/johnwick.jpeg	f	t	0	t
55	\N	techmobo2@gmail.com	techmobo2	\N	techmobo2	GOOGLE	https://lh3.googleusercontent.com/a/ACg8ocKmENUk1lPnBAP2K4zPHTwwxRJnlNpYAl5QI1_dGvpKWw=s96-c	f	f	0	t
45	demo dg 5	demo5@gmail.com	demo5 demo	$2a$10$cqFdZibe.Ogo3qLp3LKNhe/75CgMGMxiMT.Sz3HCt/Iot3jHmqW0m	demo5	LOCAL	https://memegramawsbucket1.s3-us-east-2.amazonaws.com//myfolder/images/dakokta.jpeg	f	f	0	t
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 3, true);


--
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 64, true);


--
-- Name: follows_follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.follows_follow_id_seq', 171, true);


--
-- Name: likes_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_like_id_seq', 49, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 43, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_post_id_seq', 60, true);


--
-- Name: refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refresh_token_id_seq', 732, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 9, true);


--
-- Name: role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 55, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (follow_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (like_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- Name: refresh_token refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT refresh_token_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: reports uk3ey19hige360tdjhqul94lcul; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT uk3ey19hige360tdjhqul94lcul UNIQUE (reported_user_id, reporting_user_id, reported_post_post_id);


--
-- Name: refresh_token uk_f95ixxe7pa48ryn1awmh2evt7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT uk_f95ixxe7pa48ryn1awmh2evt7 UNIQUE (user_id);


--
-- Name: follows ukik9jgeb6b6iqxm3qk8048nm5o; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT ukik9jgeb6b6iqxm3qk8048nm5o UNIQUE (follower, following);


--
-- Name: likes uknthavc94i0ej3b06qfr8y99f7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT uknthavc94i0ej3b06qfr8y99f7 UNIQUE (post_id, id);


--
-- Name: user_blocks user_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT user_blocks_pkey PRIMARY KEY (blocking_user_id, blocked_user_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (users, role);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users usersunique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT usersunique UNIQUE (email);


--
-- Name: user_role fk26f1qdx6r8j1ggkgras9nrc1d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk26f1qdx6r8j1ggkgras9nrc1d FOREIGN KEY (role) REFERENCES public.role(id);


--
-- Name: reports fk5ejj0j2gfgojf9t87mpoqiq6q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk5ejj0j2gfgojf9t87mpoqiq6q FOREIGN KEY (reported_post_post_id) REFERENCES public.post(post_id);


--
-- Name: user_role fk6513mbu5em1wsl88xivf5ek2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fk6513mbu5em1wsl88xivf5ek2m FOREIGN KEY (users) REFERENCES public.users(id);


--
-- Name: post fk7ky67sgi7k0ayf22652f7763r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk7ky67sgi7k0ayf22652f7763r FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_blocks fk88ycaua2bsajvea7bx6yg3jw2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT fk88ycaua2bsajvea7bx6yg3jw2 FOREIGN KEY (blocked_user_id) REFERENCES public.users(id);


--
-- Name: reports fk8ia60sl09wkwhnkikpmi6007d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk8ia60sl09wkwhnkikpmi6007d FOREIGN KEY (reporting_user_id) REFERENCES public.users(id);


--
-- Name: reports fkb3bqi44mjskbnwupr31nfq5ui; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fkb3bqi44mjskbnwupr31nfq5ui FOREIGN KEY (reported_user_id) REFERENCES public.users(id);


--
-- Name: user_blocks fkj1cxfobo9xqka2hnpnycbtsio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_blocks
    ADD CONSTRAINT fkj1cxfobo9xqka2hnpnycbtsio FOREIGN KEY (blocking_user_id) REFERENCES public.users(id);


--
-- Name: comment fkji97mds8pr20s2e4ccc4aq5e5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fkji97mds8pr20s2e4ccc4aq5e5 FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: post fkjl0ab1c7s7gsd0tp830a7oogx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fkjl0ab1c7s7gsd0tp830a7oogx FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: follows fkjnqt4f5bti6niw7afunse4de7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fkjnqt4f5bti6niw7afunse4de7 FOREIGN KEY (follower) REFERENCES public.users(id);


--
-- Name: refresh_token fkjtx87i0jvq2svedphegvdwcuy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT fkjtx87i0jvq2svedphegvdwcuy FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: likes fkoevdgt9kxj4lm79p7gcj84jna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fkoevdgt9kxj4lm79p7gcj84jna FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: likes fkowd6f4s7x9f3w50pvlo6x3b41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fkowd6f4s7x9f3w50pvlo6x3b41 FOREIGN KEY (post_id) REFERENCES public.post(post_id);


--
-- Name: follows fkrt4ta5lo6hf1lrq6g5lgfgblf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fkrt4ta5lo6hf1lrq6g5lgfgblf FOREIGN KEY (following) REFERENCES public.users(id);


--
-- Name: comment fks1slvnkuemjsq2kj4h3vhx7i1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fks1slvnkuemjsq2kj4h3vhx7i1 FOREIGN KEY (post_id) REFERENCES public.post(post_id);


--
-- PostgreSQL database dump complete
--

