CREATE TABLE IF NOT EXISTS public.applications
(
    id integer NOT NULL DEFAULT nextval('applications_id_seq'::regclass),
    company character varying(255) COLLATE pg_catalog."default",
    "position" text COLLATE pg_catalog."default",
    date_identified date,
    date_applied date,
    decision_date date,
    status character varying(50) COLLATE pg_catalog."default" NOT NULL DEFAULT 'New'::character varying,
    job_description_link text COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    source character varying(50) COLLATE pg_catalog."default",
    job_description_text text COLLATE pg_catalog."default",
    green_flags text COLLATE pg_catalog."default",
    red_flags text COLLATE pg_catalog."default",
    normalized_url text COLLATE pg_catalog."default",
    platform character varying(50) COLLATE pg_catalog."default",
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT applications_pkey PRIMARY KEY (id)
)
