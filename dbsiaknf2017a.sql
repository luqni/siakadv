--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bandung; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bandung;


ALTER SCHEMA bandung OWNER TO postgres;

--
-- Name: pusat; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pusat;


ALTER SCHEMA pusat OWNER TO postgres;

--
-- Name: surabaya; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA surabaya;


ALTER SCHEMA surabaya OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: agama; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE agama AS ENUM (
    'Islam',
    'Kristen',
    'Khatolik',
    'Hindu',
    'Budha',
    'KongHuCu'
);


ALTER TYPE agama OWNER TO postgres;

--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gender AS ENUM (
    'L',
    'P'
);


ALTER TYPE gender OWNER TO postgres;

--
-- Name: haris; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE haris AS ENUM (
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
);


ALTER TYPE haris OWNER TO postgres;

--
-- Name: matkul_semester; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE matkul_semester AS ENUM (
    'Ganjil',
    'Genap',
    'Ganjil/Genap'
);


ALTER TYPE matkul_semester OWNER TO postgres;

--
-- Name: status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE status AS ENUM (
    'Baik',
    'Bermasalah'
);


ALTER TYPE status OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: absen_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE absen_dosen (
    id integer NOT NULL,
    tgl date,
    jam_masuk time without time zone,
    jam_pulang time without time zone,
    materi character varying(200),
    tmke smallint,
    kelas_id integer,
    dosen_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE absen_dosen OWNER TO postgres;

--
-- Name: absen_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE absen_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE absen_dosen_id_seq OWNER TO postgres;

--
-- Name: absen_dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE absen_dosen_id_seq OWNED BY absen_dosen.id;


--
-- Name: absen_mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE absen_mahasiswa (
    id integer NOT NULL,
    tgl date,
    kelas_id integer,
    tmke smallint,
    mhsid integer,
    status_id integer,
    prodi_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE absen_mahasiswa OWNER TO postgres;

--
-- Name: absen_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE absen_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE absen_mahasiswa_id_seq OWNER TO postgres;

--
-- Name: absen_mahasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE absen_mahasiswa_id_seq OWNED BY absen_mahasiswa.id;


--
-- Name: akad_bayar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE akad_bayar (
    id integer NOT NULL,
    tanggal timestamp without time zone DEFAULT now(),
    islunas smallint,
    nocamaba character varying(10),
    nim character varying(10),
    total double precision,
    isbeastudi smallint DEFAULT 0,
    keterangan character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE akad_bayar OWNER TO postgres;

--
-- Name: akad_bayar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE akad_bayar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE akad_bayar_id_seq OWNER TO postgres;

--
-- Name: akad_bayar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE akad_bayar_id_seq OWNED BY akad_bayar.id;


--
-- Name: akad_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE akad_kelas (
    id integer NOT NULL,
    kelas_id integer,
    komponen_id integer,
    persen double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE akad_kelas OWNER TO postgres;

--
-- Name: akad_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE akad_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE akad_kelas_id_seq OWNER TO postgres;

--
-- Name: akad_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE akad_kelas_id_seq OWNED BY akad_kelas.id;


--
-- Name: article_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE article_attachments (
    id integer NOT NULL,
    itemid integer NOT NULL,
    filename character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    "titleAttribute" text NOT NULL,
    hits integer NOT NULL
);


ALTER TABLE article_attachments OWNER TO postgres;

--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE article_categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    description text,
    parentid integer DEFAULT 0,
    state smallint DEFAULT (0)::smallint NOT NULL,
    access integer DEFAULT 0 NOT NULL,
    language character(7) NOT NULL,
    ordering integer DEFAULT 0 NOT NULL,
    image text,
    image_caption character varying(255) DEFAULT NULL::character varying,
    image_credits character varying(255) DEFAULT NULL::character varying,
    params text,
    metadesc text,
    metakey text,
    robots character varying(20) DEFAULT NULL::character varying,
    author character varying(50) DEFAULT NULL::character varying,
    copyright character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE article_categories OWNER TO postgres;

--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE article_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE article_categories_id_seq OWNER TO postgres;

--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE article_categories_id_seq OWNED BY article_categories.id;


--
-- Name: article_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE article_items (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    alias character varying(255) DEFAULT NULL::character varying,
    catid integer NOT NULL,
    userid integer NOT NULL,
    introtext text,
    fulltext text,
    state smallint DEFAULT (0)::smallint NOT NULL,
    access integer DEFAULT 0 NOT NULL,
    language character(7) NOT NULL,
    ordering integer DEFAULT 0 NOT NULL,
    hits integer DEFAULT 1 NOT NULL,
    image text,
    image_caption character varying(255) DEFAULT NULL::character varying,
    image_credits character varying(255) DEFAULT NULL::character varying,
    video text,
    video_type character varying(20) DEFAULT NULL::character varying,
    video_caption character varying(255) DEFAULT NULL::character varying,
    video_credits character varying(255) DEFAULT NULL::character varying,
    created timestamp(0) without time zone NOT NULL,
    created_by integer DEFAULT 0 NOT NULL,
    modified timestamp(0) without time zone NOT NULL,
    modified_by integer DEFAULT 0 NOT NULL,
    params text,
    metadesc text,
    metakey text,
    robots character varying(20) DEFAULT NULL::character varying,
    author character varying(50) DEFAULT NULL::character varying,
    copyright character varying(50) DEFAULT NULL::character varying,
    CONSTRAINT article_items_hits_check CHECK ((hits > 0))
);


ALTER TABLE article_items OWNER TO postgres;

--
-- Name: article_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE article_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE article_items_id_seq OWNER TO postgres;

--
-- Name: article_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE article_items_id_seq OWNED BY article_items.id;


--
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);


ALTER TABLE auth_assignment OWNER TO postgres;

--
-- Name: auth_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_item (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    rule_name character varying(64),
    data text,
    created_at integer,
    updated_at integer
);


ALTER TABLE auth_item OWNER TO postgres;

--
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE auth_item_child OWNER TO postgres;

--
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_rule (
    name character varying(64) NOT NULL,
    data text,
    created_at integer,
    updated_at integer
);


ALTER TABLE auth_rule OWNER TO postgres;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bank (
    id integer NOT NULL,
    kode character varying(4),
    nama character varying(40),
    alamat character varying(60),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE bank OWNER TO postgres;

--
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bank_id_seq OWNER TO postgres;

--
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bank_id_seq OWNED BY bank.id;


--
-- Name: beasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE beasiswa (
    mahasiswa_mshswid integer,
    "persenBeasiswa" character varying,
    sejumlah character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    semester character varying(20),
    id integer NOT NULL
);


ALTER TABLE beasiswa OWNER TO postgres;

--
-- Name: beasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE beasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE beasiswa_id_seq OWNER TO postgres;

--
-- Name: beasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE beasiswa_id_seq OWNED BY beasiswa.id;


--
-- Name: bimbingan_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bimbingan_detail (
    id integer NOT NULL,
    bimbingan_id integer,
    konsultasi text,
    tanggapan text,
    jenis_id integer
);


ALTER TABLE bimbingan_detail OWNER TO postgres;

--
-- Name: bimbingan_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bimbingan_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bimbingan_detail_id_seq OWNER TO postgres;

--
-- Name: bimbingan_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bimbingan_detail_id_seq OWNED BY bimbingan_detail.id;


--
-- Name: bimbingan_pa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bimbingan_pa (
    id integer NOT NULL,
    tanggal timestamp without time zone,
    dosenpa_id integer,
    mhsid integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    semester character varying(5) NOT NULL,
    ruang_id integer,
    jamke_mulai integer,
    jamke_akhir integer
);


ALTER TABLE bimbingan_pa OWNER TO postgres;

--
-- Name: bimbingan_pa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bimbingan_pa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bimbingan_pa_id_seq OWNER TO postgres;

--
-- Name: bimbingan_pa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bimbingan_pa_id_seq OWNED BY bimbingan_pa.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE person (
    nama character varying(50) NOT NULL,
    jk gender,
    tmp_lahir character varying(30),
    tgl_lahir date,
    alamat character varying(100),
    noktp character varying(30),
    email character varying(40),
    agama agama,
    telpon character varying(40),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE person OWNER TO postgres;

--
-- Name: COLUMN person.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN person.user_id IS 'User ID';


--
-- Name: camaba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE camaba (
    agama agama,
    id integer NOT NULL,
    asal_sekolah character varying(50),
    ayah character varying(40),
    ibu character varying(40),
    pilihan1_prodi integer,
    pilihan2_prodi integer,
    pilihan3_prodi integer,
    no_ijazah character varying(20),
    ratanilai_ijazah double precision,
    ratanilai_nem double precision,
    berat double precision,
    tinggi double precision,
    anak_ke smallint,
    jumlah_saudara smallint,
    alamat_ortu character varying(100),
    kota_sekolah character varying(30),
    thnlulus_sekolah integer,
    nisn character varying(10),
    pekerjaan_ayah integer,
    pekerjaan_ibu integer,
    gaji_ayah integer,
    gaji_ibu integer,
    jalurstudi_id integer,
    pendidikan_ayah_id integer,
    pendidikan_ibu_id integer,
    nama_wali character varying(40),
    pendidikan_wali_id integer,
    gaji_wali integer,
    tgl_lahir_ayah date,
    tgl_lahir_ibu date,
    tgl_lahir_wali date,
    pekerjaan_wali integer,
    no_camaba character varying(7)
)
INHERITS (person);


ALTER TABLE camaba OWNER TO postgres;

--
-- Name: camaba_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE camaba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camaba_id_seq OWNER TO postgres;

--
-- Name: camaba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE camaba_id_seq OWNED BY camaba.id;


--
-- Name: camaba_kebutuhan_khusus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE camaba_kebutuhan_khusus (
    id integer NOT NULL,
    camaba_id integer,
    kebutuhan_khusus_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE camaba_kebutuhan_khusus OWNER TO postgres;

--
-- Name: camaba_kebutuhan_khusus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE camaba_kebutuhan_khusus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camaba_kebutuhan_khusus_id_seq OWNER TO postgres;

--
-- Name: camaba_kebutuhan_khusus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE camaba_kebutuhan_khusus_id_seq OWNED BY camaba_kebutuhan_khusus.id;


--
-- Name: camaba_prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE camaba_prodi (
    id integer NOT NULL,
    nocamaba character varying(10),
    kode_prodi character varying(4),
    noujian character varying(20),
    nilai double precision,
    lulus boolean DEFAULT false,
    idtahun_akademik integer,
    foto character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE camaba_prodi OWNER TO postgres;

--
-- Name: camaba_prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE camaba_prodi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE camaba_prodi_id_seq OWNER TO postgres;

--
-- Name: camaba_prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE camaba_prodi_id_seq OWNED BY camaba_prodi.id;


--
-- Name: counter_nosurat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE counter_nosurat (
    id integer NOT NULL,
    nextcounter integer,
    tahun integer,
    idorg integer,
    kategori_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE counter_nosurat OWNER TO postgres;

--
-- Name: counter_nosurat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE counter_nosurat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE counter_nosurat_id_seq OWNER TO postgres;

--
-- Name: counter_nosurat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE counter_nosurat_id_seq OWNED BY counter_nosurat.id;


--
-- Name: detail_akad_bayar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detail_akad_bayar (
    id integer NOT NULL,
    idakad integer,
    idtarif integer,
    nilai double precision,
    islunas smallint,
    qty integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE detail_akad_bayar OWNER TO postgres;

--
-- Name: detail_akad_bayar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_akad_bayar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_akad_bayar_id_seq OWNER TO postgres;

--
-- Name: detail_akad_bayar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_akad_bayar_id_seq OWNED BY detail_akad_bayar.id;


--
-- Name: detail_bimbinganpa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detail_bimbinganpa (
    id integer NOT NULL,
    bimbinganpa_id integer,
    refkonsulpa_id integer,
    isi text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE detail_bimbinganpa OWNER TO postgres;

--
-- Name: detail_bimbinganpa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_bimbinganpa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_bimbinganpa_id_seq OWNER TO postgres;

--
-- Name: detail_bimbinganpa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_bimbinganpa_id_seq OWNED BY detail_bimbinganpa.id;


--
-- Name: khs_detail_komponen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE khs_detail_komponen (
    id integer NOT NULL,
    hasil_studi_id integer,
    komponen_id integer,
    nilai double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE khs_detail_komponen OWNER TO postgres;

--
-- Name: detail_hasil_studi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_hasil_studi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_hasil_studi_id_seq OWNER TO postgres;

--
-- Name: detail_hasil_studi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_hasil_studi_id_seq OWNED BY khs_detail_komponen.id;


--
-- Name: detail_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detail_invoice (
    id integer NOT NULL,
    invoice_id integer,
    tarif_id integer,
    nilai double precision,
    qty integer,
    keterangan character varying(40),
    potongan double precision DEFAULT 0,
    refpot_id integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE detail_invoice OWNER TO postgres;

--
-- Name: detail_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_invoice_id_seq OWNER TO postgres;

--
-- Name: detail_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_invoice_id_seq OWNED BY detail_invoice.id;


--
-- Name: detail_paket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detail_paket (
    id integer NOT NULL,
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE detail_paket OWNER TO postgres;

--
-- Name: detail_paket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detail_paket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detail_paket_id_seq OWNER TO postgres;

--
-- Name: detail_paket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detail_paket_id_seq OWNED BY detail_paket.id;


--
-- Name: pegawai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pegawai (
    nik character varying(20) NOT NULL,
    orgid integer,
    gelar_depan character varying(6),
    gelar_belakang character varying(20),
    tglmulai_kerja date,
    aktif smallint DEFAULT 0,
    golongan character varying(10)
)
INHERITS (person);


ALTER TABLE pegawai OWNER TO postgres;

--
-- Name: dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dosen (
    id integer NOT NULL,
    nidn character varying(10),
    jafung_id integer,
    statusdosen_id integer,
    goldikti character varying(10),
    homebase_id integer
)
INHERITS (pegawai);


ALTER TABLE dosen OWNER TO postgres;

--
-- Name: dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dosen_id_seq OWNER TO postgres;

--
-- Name: dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dosen_id_seq OWNED BY dosen.id;


--
-- Name: elearning_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE elearning_kelas (
    id integer NOT NULL,
    jumlah_slide smallint DEFAULT 0,
    jumlah_quiz smallint DEFAULT 0,
    jumlah_tugas smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE elearning_kelas OWNER TO postgres;

--
-- Name: elearning_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE elearning_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elearning_kelas_id_seq OWNER TO postgres;

--
-- Name: elearning_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE elearning_kelas_id_seq OWNED BY elearning_kelas.id;


--
-- Name: organisasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE organisasi (
    visi text,
    misi text,
    alamat character varying(100),
    website character varying(40),
    telpon character varying(20),
    email character varying(40),
    nama character varying(60),
    idorg integer NOT NULL,
    kode character varying(10),
    parent_orgid integer,
    pejabat character varying(30),
    nik_pejabat character varying(20),
    nama_jabatan character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE organisasi OWNER TO postgres;

--
-- Name: fakultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fakultas (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    id integer NOT NULL,
    nofakultas integer
)
INHERITS (organisasi);


ALTER TABLE fakultas OWNER TO postgres;

--
-- Name: fakultas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fakultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fakultas_id_seq OWNER TO postgres;

--
-- Name: fakultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fakultas_id_seq OWNED BY fakultas.id;


--
-- Name: fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fasilitas (
    kode character varying(10),
    nama character varying(50),
    nilai double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE fasilitas OWNER TO postgres;

--
-- Name: formulir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE formulir (
    id integer NOT NULL,
    nomor character varying(20),
    tgl_daftar date,
    prodi_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    tarif_id integer
);


ALTER TABLE formulir OWNER TO postgres;

--
-- Name: formulir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formulir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formulir_id_seq OWNER TO postgres;

--
-- Name: formulir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formulir_id_seq OWNED BY formulir.id;


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE invoice (
    id integer NOT NULL,
    nomor character varying(10),
    refid integer,
    total double precision,
    tanggal timestamp without time zone DEFAULT now(),
    nim character varying(10),
    semester character varying(5),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE invoice OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invoice_id_seq OWNER TO postgres;

--
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE invoice_id_seq OWNED BY invoice.id;


--
-- Name: jabatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jabatan (
    id integer NOT NULL,
    nama character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jabatan OWNER TO postgres;

--
-- Name: jabatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jabatan_id_seq OWNER TO postgres;

--
-- Name: jabatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jabatan_id_seq OWNED BY jabatan.id;


--
-- Name: jadwal_praktikum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jadwal_praktikum (
    id integer NOT NULL,
    kelas_id integer,
    jamke_mulai integer,
    jamke_akhir integer,
    ruang_id integer,
    hari smallint,
    semester character varying(5),
    ta_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jadwal_praktikum OWNER TO postgres;

--
-- Name: jadwal_praktikum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jadwal_praktikum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jadwal_praktikum_id_seq OWNER TO postgres;

--
-- Name: jadwal_praktikum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jadwal_praktikum_id_seq OWNED BY jadwal_praktikum.id;


--
-- Name: jafung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jafung (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jafung OWNER TO postgres;

--
-- Name: jafung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jafung_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jafung_id_seq OWNER TO postgres;

--
-- Name: jafung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jafung_id_seq OWNED BY jafung.id;


--
-- Name: jalur_studi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jalur_studi (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jalur_studi OWNER TO postgres;

--
-- Name: jalur_studi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jalur_studi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jalur_studi_id_seq OWNER TO postgres;

--
-- Name: jalur_studi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jalur_studi_id_seq OWNED BY jalur_studi.id;


--
-- Name: jamke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jamke (
    id integer NOT NULL,
    kode character varying(5),
    mulai time without time zone,
    akhir time without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jamke OWNER TO postgres;

--
-- Name: jamke_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jamke_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jamke_id_seq OWNER TO postgres;

--
-- Name: jamke_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jamke_id_seq OWNED BY jamke.id;


--
-- Name: jenis_bimbingan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_bimbingan (
    id integer NOT NULL,
    nama character varying(30)
);


ALTER TABLE jenis_bimbingan OWNER TO postgres;

--
-- Name: jenis_bimbingan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_bimbingan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_bimbingan_id_seq OWNER TO postgres;

--
-- Name: jenis_bimbingan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_bimbingan_id_seq OWNED BY jenis_bimbingan.id;


--
-- Name: jenis_pekerjaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_pekerjaan (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_pekerjaan OWNER TO postgres;

--
-- Name: jenis_pekerjaan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_pekerjaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_pekerjaan_id_seq OWNER TO postgres;

--
-- Name: jenis_pekerjaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_pekerjaan_id_seq OWNED BY jenis_pekerjaan.id;


--
-- Name: jenis_pembayaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_pembayaran (
    id integer NOT NULL,
    nama character varying(30),
    aktif smallint,
    is_potongan smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_pembayaran OWNER TO postgres;

--
-- Name: jenis_pembayaran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_pembayaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_pembayaran_id_seq OWNER TO postgres;

--
-- Name: jenis_pembayaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_pembayaran_id_seq OWNED BY jenis_pembayaran.id;


--
-- Name: jenis_prasarana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_prasarana (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_prasarana OWNER TO postgres;

--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_prasarana_id_seq OWNER TO postgres;

--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_prasarana_id_seq OWNED BY jenis_prasarana.id;


--
-- Name: jenis_ruang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_ruang (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_ruang OWNER TO postgres;

--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_ruang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_ruang_id_seq OWNER TO postgres;

--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_ruang_id_seq OWNED BY jenis_ruang.id;


--
-- Name: jenis_seminar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_seminar (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_seminar OWNER TO postgres;

--
-- Name: jenis_sidang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_sidang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_sidang_id_seq OWNER TO postgres;

--
-- Name: jenis_sidang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_sidang_id_seq OWNED BY jenis_seminar.id;


--
-- Name: jenis_surat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenis_surat (
    id integer NOT NULL,
    nama character varying(40),
    kategori_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenis_surat OWNER TO postgres;

--
-- Name: jenis_surat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenis_surat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenis_surat_id_seq OWNER TO postgres;

--
-- Name: jenis_surat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenis_surat_id_seq OWNED BY jenis_surat.id;


--
-- Name: jenjang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jenjang (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE jenjang OWNER TO postgres;

--
-- Name: jenjang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jenjang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jenjang_id_seq OWNER TO postgres;

--
-- Name: jenjang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jenjang_id_seq OWNED BY jenjang.id;


--
-- Name: kalendar_akademik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kalendar_akademik (
    id integer NOT NULL,
    prodi_id integer,
    ta_id integer,
    mulai_krs date,
    selesai_krs date,
    mulai_kuliah date,
    selesai_kuliah date,
    mulai_bayar date,
    selesai_bayar date,
    mulai_uts date,
    selesai_uts date,
    mulai_uas date,
    selesai_uas date,
    akhir_penilaian date,
    akhir_cuti date,
    keterangan text,
    nama character varying(60) NOT NULL,
    kode character varying(5) NOT NULL,
    aktif smallint,
    sp smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kalendar_akademik OWNER TO postgres;

--
-- Name: kalendar_akademik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kalendar_akademik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kalendar_akademik_id_seq OWNER TO postgres;

--
-- Name: kalendar_akademik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kalendar_akademik_id_seq OWNED BY kalendar_akademik.id;


--
-- Name: kampus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kampus (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    id integer NOT NULL,
    kategori_id integer,
    akreditasi character(1),
    nosk_banpt character varying(30),
    tglsk_banpt date,
    tglskakhir_banpt date
)
INHERITS (organisasi);


ALTER TABLE kampus OWNER TO postgres;

--
-- Name: kampus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kampus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kampus_id_seq OWNER TO postgres;

--
-- Name: kampus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kampus_id_seq OWNED BY kampus.id;


--
-- Name: kategori_kampus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kategori_kampus (
    id integer NOT NULL,
    nama character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kategori_kampus OWNER TO postgres;

--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategori_kampus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kategori_kampus_id_seq OWNER TO postgres;

--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategori_kampus_id_seq OWNED BY kategori_kampus.id;


--
-- Name: kategori_matakuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kategori_matakuliah (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kategori_matakuliah OWNER TO postgres;

--
-- Name: kategori_matakuliah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategori_matakuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kategori_matakuliah_id_seq OWNER TO postgres;

--
-- Name: kategori_matakuliah_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategori_matakuliah_id_seq OWNED BY kategori_matakuliah.id;


--
-- Name: kategori_nilai_ta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kategori_nilai_ta (
    id integer NOT NULL,
    nama character varying(40)
);


ALTER TABLE kategori_nilai_ta OWNER TO postgres;

--
-- Name: kategori_nilai_ta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategori_nilai_ta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kategori_nilai_ta_id_seq OWNER TO postgres;

--
-- Name: kategori_nilai_ta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategori_nilai_ta_id_seq OWNED BY kategori_nilai_ta.id;


--
-- Name: kategori_surat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kategori_surat (
    id integer NOT NULL,
    nama character varying(30),
    kode character varying(3),
    format character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kategori_surat OWNER TO postgres;

--
-- Name: kategori_surat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategori_surat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kategori_surat_id_seq OWNER TO postgres;

--
-- Name: kategori_surat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategori_surat_id_seq OWNED BY kategori_surat.id;


--
-- Name: kebutuhan_khusus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kebutuhan_khusus (
    id integer NOT NULL,
    kode character varying(2),
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kebutuhan_khusus OWNER TO postgres;

--
-- Name: kebutuhan_khusus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kebutuhan_khusus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kebutuhan_khusus_id_seq OWNER TO postgres;

--
-- Name: kebutuhan_khusus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kebutuhan_khusus_id_seq OWNED BY kebutuhan_khusus.id;


--
-- Name: kegiatan_akademik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kegiatan_akademik (
    id integer NOT NULL,
    deskripsi character varying(200),
    kode_semester character varying(5) NOT NULL,
    org_id integer,
    mulai date,
    akhir date,
    nik_pic character varying(20),
    budget double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kegiatan_akademik OWNER TO postgres;

--
-- Name: kegiatan_akademik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kegiatan_akademik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kegiatan_akademik_id_seq OWNER TO postgres;

--
-- Name: kegiatan_akademik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kegiatan_akademik_id_seq OWNED BY kegiatan_akademik.id;


--
-- Name: kehadiran_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kehadiran_dosen (
    id integer NOT NULL,
    tanggal date,
    jam_masuk time without time zone,
    jam_pulang time without time zone,
    tm_ke smallint,
    materi character varying(100),
    ontime smallint DEFAULT 0,
    kelas_id integer,
    hadir smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kehadiran_dosen OWNER TO postgres;

--
-- Name: kehadiran_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kehadiran_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kehadiran_dosen_id_seq OWNER TO postgres;

--
-- Name: kehadiran_dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kehadiran_dosen_id_seq OWNED BY kehadiran_dosen.id;


--
-- Name: kehadiran_mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kehadiran_mahasiswa (
    id integer NOT NULL,
    tanggal date,
    status_hadir smallint,
    keterangan character varying(40),
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kehadiran_mahasiswa OWNER TO postgres;

--
-- Name: kehadiran_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kehadiran_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kehadiran_mahasiswa_id_seq OWNER TO postgres;

--
-- Name: kehadiran_mahasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kehadiran_mahasiswa_id_seq OWNED BY kehadiran_mahasiswa.id;


--
-- Name: kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kelas (
    id integer NOT NULL,
    ta_id integer,
    mk_id integer,
    ruang_id integer,
    dosen_id integer,
    asdos_id integer,
    jamke_mulai integer,
    jamke_akhir integer,
    status smallint,
    hari haris,
    semester character varying(5),
    kode character varying(10),
    abbr character(3),
    tm smallint,
    prk smallint,
    lap smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kelas OWNER TO postgres;

--
-- Name: kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kelas_id_seq OWNER TO postgres;

--
-- Name: kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kelas_id_seq OWNED BY kelas.id;


--
-- Name: kelas_prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kelas_prodi (
    id integer NOT NULL,
    prodi_id integer,
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kelas_prodi OWNER TO postgres;

--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kelas_prodi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kelas_prodi_id_seq OWNER TO postgres;

--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kelas_prodi_id_seq OWNED BY kelas_prodi.id;


--
-- Name: keuangan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE keuangan (
    tunggakan character varying(30),
    beasiswa_id integer,
    mahasiswa_mhswid integer,
    setoran character varying(30),
    "statusKeu" boolean,
    "penundaanPembayaran" xml,
    "jenisTunggakan" character varying(30),
    keterangan character varying(50),
    "tglBayar" date,
    id integer NOT NULL
);


ALTER TABLE keuangan OWNER TO postgres;

--
-- Name: keuangan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE keuangan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE keuangan_id_seq OWNER TO postgres;

--
-- Name: keuangan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE keuangan_id_seq OWNED BY keuangan.id;


--
-- Name: khs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE khs (
    id integer NOT NULL,
    nim character varying(10),
    jumlah_sks integer,
    ips double precision,
    tgl_buat date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE khs OWNER TO postgres;

--
-- Name: khs_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE khs_detail (
    id integer NOT NULL,
    kelas_id integer,
    nilai_akhir double precision,
    grade character(2),
    bobot double precision,
    khs_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE khs_detail OWNER TO postgres;

--
-- Name: khs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE khs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE khs_id_seq OWNER TO postgres;

--
-- Name: khs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE khs_id_seq OWNED BY khs.id;


--
-- Name: komponen_nilai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE komponen_nilai (
    id integer NOT NULL,
    nama character varying(40),
    abbr character varying(5),
    aktif smallint DEFAULT 0,
    default_persen double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE komponen_nilai OWNER TO postgres;

--
-- Name: komponen_nilai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE komponen_nilai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE komponen_nilai_id_seq OWNER TO postgres;

--
-- Name: komponen_nilai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE komponen_nilai_id_seq OWNED BY komponen_nilai.id;


--
-- Name: komponen_nilai_seminar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE komponen_nilai_seminar (
    id integer NOT NULL,
    kategori_id integer,
    bobot double precision,
    deskripsi character varying(200)
);


ALTER TABLE komponen_nilai_seminar OWNER TO postgres;

--
-- Name: komponen_nilai_seminar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE komponen_nilai_seminar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE komponen_nilai_seminar_id_seq OWNER TO postgres;

--
-- Name: komponen_nilai_seminar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE komponen_nilai_seminar_id_seq OWNED BY komponen_nilai_seminar.id;


--
-- Name: kpi_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kpi_dosen (
    id integer NOT NULL,
    dosen_id integer NOT NULL,
    semester character varying(5) NOT NULL,
    tridharma_id integer NOT NULL,
    skor integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE kpi_dosen OWNER TO postgres;

--
-- Name: kpi_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kpi_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kpi_dosen_id_seq OWNER TO postgres;

--
-- Name: kpi_dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kpi_dosen_id_seq OWNED BY kpi_dosen.id;


--
-- Name: krs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE krs (
    id integer NOT NULL,
    nim character varying(10),
    jatah_sks integer,
    sks_diambil integer,
    semester character varying(10),
    tgl_buat date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE krs OWNER TO postgres;

--
-- Name: krs_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE krs_detail (
    id integer NOT NULL,
    kelas_id integer,
    status smallint DEFAULT 0,
    krs_id integer,
    last_update date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE krs_detail OWNER TO postgres;

--
-- Name: krs_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE krs_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE krs_detail_id_seq OWNER TO postgres;

--
-- Name: krs_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE krs_detail_id_seq OWNED BY krs_detail.id;


--
-- Name: krs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE krs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE krs_id_seq OWNER TO postgres;

--
-- Name: krs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE krs_id_seq OWNED BY krs.id;


--
-- Name: kuisioner_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kuisioner_kelas (
    id integer NOT NULL,
    qid integer,
    ans1 double precision,
    ans2 double precision,
    ans3 double precision,
    ans4 double precision,
    ovearall character varying(20),
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kuisioner_kelas OWNER TO postgres;

--
-- Name: kuisioner_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kuisioner_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kuisioner_kelas_id_seq OWNER TO postgres;

--
-- Name: kuisioner_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kuisioner_kelas_id_seq OWNED BY kuisioner_kelas.id;


--
-- Name: kurikulum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kurikulum (
    id integer NOT NULL,
    mulai date,
    akhir date,
    nama character varying(50),
    keterangan text,
    aktif smallint,
    kode character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kurikulum OWNER TO postgres;

--
-- Name: kurikulum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kurikulum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kurikulum_id_seq OWNER TO postgres;

--
-- Name: kurikulum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kurikulum_id_seq OWNED BY kurikulum.id;


--
-- Name: kurikulum_matakuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kurikulum_matakuliah (
    id integer NOT NULL,
    matkul_id integer,
    kurikulum_id integer,
    aktif smallint DEFAULT 1,
    default_semester smallint,
    kesedian_semester matkul_semester,
    prodi_id integer,
    wajib smallint DEFAULT 1,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE kurikulum_matakuliah OWNER TO postgres;

--
-- Name: kurikulum_matakuliah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kurikulum_matakuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kurikulum_matakuliah_id_seq OWNER TO postgres;

--
-- Name: kurikulum_matakuliah_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kurikulum_matakuliah_id_seq OWNED BY kurikulum_matakuliah.id;


--
-- Name: log_ta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE log_ta (
    id integer NOT NULL,
    ta_id integer,
    keterangan character varying(200),
    tanggal timestamp without time zone,
    status character varying(30)
);


ALTER TABLE log_ta OWNER TO postgres;

--
-- Name: log_ta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE log_ta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE log_ta_id_seq OWNER TO postgres;

--
-- Name: log_ta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE log_ta_id_seq OWNED BY log_ta.id;


--
-- Name: mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mahasiswa (
    mhsid integer NOT NULL,
    nim character varying(20),
    thn_masuk integer,
    ipk double precision,
    total_sks integer,
    no_ijazah character varying(20),
    tgl_lulus date,
    camaba_id integer,
    prodi_id integer,
    status_id integer,
    peminatan_id integer DEFAULT 0,
    kode_rombel character varying(6),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE mahasiswa OWNER TO postgres;

--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mahasiswa_mhsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mahasiswa_mhsid_seq OWNER TO postgres;

--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mahasiswa_mhsid_seq OWNED BY mahasiswa.mhsid;


--
-- Name: matakuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matakuliah (
    id integer NOT NULL,
    kode character varying(10),
    nama character varying(100),
    sks integer,
    kodemk_syarat character varying(20),
    deskripsi text,
    dosen_pengampu integer,
    capaian_belajar text,
    kategori_id integer,
    abbr character varying(4) NOT NULL,
    tm smallint,
    prk smallint,
    lap smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE matakuliah OWNER TO postgres;

--
-- Name: matakuliah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matakuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matakuliah_id_seq OWNER TO postgres;

--
-- Name: matakuliah_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matakuliah_id_seq OWNED BY matakuliah.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent integer,
    route character varying(256),
    "order" integer,
    data text,
    icon character varying(30)
);


ALTER TABLE menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE migration OWNER TO postgres;

--
-- Name: nilai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nilai (
    prodi_id integer,
    smt character varying(10),
    "prgPendidikan" integer,
    mhs_id integer,
    nim character varying(20),
    mk_id integer,
    nilai_uas double precision,
    nilai_uts double precision,
    nilai_tugas1 double precision,
    nilai_tugas2 double precision,
    nilai_tugas3 double precision,
    nilai_presentasi double precision,
    nilai_praktik double precision,
    nilai_absensi double precision,
    grade character varying(2),
    islock smallint,
    keterangan character varying(20),
    status_nilai status,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    camaba_id integer,
    kode_rombel character varying(6),
    nilai_akhir double precision,
    id integer NOT NULL,
    ta_id integer,
    detail character varying(100)
);


ALTER TABLE nilai OWNER TO postgres;

--
-- Name: nilai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nilai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nilai_id_seq OWNER TO postgres;

--
-- Name: nilai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nilai_id_seq OWNED BY nilai.id;


--
-- Name: nilai_seminar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nilai_seminar (
    id integer NOT NULL,
    nilai double precision,
    dosen_id integer,
    status_dosen character varying(30),
    seminar_id integer,
    komponen_nilai_id integer
);


ALTER TABLE nilai_seminar OWNER TO postgres;

--
-- Name: nilai_seminar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nilai_seminar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nilai_seminar_id_seq OWNER TO postgres;

--
-- Name: nilai_seminar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nilai_seminar_id_seq OWNED BY nilai_seminar.id;


--
-- Name: organisasi_idorg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organisasi_idorg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organisasi_idorg_seq OWNER TO postgres;

--
-- Name: organisasi_idorg_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE organisasi_idorg_seq OWNED BY organisasi.idorg;


--
-- Name: paket_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE paket_kelas (
    id integer NOT NULL,
    ta_id integer,
    semester character varying(5),
    tot_sks integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE paket_kelas OWNER TO postgres;

--
-- Name: paket_kelas_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE paket_kelas_detail (
    id integer NOT NULL,
    paket_kelas_id integer,
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE paket_kelas_detail OWNER TO postgres;

--
-- Name: paket_kelas_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paket_kelas_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paket_kelas_detail_id_seq OWNER TO postgres;

--
-- Name: paket_kelas_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paket_kelas_detail_id_seq OWNED BY paket_kelas_detail.id;


--
-- Name: paket_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paket_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paket_kelas_id_seq OWNER TO postgres;

--
-- Name: paket_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paket_kelas_id_seq OWNED BY paket_kelas.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE password_resets OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment (
    id integer NOT NULL,
    nomor character varying(10),
    detail_invoice_id integer,
    jumlah double precision,
    tanggal date,
    ket character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_id_seq OWNED BY payment.id;


--
-- Name: pembayaran_formulir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pembayaran_formulir (
    id integer NOT NULL,
    formulir_id integer,
    tgl_bayar date,
    jumlah double precision,
    nocamaba character varying(20),
    atas_nama character varying(40),
    keterangan character varying(100),
    jenis_bayar character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pembayaran_formulir OWNER TO postgres;

--
-- Name: pembayaran_formulir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pembayaran_formulir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pembayaran_formulir_id_seq OWNER TO postgres;

--
-- Name: pembayaran_formulir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pembayaran_formulir_id_seq OWNED BY pembayaran_formulir.id;


--
-- Name: peminatan_prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE peminatan_prodi (
    id integer NOT NULL,
    kode character varying(10),
    nama character varying(50) NOT NULL,
    kompetensi text,
    prodi_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE peminatan_prodi OWNER TO postgres;

--
-- Name: peminatan_prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peminatan_prodi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE peminatan_prodi_id_seq OWNER TO postgres;

--
-- Name: peminatan_prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peminatan_prodi_id_seq OWNED BY peminatan_prodi.id;


--
-- Name: penanganan_khusus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE penanganan_khusus (
    id integer NOT NULL,
    mahasiswa_mhswid integer,
    "keuangan_statusKeu" boolean,
    "kehadiran_mahasiswa_statusAbsensi" boolean,
    "rencana_studi_statusRencanaStudi" boolean,
    "penilaian_kelas_statusNilai" boolean
);


ALTER TABLE penanganan_khusus OWNER TO postgres;

--
-- Name: penilaian_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE penilaian_kelas (
    id integer NOT NULL,
    persen_absen double precision,
    persen_uts double precision,
    persen_uas double precision,
    persen_tugas1 double precision,
    persen_tugas2 double precision,
    persen_tugas3 double precision,
    persen_presentasi double precision,
    persen_praktik double precision,
    islock smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE penilaian_kelas OWNER TO postgres;

--
-- Name: persentase_nilai_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE persentase_nilai_kelas (
    id integer NOT NULL,
    kelas_id integer,
    komponen_id integer,
    persen double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE persentase_nilai_kelas OWNER TO postgres;

--
-- Name: persentase_nilai_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persentase_nilai_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persentase_nilai_kelas_id_seq OWNER TO postgres;

--
-- Name: persentase_nilai_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persentase_nilai_kelas_id_seq OWNED BY persentase_nilai_kelas.id;


--
-- Name: peserta_kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE peserta_kelas (
    id integer NOT NULL,
    kelas_id integer,
    mhs_id integer,
    nilai_absen double precision,
    nilai_uts double precision,
    nilai_uas double precision,
    nilai_tugas1 double precision,
    nilai_tugas2 double precision,
    nilai_tugas3 double precision,
    nilai_presentase double precision,
    nilai_praktik double precision,
    nilai_akhir double precision,
    grade character varying(2),
    islock smallint DEFAULT 0,
    keterangan character varying(200),
    status_krs smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE peserta_kelas OWNER TO postgres;

--
-- Name: peserta_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peserta_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE peserta_kelas_id_seq OWNER TO postgres;

--
-- Name: peserta_kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peserta_kelas_id_seq OWNED BY peserta_kelas.id;


--
-- Name: pmb_camaba_nilai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pmb_camaba_nilai (
    id integer NOT NULL,
    pmb_materi_uji integer,
    nilai double precision,
    kodesoal character varying(20),
    nocamaba character varying(10),
    islulus smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pmb_camaba_nilai OWNER TO postgres;

--
-- Name: pmb_camaba_nilai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pmb_camaba_nilai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pmb_camaba_nilai_id_seq OWNER TO postgres;

--
-- Name: pmb_camaba_nilai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pmb_camaba_nilai_id_seq OWNED BY pmb_camaba_nilai.id;


--
-- Name: pmb_kegiatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pmb_kegiatan (
    id integer NOT NULL,
    ka_id integer,
    nama character varying(200),
    tgl_daftar character varying(50),
    tgl_ujian date,
    tgl_pengumuman date,
    tgl_daftar_ulang character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pmb_kegiatan OWNER TO postgres;

--
-- Name: pmb_kegiatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pmb_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pmb_kegiatan_id_seq OWNER TO postgres;

--
-- Name: pmb_kegiatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pmb_kegiatan_id_seq OWNED BY pmb_kegiatan.id;


--
-- Name: pmb_materi_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pmb_materi_ujian (
    id integer NOT NULL,
    kode character varying(10),
    nama character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pmb_materi_ujian OWNER TO postgres;

--
-- Name: pmb_materi_ujian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pmb_materi_ujian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pmb_materi_ujian_id_seq OWNER TO postgres;

--
-- Name: pmb_materi_ujian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pmb_materi_ujian_id_seq OWNED BY pmb_materi_ujian.id;


--
-- Name: pmb_nilai_kelulusan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pmb_nilai_kelulusan (
    id integer NOT NULL,
    thn_akademik_id integer,
    pmb_materi_uji integer,
    kelulusan_minimal double precision,
    list_kodesoal character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pmb_nilai_kelulusan OWNER TO postgres;

--
-- Name: pmb_nilai_kelulusan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pmb_nilai_kelulusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pmb_nilai_kelulusan_id_seq OWNER TO postgres;

--
-- Name: pmb_nilai_kelulusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pmb_nilai_kelulusan_id_seq OWNED BY pmb_nilai_kelulusan.id;


--
-- Name: pmb_ujian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pmb_ujian (
    id integer NOT NULL,
    nama character varying(100),
    tanggal date,
    jam_mulai time without time zone,
    jam_akhir time without time zone,
    idruang integer,
    idtahunajaran integer,
    gelombang integer,
    editable smallint DEFAULT 1,
    minkelulusan double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE pmb_ujian OWNER TO postgres;

--
-- Name: pmb_ujian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pmb_ujian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pmb_ujian_id_seq OWNER TO postgres;

--
-- Name: pmb_ujian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pmb_ujian_id_seq OWNED BY pmb_ujian.id;


--
-- Name: prasarana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prasarana (
    id integer NOT NULL,
    alamat character varying(60),
    luas double precision,
    jenis_id integer
)
INHERITS (fasilitas);


ALTER TABLE prasarana OWNER TO postgres;

--
-- Name: prasarana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prasarana_id_seq OWNER TO postgres;

--
-- Name: prasarana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prasarana_id_seq OWNED BY prasarana.id;


--
-- Name: presensi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE presensi (
    id integer NOT NULL,
    prodi_id integer,
    ta_id integer,
    smt character varying(10),
    "prgPendidikan" integer,
    camaba_id integer,
    nim character varying(20),
    mk_id integer,
    pertemuan2 integer,
    tgl_pertemuan2 date,
    pertemuan3 integer,
    tgl_pertemuan3 date,
    pertemuan4 integer,
    tgl_pertemuan4 date,
    pertemuan5 integer,
    tgl_pertemuan5 date,
    pertemuan6 integer,
    tgl_pertemuan6 date,
    pertemuan7 integer,
    tgl_pertemuan7 date,
    pertemuan8 integer,
    tgl_pertemuan8 date,
    pertemuan9 integer,
    tgl_pertemuan9 date,
    pertemuan10 integer,
    tgl_pertemuan10 date,
    pertemuan11 integer,
    tgl_pertemuan11 date,
    pertemuan12 integer,
    tgl_pertemuan12 date,
    pertemuan13 integer,
    tgl_pertemuan13 date,
    pertemuan14 integer,
    tgl_pertemuan14 date,
    nilai_presensi double precision,
    status_presensi status,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    pertemuan1 integer,
    tgl_pertemuan1 date,
    kode_rombel character varying(6)
);


ALTER TABLE presensi OWNER TO postgres;

--
-- Name: presensi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE presensi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE presensi_id_seq OWNER TO postgres;

--
-- Name: presensi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE presensi_id_seq OWNED BY presensi.id;


--
-- Name: prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prodi (
    id integer NOT NULL,
    akreditasi character(1),
    nosk_banpt character varying(30),
    tglsk_banpt date,
    tglakhirsk_banpt date,
    gelar character varying(6),
    jenjang_id integer,
    fakultas_id integer
)
INHERITS (organisasi);


ALTER TABLE prodi OWNER TO postgres;

--
-- Name: prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prodi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prodi_id_seq OWNER TO postgres;

--
-- Name: prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prodi_id_seq OWNED BY prodi.id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE profile (
    user_id integer NOT NULL,
    name character varying(255),
    public_email character varying(255),
    gravatar_email character varying(255),
    gravatar_id character varying(32),
    location character varying(255),
    website character varying(255),
    bio text
);


ALTER TABLE profile OWNER TO postgres;

--
-- Name: program_pendidikan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE program_pendidikan (
    id integer NOT NULL,
    kode character varying(5),
    nama character varying(60),
    aktif smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE program_pendidikan OWNER TO postgres;

--
-- Name: program_pendidikan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE program_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE program_pendidikan_id_seq OWNER TO postgres;

--
-- Name: program_pendidikan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE program_pendidikan_id_seq OWNED BY program_pendidikan.id;


--
-- Name: quisioner_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quisioner_dosen (
    id integer NOT NULL,
    nama character varying(50),
    aktif smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE quisioner_dosen OWNER TO postgres;

--
-- Name: quisioner_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quisioner_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quisioner_dosen_id_seq OWNER TO postgres;

--
-- Name: quisioner_dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quisioner_dosen_id_seq OWNED BY quisioner_dosen.id;


--
-- Name: range_gaji; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE range_gaji (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE range_gaji OWNER TO postgres;

--
-- Name: range_gaji_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE range_gaji_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE range_gaji_id_seq OWNER TO postgres;

--
-- Name: range_gaji_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE range_gaji_id_seq OWNED BY range_gaji.id;


--
-- Name: refkonsul_pa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE refkonsul_pa (
    id integer NOT NULL,
    nama character varying(40),
    urutan smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE refkonsul_pa OWNER TO postgres;

--
-- Name: refkonsul_pa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE refkonsul_pa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE refkonsul_pa_id_seq OWNER TO postgres;

--
-- Name: refkonsul_pa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE refkonsul_pa_id_seq OWNED BY refkonsul_pa.id;


--
-- Name: rencana_studi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rencana_studi (
    id integer NOT NULL,
    matakuliah_id integer,
    khs_detail_grade "char",
    khs_file character varying(200),
    matakuliah_sks integer,
    created_at time without time zone,
    updated_at time without time zone,
    created_by integer,
    updated_by integer,
    jatah_sks integer,
    sks_diambil integer
);


ALTER TABLE rencana_studi OWNER TO postgres;

--
-- Name: retur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE retur (
    id integer NOT NULL,
    tanggal date,
    payment_id integer,
    jumlah double precision,
    ket character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE retur OWNER TO postgres;

--
-- Name: retur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE retur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retur_id_seq OWNER TO postgres;

--
-- Name: retur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE retur_id_seq OWNED BY retur.id;


--
-- Name: rombel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rombel (
    kode character varying(6) NOT NULL,
    dosenpa_id integer,
    nama character varying(30),
    prodi_id integer,
    ta_id integer,
    paket_kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE rombel OWNER TO postgres;

--
-- Name: ruang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ruang (
    id integer NOT NULL,
    gedung_id integer,
    kode character varying(10),
    kapasitas integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE ruang OWNER TO postgres;

--
-- Name: ruang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ruang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ruang_id_seq OWNER TO postgres;

--
-- Name: ruang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ruang_id_seq OWNED BY ruang.id;


--
-- Name: semester; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE semester (
    semester character varying(20) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE semester OWNER TO postgres;

--
-- Name: semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE semester_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE semester_id_seq OWNER TO postgres;

--
-- Name: semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE semester_id_seq OWNED BY semester.id;


--
-- Name: seminar_ta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seminar_ta (
    id integer NOT NULL,
    tgl date,
    ta_id integer,
    nilai_akhir double precision,
    nilai_total_pembimbing double precision,
    nilai_total_penguji1 double precision,
    nilai_total_penguji2 double precision,
    jenis_seminar_id integer
);


ALTER TABLE seminar_ta OWNER TO postgres;

--
-- Name: seminar_ta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seminar_ta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seminar_ta_id_seq OWNER TO postgres;

--
-- Name: seminar_ta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seminar_ta_id_seq OWNED BY seminar_ta.id;


--
-- Name: status_absen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_absen (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE status_absen OWNER TO postgres;

--
-- Name: status_absen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_absen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_absen_id_seq OWNER TO postgres;

--
-- Name: status_absen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_absen_id_seq OWNED BY status_absen.id;


--
-- Name: status_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_dosen (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE status_dosen OWNER TO postgres;

--
-- Name: status_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_dosen_id_seq OWNER TO postgres;

--
-- Name: status_dosen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_dosen_id_seq OWNED BY status_dosen.id;


--
-- Name: status_mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE status_mahasiswa (
    id integer NOT NULL,
    nama character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE status_mahasiswa OWNER TO postgres;

--
-- Name: status_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_mahasiswa_id_seq OWNER TO postgres;

--
-- Name: status_mahasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_mahasiswa_id_seq OWNED BY status_mahasiswa.id;


--
-- Name: studi_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE studi_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studi_mahasiswa_id_seq OWNER TO postgres;

--
-- Name: studi_mahasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE studi_mahasiswa_id_seq OWNED BY khs_detail.id;


--
-- Name: surat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE surat (
    id integer NOT NULL,
    nomor character varying(30),
    tanggal date,
    deskripsi text,
    jenis_id integer,
    orgid_surat integer,
    orgid_pengeluar_surat integer
);


ALTER TABLE surat OWNER TO postgres;

--
-- Name: surat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE surat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE surat_id_seq OWNER TO postgres;

--
-- Name: surat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE surat_id_seq OWNED BY surat.id;


--
-- Name: tahun_akademik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tahun_akademik (
    id integer NOT NULL,
    awal date,
    akhir date,
    nama character varying(10),
    aktif smallint
);


ALTER TABLE tahun_akademik OWNER TO postgres;

--
-- Name: tahun_akademik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tahun_akademik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tahun_akademik_id_seq OWNER TO postgres;

--
-- Name: tahun_akademik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tahun_akademik_id_seq OWNED BY tahun_akademik.id;


--
-- Name: tarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tarif (
    id integer NOT NULL,
    idjenis integer,
    aktif smallint DEFAULT 0,
    jumlah double precision,
    gelombang smallint,
    idta integer,
    deskripsi character varying(200),
    nomor_virtual character varying(20),
    mulai_bayar date,
    akhir_bayar date,
    kode character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE tarif OWNER TO postgres;

--
-- Name: tarif_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tarif_id_seq OWNER TO postgres;

--
-- Name: tarif_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarif_id_seq OWNED BY tarif.id;


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE token (
    user_id integer NOT NULL,
    code character varying(32) NOT NULL,
    created_at integer NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE token OWNER TO postgres;

--
-- Name: transkrip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transkrip (
    id integer NOT NULL,
    mk_id integer,
    grade character(2),
    sks smallint,
    semester character(5),
    bobot double precision,
    mhs_id integer,
    status smallint DEFAULT 1,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE transkrip OWNER TO postgres;

--
-- Name: transkrip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transkrip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transkrip_id_seq OWNER TO postgres;

--
-- Name: transkrip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transkrip_id_seq OWNED BY transkrip.id;


--
-- Name: tugas_akhir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tugas_akhir (
    id integer NOT NULL,
    judul character varying(200),
    dosen_pembimbing_id integer,
    mhs_id integer,
    yudisium_id integer,
    status_akhir character varying(30),
    nilai_rata_ta1 double precision,
    nilai_rata_ta2 double precision,
    grade_ta1 character(2),
    grade_ta2 character(2)
);


ALTER TABLE tugas_akhir OWNER TO postgres;

--
-- Name: tugas_akhir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tugas_akhir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tugas_akhir_id_seq OWNER TO postgres;

--
-- Name: tugas_akhir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tugas_akhir_id_seq OWNED BY tugas_akhir.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(60) NOT NULL,
    auth_key character varying(32) NOT NULL,
    confirmed_at integer,
    unconfirmed_email character varying(255),
    blocked_at integer,
    registration_ip character varying(45),
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    status smallint,
    password_reset_token character varying(255),
    access_token character varying(32),
    last_login_time timestamp without time zone,
    last_login_ip character varying(20)
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: virtual_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE virtual_bank (
    nomor character varying(20) NOT NULL,
    bank_id integer,
    aktif smallint DEFAULT 0,
    jenis_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE virtual_bank OWNER TO postgres;

--
-- Name: vw_akad_bayar; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_akad_bayar AS
 SELECT b.id,
    a.nim,
    a.tanggal,
    b.idakad,
    c.deskripsi,
    b.nilai,
    b.qty,
    (b.nilai * (b.qty)::double precision) AS subtotal,
    b.islunas
   FROM ((akad_bayar a
     JOIN detail_akad_bayar b ON ((a.id = b.idakad)))
     JOIN tarif c ON ((c.id = b.idtarif)));


ALTER TABLE vw_akad_bayar OWNER TO postgres;

--
-- Name: vw_surat; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vw_surat AS
 SELECT a.id,
    a.nomor,
    a.tanggal,
    a.deskripsi,
    a.jenis_id,
    a.orgid_surat,
    a.orgid_pengeluar_surat,
    date_part('year'::text, a.tanggal) AS tahun,
    date_part('month'::text, a.tanggal) AS bulan,
    b.kategori_id
   FROM (surat a
     JOIN jenis_surat b ON ((a.jenis_id = b.id)))
  ORDER BY a.tanggal;


ALTER TABLE vw_surat OWNER TO postgres;

--
-- Name: waktu_pa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE waktu_pa (
    id integer NOT NULL,
    nama character varying(40)
);


ALTER TABLE waktu_pa OWNER TO postgres;

--
-- Name: waktu_pa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE waktu_pa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE waktu_pa_id_seq OWNER TO postgres;

--
-- Name: waktu_pa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE waktu_pa_id_seq OWNED BY waktu_pa.id;


--
-- Name: yudisium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE yudisium (
    id integer NOT NULL,
    tgl date,
    no_sk character varying(45),
    semester character varying(5),
    berita_acara text
);


ALTER TABLE yudisium OWNER TO postgres;

--
-- Name: yudisium_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE yudisium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE yudisium_id_seq OWNER TO postgres;

--
-- Name: yudisium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE yudisium_id_seq OWNED BY yudisium.id;


--
-- Name: absen_dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_dosen ALTER COLUMN id SET DEFAULT nextval('absen_dosen_id_seq'::regclass);


--
-- Name: absen_mahasiswa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa ALTER COLUMN id SET DEFAULT nextval('absen_mahasiswa_id_seq'::regclass);


--
-- Name: akad_bayar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_bayar ALTER COLUMN id SET DEFAULT nextval('akad_bayar_id_seq'::regclass);


--
-- Name: akad_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_kelas ALTER COLUMN id SET DEFAULT nextval('akad_kelas_id_seq'::regclass);


--
-- Name: article_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_categories ALTER COLUMN id SET DEFAULT nextval('article_categories_id_seq'::regclass);


--
-- Name: article_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_items ALTER COLUMN id SET DEFAULT nextval('article_items_id_seq'::regclass);


--
-- Name: bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank ALTER COLUMN id SET DEFAULT nextval('bank_id_seq'::regclass);


--
-- Name: beasiswa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beasiswa ALTER COLUMN id SET DEFAULT nextval('beasiswa_id_seq'::regclass);


--
-- Name: bimbingan_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_detail ALTER COLUMN id SET DEFAULT nextval('bimbingan_detail_id_seq'::regclass);


--
-- Name: bimbingan_pa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa ALTER COLUMN id SET DEFAULT nextval('bimbingan_pa_id_seq'::regclass);


--
-- Name: camaba id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba ALTER COLUMN id SET DEFAULT nextval('camaba_id_seq'::regclass);


--
-- Name: camaba_kebutuhan_khusus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_kebutuhan_khusus ALTER COLUMN id SET DEFAULT nextval('camaba_kebutuhan_khusus_id_seq'::regclass);


--
-- Name: camaba_prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_prodi ALTER COLUMN id SET DEFAULT nextval('camaba_prodi_id_seq'::regclass);


--
-- Name: counter_nosurat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counter_nosurat ALTER COLUMN id SET DEFAULT nextval('counter_nosurat_id_seq'::regclass);


--
-- Name: detail_akad_bayar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_akad_bayar ALTER COLUMN id SET DEFAULT nextval('detail_akad_bayar_id_seq'::regclass);


--
-- Name: detail_bimbinganpa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_bimbinganpa ALTER COLUMN id SET DEFAULT nextval('detail_bimbinganpa_id_seq'::regclass);


--
-- Name: detail_invoice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_invoice ALTER COLUMN id SET DEFAULT nextval('detail_invoice_id_seq'::regclass);


--
-- Name: detail_paket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_paket ALTER COLUMN id SET DEFAULT nextval('detail_paket_id_seq'::regclass);


--
-- Name: dosen aktif; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen ALTER COLUMN aktif SET DEFAULT 0;


--
-- Name: dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen ALTER COLUMN id SET DEFAULT nextval('dosen_id_seq'::regclass);


--
-- Name: elearning_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elearning_kelas ALTER COLUMN id SET DEFAULT nextval('elearning_kelas_id_seq'::regclass);


--
-- Name: fakultas idorg; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fakultas ALTER COLUMN idorg SET DEFAULT nextval('organisasi_idorg_seq'::regclass);


--
-- Name: fakultas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fakultas ALTER COLUMN id SET DEFAULT nextval('fakultas_id_seq'::regclass);


--
-- Name: formulir id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulir ALTER COLUMN id SET DEFAULT nextval('formulir_id_seq'::regclass);


--
-- Name: invoice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice ALTER COLUMN id SET DEFAULT nextval('invoice_id_seq'::regclass);


--
-- Name: jabatan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jabatan ALTER COLUMN id SET DEFAULT nextval('jabatan_id_seq'::regclass);


--
-- Name: jadwal_praktikum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jadwal_praktikum ALTER COLUMN id SET DEFAULT nextval('jadwal_praktikum_id_seq'::regclass);


--
-- Name: jafung id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jafung ALTER COLUMN id SET DEFAULT nextval('jafung_id_seq'::regclass);


--
-- Name: jalur_studi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jalur_studi ALTER COLUMN id SET DEFAULT nextval('jalur_studi_id_seq'::regclass);


--
-- Name: jamke id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jamke ALTER COLUMN id SET DEFAULT nextval('jamke_id_seq'::regclass);


--
-- Name: jenis_bimbingan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_bimbingan ALTER COLUMN id SET DEFAULT nextval('jenis_bimbingan_id_seq'::regclass);


--
-- Name: jenis_pekerjaan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_pekerjaan ALTER COLUMN id SET DEFAULT nextval('jenis_pekerjaan_id_seq'::regclass);


--
-- Name: jenis_pembayaran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_pembayaran ALTER COLUMN id SET DEFAULT nextval('jenis_pembayaran_id_seq'::regclass);


--
-- Name: jenis_prasarana id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_prasarana ALTER COLUMN id SET DEFAULT nextval('jenis_prasarana_id_seq'::regclass);


--
-- Name: jenis_ruang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_ruang ALTER COLUMN id SET DEFAULT nextval('jenis_ruang_id_seq'::regclass);


--
-- Name: jenis_seminar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_seminar ALTER COLUMN id SET DEFAULT nextval('jenis_sidang_id_seq'::regclass);


--
-- Name: jenis_surat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_surat ALTER COLUMN id SET DEFAULT nextval('jenis_surat_id_seq'::regclass);


--
-- Name: jenjang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenjang ALTER COLUMN id SET DEFAULT nextval('jenjang_id_seq'::regclass);


--
-- Name: kalendar_akademik id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendar_akademik ALTER COLUMN id SET DEFAULT nextval('kalendar_akademik_id_seq'::regclass);


--
-- Name: kampus idorg; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kampus ALTER COLUMN idorg SET DEFAULT nextval('organisasi_idorg_seq'::regclass);


--
-- Name: kampus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kampus ALTER COLUMN id SET DEFAULT nextval('kampus_id_seq'::regclass);


--
-- Name: kategori_kampus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_kampus ALTER COLUMN id SET DEFAULT nextval('kategori_kampus_id_seq'::regclass);


--
-- Name: kategori_matakuliah id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_matakuliah ALTER COLUMN id SET DEFAULT nextval('kategori_matakuliah_id_seq'::regclass);


--
-- Name: kategori_nilai_ta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_nilai_ta ALTER COLUMN id SET DEFAULT nextval('kategori_nilai_ta_id_seq'::regclass);


--
-- Name: kategori_surat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_surat ALTER COLUMN id SET DEFAULT nextval('kategori_surat_id_seq'::regclass);


--
-- Name: kebutuhan_khusus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kebutuhan_khusus ALTER COLUMN id SET DEFAULT nextval('kebutuhan_khusus_id_seq'::regclass);


--
-- Name: kegiatan_akademik id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kegiatan_akademik ALTER COLUMN id SET DEFAULT nextval('kegiatan_akademik_id_seq'::regclass);


--
-- Name: kehadiran_dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_dosen ALTER COLUMN id SET DEFAULT nextval('kehadiran_dosen_id_seq'::regclass);


--
-- Name: kehadiran_mahasiswa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_mahasiswa ALTER COLUMN id SET DEFAULT nextval('kehadiran_mahasiswa_id_seq'::regclass);


--
-- Name: kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas ALTER COLUMN id SET DEFAULT nextval('kelas_id_seq'::regclass);


--
-- Name: kelas_prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas_prodi ALTER COLUMN id SET DEFAULT nextval('kelas_prodi_id_seq'::regclass);


--
-- Name: keuangan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keuangan ALTER COLUMN id SET DEFAULT nextval('keuangan_id_seq'::regclass);


--
-- Name: khs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs ALTER COLUMN id SET DEFAULT nextval('khs_id_seq'::regclass);


--
-- Name: khs_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail ALTER COLUMN id SET DEFAULT nextval('studi_mahasiswa_id_seq'::regclass);


--
-- Name: khs_detail_komponen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail_komponen ALTER COLUMN id SET DEFAULT nextval('detail_hasil_studi_id_seq'::regclass);


--
-- Name: komponen_nilai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komponen_nilai ALTER COLUMN id SET DEFAULT nextval('komponen_nilai_id_seq'::regclass);


--
-- Name: komponen_nilai_seminar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komponen_nilai_seminar ALTER COLUMN id SET DEFAULT nextval('komponen_nilai_seminar_id_seq'::regclass);


--
-- Name: kpi_dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kpi_dosen ALTER COLUMN id SET DEFAULT nextval('kpi_dosen_id_seq'::regclass);


--
-- Name: krs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs ALTER COLUMN id SET DEFAULT nextval('krs_id_seq'::regclass);


--
-- Name: krs_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs_detail ALTER COLUMN id SET DEFAULT nextval('krs_detail_id_seq'::regclass);


--
-- Name: kuisioner_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kuisioner_kelas ALTER COLUMN id SET DEFAULT nextval('kuisioner_kelas_id_seq'::regclass);


--
-- Name: kurikulum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum ALTER COLUMN id SET DEFAULT nextval('kurikulum_id_seq'::regclass);


--
-- Name: kurikulum_matakuliah id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum_matakuliah ALTER COLUMN id SET DEFAULT nextval('kurikulum_matakuliah_id_seq'::regclass);


--
-- Name: log_ta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_ta ALTER COLUMN id SET DEFAULT nextval('log_ta_id_seq'::regclass);


--
-- Name: mahasiswa mhsid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa ALTER COLUMN mhsid SET DEFAULT nextval('mahasiswa_mhsid_seq'::regclass);


--
-- Name: matakuliah id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matakuliah ALTER COLUMN id SET DEFAULT nextval('matakuliah_id_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: nilai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai ALTER COLUMN id SET DEFAULT nextval('nilai_id_seq'::regclass);


--
-- Name: nilai_seminar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai_seminar ALTER COLUMN id SET DEFAULT nextval('nilai_seminar_id_seq'::regclass);


--
-- Name: organisasi idorg; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY organisasi ALTER COLUMN idorg SET DEFAULT nextval('organisasi_idorg_seq'::regclass);


--
-- Name: paket_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas ALTER COLUMN id SET DEFAULT nextval('paket_kelas_id_seq'::regclass);


--
-- Name: paket_kelas_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas_detail ALTER COLUMN id SET DEFAULT nextval('paket_kelas_detail_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment ALTER COLUMN id SET DEFAULT nextval('payment_id_seq'::regclass);


--
-- Name: pembayaran_formulir id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pembayaran_formulir ALTER COLUMN id SET DEFAULT nextval('pembayaran_formulir_id_seq'::regclass);


--
-- Name: peminatan_prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peminatan_prodi ALTER COLUMN id SET DEFAULT nextval('peminatan_prodi_id_seq'::regclass);


--
-- Name: persentase_nilai_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persentase_nilai_kelas ALTER COLUMN id SET DEFAULT nextval('persentase_nilai_kelas_id_seq'::regclass);


--
-- Name: peserta_kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peserta_kelas ALTER COLUMN id SET DEFAULT nextval('peserta_kelas_id_seq'::regclass);


--
-- Name: pmb_camaba_nilai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_camaba_nilai ALTER COLUMN id SET DEFAULT nextval('pmb_camaba_nilai_id_seq'::regclass);


--
-- Name: pmb_kegiatan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_kegiatan ALTER COLUMN id SET DEFAULT nextval('pmb_kegiatan_id_seq'::regclass);


--
-- Name: pmb_materi_ujian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_materi_ujian ALTER COLUMN id SET DEFAULT nextval('pmb_materi_ujian_id_seq'::regclass);


--
-- Name: pmb_nilai_kelulusan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_nilai_kelulusan ALTER COLUMN id SET DEFAULT nextval('pmb_nilai_kelulusan_id_seq'::regclass);


--
-- Name: pmb_ujian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_ujian ALTER COLUMN id SET DEFAULT nextval('pmb_ujian_id_seq'::regclass);


--
-- Name: prasarana id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prasarana ALTER COLUMN id SET DEFAULT nextval('prasarana_id_seq'::regclass);


--
-- Name: presensi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi ALTER COLUMN id SET DEFAULT nextval('presensi_id_seq'::regclass);


--
-- Name: prodi idorg; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prodi ALTER COLUMN idorg SET DEFAULT nextval('organisasi_idorg_seq'::regclass);


--
-- Name: prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prodi ALTER COLUMN id SET DEFAULT nextval('prodi_id_seq'::regclass);


--
-- Name: program_pendidikan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY program_pendidikan ALTER COLUMN id SET DEFAULT nextval('program_pendidikan_id_seq'::regclass);


--
-- Name: quisioner_dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quisioner_dosen ALTER COLUMN id SET DEFAULT nextval('quisioner_dosen_id_seq'::regclass);


--
-- Name: range_gaji id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY range_gaji ALTER COLUMN id SET DEFAULT nextval('range_gaji_id_seq'::regclass);


--
-- Name: refkonsul_pa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refkonsul_pa ALTER COLUMN id SET DEFAULT nextval('refkonsul_pa_id_seq'::regclass);


--
-- Name: retur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retur ALTER COLUMN id SET DEFAULT nextval('retur_id_seq'::regclass);


--
-- Name: ruang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ruang ALTER COLUMN id SET DEFAULT nextval('ruang_id_seq'::regclass);


--
-- Name: semester id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semester ALTER COLUMN id SET DEFAULT nextval('semester_id_seq'::regclass);


--
-- Name: seminar_ta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seminar_ta ALTER COLUMN id SET DEFAULT nextval('seminar_ta_id_seq'::regclass);


--
-- Name: status_absen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_absen ALTER COLUMN id SET DEFAULT nextval('status_absen_id_seq'::regclass);


--
-- Name: status_dosen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_dosen ALTER COLUMN id SET DEFAULT nextval('status_dosen_id_seq'::regclass);


--
-- Name: status_mahasiswa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_mahasiswa ALTER COLUMN id SET DEFAULT nextval('status_mahasiswa_id_seq'::regclass);


--
-- Name: surat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surat ALTER COLUMN id SET DEFAULT nextval('surat_id_seq'::regclass);


--
-- Name: tahun_akademik id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tahun_akademik ALTER COLUMN id SET DEFAULT nextval('tahun_akademik_id_seq'::regclass);


--
-- Name: tarif id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif ALTER COLUMN id SET DEFAULT nextval('tarif_id_seq'::regclass);


--
-- Name: transkrip id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transkrip ALTER COLUMN id SET DEFAULT nextval('transkrip_id_seq'::regclass);


--
-- Name: tugas_akhir id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tugas_akhir ALTER COLUMN id SET DEFAULT nextval('tugas_akhir_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: waktu_pa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY waktu_pa ALTER COLUMN id SET DEFAULT nextval('waktu_pa_id_seq'::regclass);


--
-- Name: yudisium id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY yudisium ALTER COLUMN id SET DEFAULT nextval('yudisium_id_seq'::regclass);


--
-- Data for Name: absen_dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY absen_dosen (id, tgl, jam_masuk, jam_pulang, materi, tmke, kelas_id, dosen_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: absen_dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('absen_dosen_id_seq', 1, false);


--
-- Data for Name: absen_mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY absen_mahasiswa (id, tgl, kelas_id, tmke, mhsid, status_id, prodi_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: absen_mahasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('absen_mahasiswa_id_seq', 1, false);


--
-- Data for Name: akad_bayar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY akad_bayar (id, tanggal, islunas, nocamaba, nim, total, isbeastudi, keterangan, created_at, updated_at, created_by, updated_by) FROM stdin;
1	2015-08-01 00:00:00	\N	\N	0110215004	\N	0	\N	\N	\N	\N	\N
2	2015-08-01 00:00:00	\N	\N	0110115007	\N	0	\N	\N	\N	\N	\N
\.


--
-- Name: akad_bayar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('akad_bayar_id_seq', 2, true);


--
-- Data for Name: akad_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY akad_kelas (id, kelas_id, komponen_id, persen, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: akad_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('akad_kelas_id_seq', 1, false);


--
-- Data for Name: article_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY article_attachments (id, itemid, filename, title, "titleAttribute", hits) FROM stdin;
\.


--
-- Data for Name: article_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY article_categories (id, name, alias, description, parentid, state, access, language, ordering, image, image_caption, image_credits, params, metadesc, metakey, robots, author, copyright) FROM stdin;
2	Berita Akademik	berita-umum	<p>Berita Akademik</p>\r\n	0	1	0	it-IT  	0				{"categoriesImageWidth":"small","categoriesViewData":"1","categoryImageWidth":"small","categoryViewData":"1","itemImageWidth":"small","itemViewData":"1"}			index, follow		
1	Kegiatan Kampus	berita-kementerian	<p>Berita yang berisi tentang kegiatan kampus</p>\r\n	0	1	0	it-IT  	0				{"categoriesImageWidth":"small","categoriesViewData":"1","categoryImageWidth":"small","categoryViewData":"1","itemImageWidth":"small","itemViewData":"1"}			index, follow		
\.


--
-- Name: article_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('article_categories_id_seq', 2, true);


--
-- Data for Name: article_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY article_items (id, title, alias, catid, userid, introtext, fulltext, state, access, language, ordering, hits, image, image_caption, image_credits, video, video_type, video_caption, video_credits, created, created_by, modified, modified_by, params, metadesc, metakey, robots, author, copyright) FROM stdin;
3	Penandatangan Akad Bastudi STT NF	penandatangan-akad-bastudi-stt-nf	1	1	<p>Setelah melalui proses seleksi sebanyak dua gelombang dan melalui berbagai tahap, akhirnya terpilih 26 mahasiswa baru yang berhak mendapatkan Beastudi Dhuafa Berprestasi. Mereka akan mendapat beastudi selama empat tahun atau hingga lulus sarjana. Mahasiswa dhuafa berprestasi ini berasal dari seluruh Indonesia yang telah melewati berbagai tahapan seleksi ketat oleh tim beastudi STT NF.</p>\r\n\r\n<p>Pada Senin (7/9) bertempat di kampus B STT NF dilakukan penandatanganan akad/perjanjian beastudi dhuafa berprestasi. Acara dihadiri oleh seluruh penerima beastudi, dimulai dengan perkenalan bagian terkait, khususnya Bagian Kemahasiswaan dan Kemitraan yang menangani beastudi. Kedua unit itu nantinya akan berhubungan langsung dengan para penerima beastudi.</p>\r\n	<p>Setelah melalui proses seleksi sebanyak dua gelombang dan melalui berbagai tahap, akhirnya terpilih 26 mahasiswa baru yang berhak mendapatkan Beastudi Dhuafa Berprestasi. Mereka akan mendapat beastudi selama empat tahun atau hingga lulus sarjana. Mahasiswa dhuafa berprestasi ini berasal dari seluruh Indonesia yang telah melewati berbagai tahapan seleksi ketat oleh tim beastudi STT NF.</p>\r\n\r\n<p>Pada Senin (7/9) bertempat di kampus B STT NF dilakukan penandatanganan akad/perjanjian beastudi dhuafa berprestasi. Acara dihadiri oleh seluruh penerima beastudi, dimulai dengan perkenalan bagian terkait, khususnya Bagian Kemahasiswaan dan Kemitraan yang menangani beastudi. Kedua unit itu nantinya akan berhubungan langsung dengan para penerima beastudi.</p>\r\n\r\n<p>Selanjutnya pemaparan maksud dan tujuan diadakannya beastudi dijabarkan oleh Puket III STT NF, Adi Wahyu Adji, yang membidangi kemahasiswaan, &quot;Beastudi STT NF sudah memasuki angkatan keempat. Dari angkatan pertama hingga saat ini, fasilitas yang diberikan semakin berkembang. Yang terbaru di tahun ini adalah disediakan fasilitas asrama,&quot; Adji menjelaskan.</p>\r\n\r\n<p>Selesai pemaparan tentang isi surat perjanjian serta apa saja hak dan kewajiban dari masing- pihak, selanjutnya diadakan sesi tanya jawab. Pertanyaan menjadi penting bagi mahasiswa untuk memahami hak dan kewajiban mereka nantinya.</p>\r\n	1	0	it-IT  	0	1	penandatangan-akad-bastudi-stt-nf.jpg				youtube			2015-10-11 17:20:54	0	2015-12-02 16:21:43	0				index, follow		
4	ORMIK STT NF Menggelar Motivation Training	ormik-stt-nf-menggelar-motivation-training	1	1	<p>Pada hari pertama kegiatan ORMIK STT NF, panitia mengundang motivator Rully Onzo atau biasa disapa OnzoVator. Tujuannya untuk meningkatkan semangat para mahasiswa baru menyambut masa perkuliahan. Pada awal kedatangan, sang motivator disambut dengan alunan musik syahdu. Itu mengingatkan semua pendengar kepada para pejuang yang telah berkorban merebut kemerdekaan Indonesia. Onzo membakar semangat nasionalisme para mahasiswa baru dengan mengingatkan kembali jasa-jasa para pejuang dan pendiri bangsa.</p>\r\n\r\n<p>Dengan gayanya yang cocok untuk generasi muda, Onzo berhasil membangkitkan gairah para mahasiswa. Berbagai tayangan video dan permainan motivasi membuat suasana lebih menyenangkan dan interaktif.</p>\r\n\r\n<p>Ketua ORMIK 2015, M. Natsir, mengungkapkan alasan mengundang OnzoVator. &quot;Ia merupakan trainner motivasi yang dapat membangun semangat kawula muda untuk menjadi pribadi tangguh dalam menggapai cita-cita, serta menjadi agen perubahan untuk bangsa. Diharapkan dengan training motivasi ini mahasiswa STT NF dapat lebih bersemangat untuk melahirkan karya-karya hebat di masa yang akan datang,&quot; ungkap Natsir.</p>\r\n	<p>Pada hari pertama kegiatan ORMIK STT NF, panitia mengundang motivator Rully Onzo atau biasa disapa OnzoVator. Tujuannya untuk meningkatkan semangat para mahasiswa baru menyambut masa perkuliahan. Pada awal kedatangan, sang motivator disambut dengan alunan musik syahdu. Itu mengingatkan semua pendengar kepada para pejuang yang telah berkorban merebut kemerdekaan Indonesia. Onzo membakar semangat nasionalisme para mahasiswa baru dengan mengingatkan kembali jasa-jasa para pejuang dan pendiri bangsa.</p>\r\n\r\n<p>Dengan gayanya yang cocok untuk generasi muda, Onzo berhasil membangkitkan gairah para mahasiswa. Berbagai tayangan video dan permainan motivasi membuat suasana lebih menyenangkan dan interaktif.</p>\r\n\r\n<p>Ketua ORMIK 2015, M. Natsir, mengungkapkan alasan mengundang OnzoVator. &quot;Ia merupakan trainner motivasi yang dapat membangun semangat kawula muda untuk menjadi pribadi tangguh dalam menggapai cita-cita, serta menjadi agen perubahan untuk bangsa. Diharapkan dengan training motivasi ini mahasiswa STT NF dapat lebih bersemangat untuk melahirkan karya-karya hebat di masa yang akan datang,&quot; ungkap Natsir.</p>\r\n\r\n<p>&quot;Dengan melihat kekayaan alam negara kita yang sangat berlimpah, namun bertolak belakang dengan keadaan rakyat indonesia yang jauh di bawah kondisi layak, maka memaksa kita sebagai pemuda harus menjadi agen perubahan demi membangkitkan bangsa ini dari keterpurukan,&quot; lanjut Natsir.</p>\r\n\r\n<p>Di akhir acara OnzoVator meminta para mahasiswa menuliskan cita-cita mereka di secarik kertas, lalu diangkat tinggi-tinggi dan dilempar ke atas sebagai simbol bahwa cita-cita yang telah tertulis akan terbang tinggi dan menjadi kenyataan. Acara yang berdurasi kurang lebih satu jam itu diakhiri dengan muhasabah untuk merefleksikan apa saja kesalahan yang telah diperbuat di masa lalu, agar tidak terulang di masa depan. Pelatihan ini sangat berguna membangun semangat baru menyambut hari baru di masa perkuliahan. (Hendri Nurdiansyah)</p>\r\n	1	0	it-IT  	0	1	ormik-stt-nf-menggelar-motivation-training.jpg				youtube			2015-10-12 14:33:00	0	2015-12-02 16:24:50	0				index, follow		
5	STT NF Memulai Orientasi Akademik 2015	stt-nf-memulai-orientasi-akademik-2015	1	1	<p>Ketua STT Nurul Fikri, Drs. Rusmanto, MM menyematkan pin secara simbolik kepada salah seorang mahasiswa baru dan memukul gong sebagai tanda dimulainya pekan kegiatan Ormik 2015 pada Rabu (9/9). Dalam sambutannya Ketua STT NF mengucapkan selamat datang pada mahasiswa baru dan berharap para mahasiswa dapat menyerap ilmu yang akan diberikan.</p>\r\n\r\n<p>&quot;Saya mendorong seluruh mahasiswa, yang baru atau lama, agar berani berkarya di bidang teknologi informasi. Anda memang sedang belajar, tapi potensinya sangat besar,&quot; ujar Rusmanto.</p>\r\n\r\n<p>Acara pembukaan dihadiri pula Ketua Dewan Pembina Yayasan Bina Nurul Fikri, Drs. Musholi, Puket 1 Sirojul Munir, S.Si., M.Kom, dan Puket 3 Adi Wahyu Adji, S.Si. Acara resmi dibuka dengan pembacaan ayat suci Al-Quran serta sari tilawah yang dibawakan Arif Munandar dan Umul Sidikoh, mahasiswa STT NF angkatan 2014. Ormik kali ini bertema<em>&nbsp;Muda, Beda dan Berkarya</em>&nbsp;dengan tagline&nbsp;<em>&quot;Kami Muda, Berani Beda dan Siap Berkarya&quot;</em>. Peserta Ormik terlihat sangat berbeda dengan nuansa Eksekutif Muda. Tema ini bermaksud membangun semangat para mahasiswa agar bersungguh-sungguh dalam menimba ilmu, sehingga dapat menjadi seseorang yang mereka inginkan, sukses di usia muda.</p>\r\n	<p>Ketua STT Nurul Fikri, Drs. Rusmanto, MM menyematkan pin secara simbolik kepada salah seorang mahasiswa baru dan memukul gong sebagai tanda dimulainya pekan kegiatan Ormik 2015 pada Rabu (9/9). Dalam sambutannya Ketua STT NF mengucapkan selamat datang pada mahasiswa baru dan berharap para mahasiswa dapat menyerap ilmu yang akan diberikan.</p>\r\n\r\n<p>&quot;Saya mendorong seluruh mahasiswa, yang baru atau lama, agar berani berkarya di bidang teknologi informasi. Anda memang sedang belajar, tapi potensinya sangat besar,&quot; ujar Rusmanto.</p>\r\n\r\n<p>Acara pembukaan dihadiri pula Ketua Dewan Pembina Yayasan Bina Nurul Fikri, Drs. Musholi, Puket 1 Sirojul Munir, S.Si., M.Kom, dan Puket 3 Adi Wahyu Adji, S.Si. Acara resmi dibuka dengan pembacaan ayat suci Al-Quran serta sari tilawah yang dibawakan Arif Munandar dan Umul Sidikoh, mahasiswa STT NF angkatan 2014. Ormik kali ini bertema<em>&nbsp;Muda, Beda dan Berkarya</em>&nbsp;dengan tagline&nbsp;<em>&quot;Kami Muda, Berani Beda dan Siap Berkarya&quot;</em>. Peserta Ormik terlihat sangat berbeda dengan nuansa Eksekutif Muda. Tema ini bermaksud membangun semangat para mahasiswa agar bersungguh-sungguh dalam menimba ilmu, sehingga dapat menjadi seseorang yang mereka inginkan, sukses di usia muda.</p>\r\n\r\n<p>Sebelum memulai Ormik, panitia disibukan dengan persiapan beberapa rangkaian acara, termasuk gladi resik sehari sebelum pembukaan, bersama Puket 3. Panitia mengadakan acara briefing bersama seluruh peserta Ormik pada Sabtu (5/9) untuk mensosialisasikan konsep Ormik serta tugas yang harus dikerjakan untuk empat hari acara Ormik. Dewan Perwakilan Mahasiswa mempercayai Muhammad Natsir sebagai Ketua Panitia dibantu oleh beberapa staf di setiap bidang.</p>\r\n\r\n<p>Sebagai pembicara kunci, Drs. Musholi menuturkan awal berdirinya Yayasan Nurul Fikri, dimulai dari mendirikan Bimbingan Belajar, dilanjutkan dengan SDIT pertama di Indonesia, hingga tahun 2012 mengembangkan STT NF. &quot;Insya Allah, pada tahun 2020, STT NF sudah berganti wajah menjadi Universitas Nurul Fikri. Para mahasiswa menjadi salah satu pilar penting untuk mewujudkan visi tersebut, disamping dosen dan sarana yang diperlukan,&quot; ungkap Musholi. Dengan Ormik, mahasiswa STT NF menyambut era baru dalam kehidupan akademis. (Ratih Septia Giri)</p>\r\n	1	0	it-IT  	0	1	stt-nf-memulai-orientasi-akademik-2015.jpg				youtube			2015-10-12 14:54:13	0	2015-12-02 16:27:14	0				index, follow		
6	Dosen STT NF Lulus Sertifikasi Oracle Academy dengan Nilai Baik	dosen-stt-nf-lulus-sertifikasi-oracle-academy-dengan-nilai-baik	2	1	<p>Dalam rangka meningkatkan kualitas dan kemampuan bahasa pemrograman, Dosen STT NF mengikuti training Java Fundamental diselenggarakan oleh Oracle Academy. Acara dilaksanakan di Menara 165, Cilandak, pada 26 &ndash; 30 Januari 2015 lalu.</p>\r\n\r\n<p>Training ini diikuti oleh peserta terbatas, hanya 21 orang peserta yang merupakan perwakilan dari Perguruan Tingggi sekawasan Jakarta-Bogor-Depok-Tangerang-Bekasi. Karena materi yang disampaikan sangat sulit dan membutuhkan konsentrasi tinggi, sehingga peserta diberikan kesempatan jeda pagi, siang dan petang.</p>\r\n\r\n<p>Java adalah bahasa pemrograman berorientasi objek atau lebih dikenal dengan OOP (<em>Object Oriented Programming</em>). Java Fundamental merupakan materi dasar dalam bahasa pemrograman yang banyak dipakai para pengguna.</p>\r\n\r\n<p>Selain pembahasan tentang Java, pelatihan juga memaparkan dan mengajarkan materi baru, yaitu Aplikasi Alice untuk Game 3D dan Greenfoot untuk 2D. STT NF diwakili oleh dua orang Dosen Tetap, yaitu Indra Hermawan S.Kom, M.Kom dan Zaki Imaddudin S.T, M.Kom.</p>\r\n	<p>Dalam rangka meningkatkan kualitas dan kemampuan bahasa pemrograman, Dosen STT NF mengikuti training Java Fundamental diselenggarakan oleh Oracle Academy. Acara dilaksanakan di Menara 165, Cilandak, pada 26 &ndash; 30 Januari 2015 lalu.</p>\r\n\r\n<p>Training ini diikuti oleh peserta terbatas, hanya 21 orang peserta yang merupakan perwakilan dari Perguruan Tingggi sekawasan Jakarta-Bogor-Depok-Tangerang-Bekasi. Karena materi yang disampaikan sangat sulit dan membutuhkan konsentrasi tinggi, sehingga peserta diberikan kesempatan jeda pagi, siang dan petang.</p>\r\n\r\n<p>Java adalah bahasa pemrograman berorientasi objek atau lebih dikenal dengan OOP (<em>Object Oriented Programming</em>). Java Fundamental merupakan materi dasar dalam bahasa pemrograman yang banyak dipakai para pengguna.</p>\r\n\r\n<p>Selain pembahasan tentang Java, pelatihan juga memaparkan dan mengajarkan materi baru, yaitu Aplikasi Alice untuk Game 3D dan Greenfoot untuk 2D. STT NF diwakili oleh dua orang Dosen Tetap, yaitu Indra Hermawan S.Kom, M.Kom dan Zaki Imaddudin S.T, M.Kom.</p>\r\n\r\n<p>Tujuan pelatihan yaitu untuk meningkatkan kemampuan peserta tentang pemrograman Java. Disamping itu, juga sebagai syarat untuk mengikuti ujian dan mendapatkan sertifikasi, sehingga dengan adanya sertifikasi itu kemampuan dosen lebih diakui.</p>\r\n\r\n<p>Pada hari terakhir pelatihan, seluruh peserta diberi soal 60 pilihan ganda dengan durasi 120 menit. Banyak sekali peserta yang gagal lolos, karena nilai minimal yang harus diperoleh adalah 60. Tetapi pada proses ini panitia memberikan kesempatan sampai 3 kali, sehingga peserta bisa kembali mencobanya. Akhirnya semua peserta lolos dan mendapatkan sertifikasi.</p>\r\n\r\n<p>Perwakilan dari STT NF, alhamdulillah, bisa lolos dengan hanya sekali tes saja. Bahkan, Indra Hermawan mendapatkan nilai 85 dengan kategori A. Demikian pula, Zaki Imaddudin, mendapat nilai cukup baik hanya sekali tes.</p>\r\n\r\n<p>&quot;Saya bersyukur dan antusias mengikuti training ini, karena bisa lebih memahami secara spesifik mengenai Java Fundamental. Alhamdulillah, berkat perjuangan keras dapat sertifikasi dengan standar internasional,&quot; ujar Zaki.</p>\r\n\r\n<p>Instruktur dari Oracle Academy, Hatma Suryotrisongko, berpesan: &quot;Agar seluruh peserta nanti mengajarkan kembali kepada para mahasiswa di kampus masing-masing, sehingga apa yang sudah dipelajari dalam pelatihan ini akan berdampak lebih luas.&quot; (Krisna Panji)</p>\r\n	1	0	it-IT  	0	1	dosen-stt-nf-lulus-sertifikasi-oracle-academy-dengan-nilai-baik.jpg				youtube			2015-12-25 06:40:27	0	2015-12-25 06:51:55	0				index, follow		
\.


--
-- Name: article_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('article_items_id_seq', 6, true);


--
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_assignment (item_name, user_id, created_at) FROM stdin;
ADMIN	1	1444819421
MHS	2	1449082703
DOSEN PA	6	1449082718
ADMIN KEU	7	1449082836
KASIR KEU	8	1449082851
ADMIN AKADEMIK	9	1449084101
DOSEN	10	1451233821
DOSEN	6	1451234088
MHS	11	1453131389
DOSEN PA	12	1453134447
DOSEN	12	1453134451
CAMABA	34	1460120295
ADMIN	35	1502930992
\.


--
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
/gridview/export/download	2	\N	\N	\N	1444804952	1444804952
/gridview/export/*	2	\N	\N	\N	1444804952	1444804952
/gridview/*	2	\N	\N	\N	1444804952	1444804952
/datecontrol/parse/convert	2	\N	\N	\N	1444804952	1444804952
/datecontrol/parse/*	2	\N	\N	\N	1444804952	1444804952
/datecontrol/*	2	\N	\N	\N	1444804952	1444804952
/markdown/parse/preview	2	\N	\N	\N	1444804952	1444804952
/markdown/parse/download	2	\N	\N	\N	1444804952	1444804952
/markdown/parse/*	2	\N	\N	\N	1444804952	1444804952
/markdown/*	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/index	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/view	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/create	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/update	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/delete	2	\N	\N	\N	1444804952	1444804952
/articles/attachments/*	2	\N	\N	\N	1444804952	1444804952
/articles/categories/index	2	\N	\N	\N	1444804952	1444804952
/articles/categories/view	2	\N	\N	\N	1444804952	1444804952
/articles/categories/create	2	\N	\N	\N	1444804952	1444804952
/articles/categories/update	2	\N	\N	\N	1444804952	1444804952
/articles/categories/delete	2	\N	\N	\N	1444804952	1444804952
/articles/categories/deleteimage	2	\N	\N	\N	1444804952	1444804952
/articles/categories/*	2	\N	\N	\N	1444804952	1444804952
/articles/default/index	2	\N	\N	\N	1444804952	1444804952
/articles/default/*	2	\N	\N	\N	1444804952	1444804952
/articles/items/index	2	\N	\N	\N	1444804952	1444804952
/articles/items/view	2	\N	\N	\N	1444804952	1444804952
/articles/items/create	2	\N	\N	\N	1444804952	1444804952
/articles/items/update	2	\N	\N	\N	1444804952	1444804952
/articles/items/delete	2	\N	\N	\N	1444804952	1444804952
/articles/items/deleteimage	2	\N	\N	\N	1444804952	1444804952
/articles/items/*	2	\N	\N	\N	1444804952	1444804952
/articles/*	2	\N	\N	\N	1444804952	1444804952
/keu/default/index	2	\N	\N	\N	1449077121	1449077121
/keu/default/*	2	\N	\N	\N	1449077121	1449077121
/keu/*	2	\N	\N	\N	1449077121	1449077121
ADMIN AKADEMIK	1	Administrator Akademik	\N	\N	1449077998	1449077998
rbac	2	Manage RBAC	\N	\N	1449078330	1449078330
DOSEN	1	Dosen STT-NF	\N	\N	1449081477	1449081477
BAAK	1	Biro Administrasi Akademik dan Kemahasiswaan	\N	\N	1449081730	1449081730
articles	2	Manage Articles	\N	\N	1449078173	1449078173
ADMIN KEU	1	Admin Keuangan	\N	\N	1449081354	1449081354
DOSEN PA	1	Dosen Pembimbing Akademik	\N	\N	1449081533	1449081533
/user/admin/index	2	\N	\N	\N	1444804954	1444804954
/user/admin/create	2	\N	\N	\N	1444804954	1444804954
/user/admin/update	2	\N	\N	\N	1444804954	1444804954
/user/admin/update-profile	2	\N	\N	\N	1444804954	1444804954
/user/admin/info	2	\N	\N	\N	1444804954	1444804954
/user/admin/assignments	2	\N	\N	\N	1444804954	1444804954
/user/admin/confirm	2	\N	\N	\N	1444804954	1444804954
/user/admin/delete	2	\N	\N	\N	1444804954	1444804954
/user/admin/block	2	\N	\N	\N	1444804954	1444804954
/user/admin/*	2	\N	\N	\N	1444804954	1444804954
/user/profile/index	2	\N	\N	\N	1444804954	1444804954
/user/profile/show	2	\N	\N	\N	1444804954	1444804954
/user/profile/*	2	\N	\N	\N	1444804954	1444804954
/user/recovery/request	2	\N	\N	\N	1444804954	1444804954
/user/recovery/reset	2	\N	\N	\N	1444804954	1444804954
/user/recovery/*	2	\N	\N	\N	1444804954	1444804954
/user/registration/register	2	\N	\N	\N	1444804954	1444804954
/user/registration/connect	2	\N	\N	\N	1444804954	1444804954
/user/registration/confirm	2	\N	\N	\N	1444804954	1444804954
/user/registration/resend	2	\N	\N	\N	1444804954	1444804954
/user/registration/*	2	\N	\N	\N	1444804954	1444804954
/user/security/auth	2	\N	\N	\N	1444804954	1444804954
/user/security/login	2	\N	\N	\N	1444804954	1444804954
/user/security/logout	2	\N	\N	\N	1444804954	1444804954
/user/security/*	2	\N	\N	\N	1444804954	1444804954
/user/settings/profile	2	\N	\N	\N	1444804954	1444804954
/user/settings/account	2	\N	\N	\N	1444804954	1444804954
/user/settings/confirm	2	\N	\N	\N	1444804954	1444804954
/user/settings/networks	2	\N	\N	\N	1444804954	1444804954
/user/settings/disconnect	2	\N	\N	\N	1444804954	1444804954
/user/settings/*	2	\N	\N	\N	1444804954	1444804954
/user/*	2	\N	\N	\N	1444804954	1444804954
/admin/assignment/index	2	\N	\N	\N	1444804954	1444804954
/admin/assignment/view	2	\N	\N	\N	1444804954	1444804954
/admin/assignment/assign	2	\N	\N	\N	1444804954	1444804954
/admin/assignment/search	2	\N	\N	\N	1444804954	1444804954
/admin/assignment/*	2	\N	\N	\N	1444804954	1444804954
/admin/default/index	2	\N	\N	\N	1444804954	1444804954
/admin/default/*	2	\N	\N	\N	1444804954	1444804954
/admin/menu/index	2	\N	\N	\N	1444804954	1444804954
/admin/menu/view	2	\N	\N	\N	1444804954	1444804954
/admin/menu/create	2	\N	\N	\N	1444804954	1444804954
/admin/menu/update	2	\N	\N	\N	1444804954	1444804954
/admin/menu/delete	2	\N	\N	\N	1444804954	1444804954
/admin/menu/*	2	\N	\N	\N	1444804954	1444804954
/admin/permission/index	2	\N	\N	\N	1444804954	1444804954
/admin/permission/view	2	\N	\N	\N	1444804954	1444804954
/admin/permission/create	2	\N	\N	\N	1444804954	1444804954
/admin/permission/update	2	\N	\N	\N	1444804954	1444804954
/admin/permission/delete	2	\N	\N	\N	1444804954	1444804954
/admin/permission/assign	2	\N	\N	\N	1444804954	1444804954
/admin/permission/search	2	\N	\N	\N	1444804955	1444804955
/admin/permission/*	2	\N	\N	\N	1444804955	1444804955
/admin/role/index	2	\N	\N	\N	1444804955	1444804955
/admin/role/view	2	\N	\N	\N	1444804955	1444804955
/admin/role/create	2	\N	\N	\N	1444804955	1444804955
/admin/role/update	2	\N	\N	\N	1444804955	1444804955
/admin/role/delete	2	\N	\N	\N	1444804955	1444804955
/admin/role/assign	2	\N	\N	\N	1444804955	1444804955
/admin/role/search	2	\N	\N	\N	1444804955	1444804955
/admin/role/*	2	\N	\N	\N	1444804955	1444804955
/admin/route/index	2	\N	\N	\N	1444804955	1444804955
/admin/route/create	2	\N	\N	\N	1444804955	1444804955
/admin/route/assign	2	\N	\N	\N	1444804955	1444804955
/admin/route/search	2	\N	\N	\N	1444804955	1444804955
/admin/route/*	2	\N	\N	\N	1444804956	1444804956
/admin/rule/index	2	\N	\N	\N	1444804956	1444804956
/admin/rule/view	2	\N	\N	\N	1444804956	1444804956
/admin/rule/create	2	\N	\N	\N	1444804956	1444804956
/admin/rule/update	2	\N	\N	\N	1444804956	1444804956
/admin/rule/delete	2	\N	\N	\N	1444804956	1444804956
/admin/rule/*	2	\N	\N	\N	1444804956	1444804956
/admin/*	2	\N	\N	\N	1444804956	1444804956
/debug/default/db-explain	2	\N	\N	\N	1444804956	1444804956
/debug/default/index	2	\N	\N	\N	1444804956	1444804956
/debug/default/view	2	\N	\N	\N	1444804956	1444804956
/debug/default/toolbar	2	\N	\N	\N	1444804956	1444804956
/debug/default/download-mail	2	\N	\N	\N	1444804956	1444804956
/debug/default/*	2	\N	\N	\N	1444804956	1444804956
/debug/*	2	\N	\N	\N	1444804956	1444804956
/gii/default/index	2	\N	\N	\N	1444804956	1444804956
/gii/default/view	2	\N	\N	\N	1444804956	1444804956
krs mahasiswa	2	Manage krs	\N	\N	1449077441	1451213648
/gii/default/preview	2	\N	\N	\N	1444804956	1444804956
/gii/default/diff	2	\N	\N	\N	1444804956	1444804956
/gii/default/action	2	\N	\N	\N	1444804956	1444804956
/gii/default/*	2	\N	\N	\N	1444804956	1444804956
/gii/*	2	\N	\N	\N	1444804956	1444804956
/site/error	2	\N	\N	\N	1444804956	1444804956
/site/index	2	\N	\N	\N	1444804956	1444804956
/site/about	2	\N	\N	\N	1444804956	1444804956
/site/*	2	\N	\N	\N	1444804956	1444804956
/*	2	\N	\N	\N	1444804956	1444804956
ADMIN	1	Administrator	\N	\N	1444806426	1444808074
admin	2	superadmin	\N	\N	1444808160	1444808420
basic user	2	All of basic permission for an authenticated user	\N	\N	1444808446	1444815461
master data	2	Manage all of reference data	\N	\N	1444816758	1444816985
/site/dashboard	2	\N	\N	\N	1445410930	1445410930
keuangan	2	data keuangan mahasiswa	\N	\N	1445940962	1449076233
/md/default/index	2	\N	\N	\N	1449077573	1449077573
/md/default/*	2	\N	\N	\N	1449077573	1449077573
/md/*	2	\N	\N	\N	1449077573	1449077573
users	2	Manage Users	\N	\N	1449078268	1449078268
MHS	1	Mahasiswa STT-NF	\N	\N	1449081401	1449081401
KASIR KEU	1	Kasir Keuangan	\N	\N	1449081570	1449081570
/pmb/default/index	2	\N	\N	\N	1450502574	1450502574
/pmb/default/*	2	\N	\N	\N	1450502575	1450502575
/pmb/*	2	\N	\N	\N	1450502575	1450502575
/prodi/default/index	2	\N	\N	\N	1450502575	1450502575
/prodi/default/*	2	\N	\N	\N	1450502575	1450502575
/prodi/*	2	\N	\N	\N	1450502575	1450502575
/keu/bank/index	2	\N	\N	\N	1450502575	1450502575
/keu/bank/view	2	\N	\N	\N	1450502575	1450502575
/keu/bank/create	2	\N	\N	\N	1450502575	1450502575
/keu/bank/update	2	\N	\N	\N	1450502575	1450502575
/keu/bank/delete	2	\N	\N	\N	1450502575	1450502575
/keu/bank/*	2	\N	\N	\N	1450502575	1450502575
/keu/her-register/index	2	\N	\N	\N	1450502575	1450502575
/keu/her-register/data	2	\N	\N	\N	1450502575	1450502575
/keu/her-register/*	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/index	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/view	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/create	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/update	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/delete	2	\N	\N	\N	1450502575	1450502575
/keu/jenis-pembayaran/*	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/index	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/view	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/create	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/update	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/delete	2	\N	\N	\N	1450502575	1450502575
/keu/tarif/*	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/index	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/view	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/create	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/update	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/delete	2	\N	\N	\N	1450502575	1450502575
/keu/virtual-bank/*	2	\N	\N	\N	1450502575	1450502575
/news/view	2	\N	\N	\N	1450502575	1450502575
/news/*	2	\N	\N	\N	1450502575	1450502575
/keu/default/master-keuangan	2	\N	\N	\N	1450601811	1450601811
/prodi/krs/index	2	\N	\N	\N	1451148278	1451148278
/prodi/krs/*	2	\N	\N	\N	1451148278	1451148278
/keu/her-register/bayar	2	\N	\N	\N	1451148278	1451148278
/prodi/krs/ambil-mk	2	\N	\N	\N	1451190675	1451190675
krs dosen pa	2	Approve krs mahasiswa	\N	\N	1451213768	1451213768
/prodi/krs/approve	2	\N	\N	\N	1451213783	1451213783
dosen	2	dosen mata kuliah	\N	\N	1451233890	1451233890
/prodi/matkul-dosen/index	2	\N	\N	\N	1451233910	1451233910
/prodi/matkul-dosen/*	2	\N	\N	\N	1451233910	1451233910
/keu/transaksi-virtual/index	2	\N	\N	\N	1451809892	1451809892
/keu/transaksi-virtual/*	2	\N	\N	\N	1451809892	1451809892
/keu/transaksi-virtual/proses	2	\N	\N	\N	1451973283	1451973283
/keu/her-register/generate-invoice	2	\N	\N	\N	1452089766	1452089766
/articles/categories/deletemultiple	2	\N	\N	\N	1452089766	1452089766
/articles/categories/changestate	2	\N	\N	\N	1452089766	1452089766
/articles/items/deletemultiple	2	\N	\N	\N	1452089766	1452089766
/articles/items/changestate	2	\N	\N	\N	1452089766	1452089766
/prodi/krs/isi-krs	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/tambah-tagihan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/edit-tagihan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/potongan-tagihan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/edit-potongan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/edit-payment	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/retur	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/delete-tagihan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/delete-payment	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/delete-potongan	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/get-besar-biaya	2	\N	\N	\N	1453119671	1453119671
/keu/her-register/get-potongan-data	2	\N	\N	\N	1453119671	1453119671
/keu/transaksi-virtual/proses-all-virtual	2	\N	\N	\N	1453119671	1453119671
/prodi/krs/hapus-mk	2	\N	\N	\N	1453139114	1453139114
/prodi/krs/hapus-all-mk	2	\N	\N	\N	1453139114	1453139114
/prodi/krs/verifikasi-krs	2	\N	\N	\N	1453142480	1453142480
/prodi/matkul-dosen/kelas	2	\N	\N	\N	1453150295	1453150295
/prodi/matkul-dosen/akad-kelas	2	\N	\N	\N	1453200318	1453200318
CAMABA	1	Calon Mahasiswa Baru	\N	\N	1459930186	1459930186
/camaba/buat-akun/index	2	\N	\N	\N	1460350412	1460350412
/camaba/buat-akun/confirm	2	\N	\N	\N	1460350412	1460350412
/camaba/buat-akun/*	2	\N	\N	\N	1460350412	1460350412
/camaba/default/index	2	\N	\N	\N	1460350412	1460350412
/camaba/default/*	2	\N	\N	\N	1460350412	1460350412
/camaba/profile/index	2	\N	\N	\N	1460350412	1460350412
/camaba/profile/*	2	\N	\N	\N	1460350412	1460350412
/camaba/*	2	\N	\N	\N	1460350412	1460350412
penilaian-kelas	2	manage penilaian kelas	\N	\N	1502803195	1502803195
\.


--
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_item_child (parent, child) FROM stdin;
ADMIN	admin
basic user	/user/profile/*
basic user	/gridview/*
basic user	/user/settings/*
basic user	/user/security/logout
basic user	/site/dashboard
keuangan	/keu/*
master data	/md/*
ADMIN AKADEMIK	master data
ADMIN AKADEMIK	basic user
articles	/articles/*
users	/user/admin/*
rbac	/admin/*
admin	basic user
admin	master data
admin	articles
admin	users
admin	rbac
ADMIN KEU	keuangan
MHS	basic user
ADMIN KEU	basic user
DOSEN	basic user
DOSEN PA	basic user
KASIR KEU	basic user
KASIR KEU	keuangan
BAAK	basic user
admin	/gii/*
MHS	rencana studi
rencana studi	/prodi/default/index
rencana studi	/prodi/krs/index
rencana studi	/prodi/krs/ambil-mk
krs mahasiswa	/prodi/default/index
krs mahasiswa	/prodi/krs/index
krs mahasiswa	/prodi/krs/ambil-mk
MHS	krs mahasiswa
krs dosen pa	/prodi/default/index
krs dosen pa	/prodi/krs/approve
DOSEN PA	krs dosen pa
dosen	/prodi/matkul-dosen/*
DOSEN	dosen
krs mahasiswa	/prodi/krs/isi-krs
krs mahasiswa	/prodi/krs/hapus-mk
krs mahasiswa	/prodi/krs/hapus-all-mk
krs dosen pa	/prodi/krs/verifikasi-krs
CAMABA	basic user
basic user	/camaba/profile/*
penilaian-kelas	/nilai
admin	penilaian-kelas
\.


--
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bank (id, kode, nama, alamat, created_at, updated_at, created_by, updated_by) FROM stdin;
1	BNI	Bank Negara Indonesia	Kampus UI Depok	\N	\N	\N	\N
\.


--
-- Name: bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bank_id_seq', 1, true);


--
-- Data for Name: beasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY beasiswa (mahasiswa_mshswid, "persenBeasiswa", sejumlah, created_at, updated_at, created_by, updated_by, semester, id) FROM stdin;
\.


--
-- Name: beasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('beasiswa_id_seq', 1, false);


--
-- Data for Name: bimbingan_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bimbingan_detail (id, bimbingan_id, konsultasi, tanggapan, jenis_id) FROM stdin;
\.


--
-- Name: bimbingan_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bimbingan_detail_id_seq', 1, false);


--
-- Data for Name: bimbingan_pa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bimbingan_pa (id, tanggal, dosenpa_id, mhsid, created_at, updated_at, created_by, updated_by, semester, ruang_id, jamke_mulai, jamke_akhir) FROM stdin;
\.


--
-- Name: bimbingan_pa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bimbingan_pa_id_seq', 1, false);


--
-- Data for Name: camaba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY camaba (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by, id, asal_sekolah, ayah, ibu, pilihan1_prodi, pilihan2_prodi, pilihan3_prodi, no_ijazah, ratanilai_ijazah, ratanilai_nem, berat, tinggi, anak_ke, jumlah_saudara, alamat_ortu, kota_sekolah, thnlulus_sekolah, nisn, pekerjaan_ayah, pekerjaan_ibu, gaji_ayah, gaji_ibu, jalurstudi_id, pendidikan_ayah_id, pendidikan_ibu_id, nama_wali, pendidikan_wali_id, gaji_wali, tgl_lahir_ayah, tgl_lahir_ibu, tgl_lahir_wali, pekerjaan_wali, no_camaba) FROM stdin;
Megawati	L	Negeri Agung	1993-05-25	Jl. Raya Desa Negeri Agung Kec. Gunung Pelindung	-	0110112011@nurulfikri.ac.id	Islam	085210930155	\N	\N	\N	\N	\N	219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Adnan Al Ghifari	L	Bekasi	1994-10-06	Jl. H. Saikin No. 13 Kebayoran Lama	-	0110112019@nurulfikri.ac.id	Islam	081280944354	\N	\N	\N	\N	\N	220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Dzul Fikri	L	Depok	1994-04-25	Jl. Bakti Abri Kp. Sindangkarsa	-	0110112012@nurulfikri.ac.id	Islam	08561633904	\N	\N	\N	\N	\N	221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Warsito	L	Kebumen	1992-05-16	Kebon Tepakyang Adimulyo Kebumen Jawa Tengah	-	0110112020@nurulfikri.ac.id	Islam	089678503049	\N	\N	\N	\N	\N	222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Mahadi	L	Serang	1992-01-04	Jl Raya Sepang Km 1 Taktakan	-	0110112016@nurulfikri.ac.id	Islam	0254288771	\N	\N	\N	\N	\N	223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Saepul Bahri	L	Ciamis	1992-04-28	Jl Natadisastra	-	0110112018@nurulfikri.ac.id	Islam	08782 6691571	\N	\N	\N	\N	\N	224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Nazih	L	Pekalongan	1994-10-05	Paesan Tengah No.22	-	0110212008@nurulfikri.ac.id	Islam	089602824560	\N	\N	\N	\N	\N	226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Ilham Malik Ibrahim	L	Jakarta	1991-04-14	Kp Garisul Jasinga	-	0110212009@nurulfikri.ac.id	Islam	085778450875	\N	\N	\N	\N	\N	227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhtadii	L	Jakarta	1992-01-18	Jl Pati Raya No 47 Jati Padang Ps Minggu	-	0110212010@nurulfikri.ac.id	Islam	7811724/ 	\N	\N	\N	\N	\N	228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Mochammad Ikbar Muhyi Maulani	L	Sukabumi	1992-06-23	Sukamanah Bojonggenteng Jampang Kulon	-	0110212011@nurulfikri.ac.id	Islam	085659376792	\N	\N	\N	\N	\N	229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Mohamad Yusup Syakir	L	Bogor	1992-04-06	-	-	0110212012@nurulfikri.ac.id	Islam	085717979502	\N	\N	\N	\N	\N	230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Aris Aprianto	L	Bogor	1994-10-05	Kp Rawa Belut Cileungsi	-	0110212013@nurulfikri.ac.id	Islam	082260246382	\N	\N	\N	\N	\N	231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Iqbal Mustofa	L	Depok	1994-10-05	Kp Areman Cimanggis	-	0110212014@nurulfikri.ac.id	Islam	085643194689	\N	\N	\N	\N	\N	232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dilah Abdilah Syukur	L	Majalengka	1993-10-08	Desa Wanajaya kec Kasokandal	-	0110212015@nurulfikri.ac.id	Islam	085724012079	\N	\N	\N	\N	\N	233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Enda Suhendar	L	Bogor	1994-10-05	Kp Pasir Angin Desa Tajur	-	0110212016@nurulfikri.ac.id	Islam	085718 718 719	\N	\N	\N	\N	\N	234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Iqbal	L	Bogor	1992-11-18	Perumahan Bojong DepokBaru Blok EE /15	-	0110212017@nurulfikri.ac.id	Islam	085280 2878 98	\N	\N	\N	\N	\N	235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Kusnadi	L	Tangerang	1993-12-16	Kp Poncol Kel Cipadu Larangan	-	0110212018@nurulfikri.ac.id	Islam	081911129476	\N	\N	\N	\N	\N	236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Akmil Fadillah	L	Bogor	1991-08-27	Kp Areman Kelurhan Tugu	-	0110212019@nurulfikri.ac.id	Islam	083811 007780	\N	\N	\N	\N	\N	237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Krisna Panji	L	Bogor	1995-01-26	Kp Kaum Desa Babakan Raden Cariu	-	0110212020@nurulfikri.ac.id	Islam	0852 1052 2662	\N	\N	\N	\N	\N	238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Saefulloh	L	Kuningan	1994-03-05	Kp Guranteng Blok Sampora Desa Pereasari Kec Gorawangi	-	0110212021@nurulfikri.ac.id	Islam	08980026207	\N	\N	\N	\N	\N	239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Abdullah Nazih	L	Jakarta	1994-08-18	Jl Baung Gg Kong Ali Kebagusan Pasar Minggu	-	0110212006@nurulfikri.ac.id	Islam	(021) 78839721	\N	\N	\N	\N	\N	240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Ahmad Jundi Rabbani	L	Jakarta	1992-02-19	Jl Jati padang Gg H Saibun Rt 4/09 No 41 Pasar Minggu	-	0110212007@nurulfikri.ac.id	Islam	0838 9599 3835	\N	\N	\N	\N	\N	241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Chandra Hadi Kusuma	L	Jakarta	1992-10-23	Jalan Margonda Raya Gg Kedondong No. 80	-	0110212004@nurulfikri.ac.id	Islam	021-7762051	\N	\N	\N	\N	\N	242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dwi Prakoso	L	Jakarta	1993-12-23	Jl. Dangkal No. 16 Sukatani	-	0110212005@nurulfikri.ac.id	Islam	021-87742362	\N	\N	\N	\N	\N	243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Idham Mahmudi	L	Pontianak	1994-05-22	Jl Sarikaya I /231	-	0110212001@nurulfikri.ac.id	Islam	777 3820	\N	\N	\N	\N	\N	244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Syahrul Huda	L	Jakarta	1994-02-11	Jl. H. Raisan No.54 Kel. Kelapa Dua Kec. Kebon Jeruk	-	0110112022@nurulfikri.ac.id	Islam	021-5300272	\N	\N	\N	\N	\N	245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Ikbal Malubi	L	Depok	1994-08-22	Beji Tanah Baru Jl Mandor Eti Rt 03/02	-	0110112008@nurulfikri.ac.id	Islam	083807715540	\N	\N	\N	\N	\N	246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Nur Arroby	L	Depok	1993-09-07	Jl Kemiri Jaya II	-	0110112014@nurulfikri.ac.id	Islam	021-77201701	\N	\N	\N	\N	\N	247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Rizky Yudo Atmaja	L	Jakarta	1994-11-17	Vila Mutiara Gading Blok D1 No. 7	-	0110212003@nurulfikri.ac.id	Islam	88990879	\N	\N	\N	\N	\N	248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Sapari Andi	L	Jakarta	1986-10-07	Jl Mampang Prapatan XII Gg Asem No 4	-	0110212022@nurulfikri.ac.id	Islam	08 999 33 1940	\N	\N	\N	\N	\N	249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Hafidz Diya Ilhaq	L	Jakarta	1992-05-03	Jl Komodor Udara Halim PK o 07	-	0110212026@nurulfikri.ac.id	Islam	8095010	\N	\N	\N	\N	\N	250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Hendra Sasmita	L	Bogor	1982-07-12	Komplek lInux asri Jatijajar Tapos	-	0110212028@nurulfikri.ac.id	Islam	089 899 22031	\N	\N	\N	\N	\N	251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Abdi Wahab Firmansyah	L	Jakarta	1991-04-26	Jl Usman Kelapa Dua Wetan	-	0110212029@nurulfikri.ac.id	Islam	8719191	\N	\N	\N	\N	\N	252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Slamet Santoso	L	Bogor	1993-06-18	Jl Bulak Duren Pasar Cisalak No 63	-	0110212030@nurulfikri.ac.id	Islam	0857-11944920	\N	\N	\N	\N	\N	253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Mohammad Ilham Dinulkholis	L	Cianjur	1993-07-14	Jl Pramuka 2 Rt 03/10 Mampang Pancoran Mas. No.136	-	0110212033@nurulfikri.ac.id	Islam	02177204314	\N	\N	\N	\N	\N	254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Wahyu Lestari	P	Palembang	1987-01-14	Srengseng Sawah Jaga Karsa	-	0110112021@nurulfikri.ac.id	Islam	0878 3258 2814	\N	\N	\N	\N	\N	268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Nurul Afidah	P	Jakarta	1992-10-27	Jl. Tengki No.48 Cipayung	-	0110212032@nurulfikri.ac.id	Islam	085710450357	\N	\N	\N	\N	\N	269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Yunita Windy Muktiani	P	Jakarta	1990-06-15	Jl Gandaria I Pekayon	-	0110212043@nurulfikri.ac.id	Islam	8771 3914	\N	\N	\N	\N	\N	271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Wahyu Lestari	P	Palembang	1987-01-14	Srengseng Sawah Jaga Karsa	-	0110212046@nurulfikri.ac.id	Islam	2	\N	\N	\N	\N	\N	272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Miftah Firdaus	L	Jakarta	1992-03-17	Jl SMEA 6 No 26 Cawang kramat jati	-	0110212036@nurulfikri.ac.id	Islam	0838 720 42 443	\N	\N	\N	\N	\N	279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Mohammad Idris	L	Jakarta	1978-01-04	Kp Balimatraman Jl Swadaya I Manggarai Tebet	-	0110212034@nurulfikri.ac.id	Islam	8315935	\N	\N	\N	\N	\N	280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Nasrul	L	Jakarta	1980-10-10	Komplek lInux asri Jatijajar Tapos	-	0110212035@nurulfikri.ac.id	Islam	-	\N	\N	\N	\N	\N	281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Rustam Setiawan	L	Bogor	1984-10-07	Kp Citapen Ds Cimulang	-	0110212027@nurulfikri.ac.id	Islam	0813150 15036	\N	\N	\N	\N	\N	282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dede Hamzah	L	Tangerang	1994-03-12	Jl Ampera No 71 Serpong	-	0110212031@nurulfikri.ac.id	Islam	0217565462	\N	\N	\N	\N	\N	283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Nur Hasan	L	Jakarta	1988-11-23	Jl Mesjid Al Falah No 8	-	0110212039@nurulfikri.ac.id	Islam	0838 94713566	\N	\N	\N	\N	\N	284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Danil Syahrizal	L	Bogor	1985-08-01	Taman Cibalagung BlokLNo10	-	0110212040@nurulfikri.ac.id	Islam	08166 33 001	\N	\N	\N	\N	\N	285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Firdaus Gunawan	L	Jakarta	1977-04-10	Kp Areman Rt 02/05 Tugu Cimanggis	-	0110212037@nurulfikri.ac.id	Islam	0812 8629 5378	\N	\N	\N	\N	\N	286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Didit Yudhistira	L	Jakarta	1983-05-06	Jl DukuhV No 2 Kel Sukuh	-	0110212024@nurulfikri.ac.id	Islam	08521 7707 636	\N	\N	\N	\N	\N	287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Tri Setyo Nugroho	L	Jakarta	1988-06-07	Jl. Cililitan besar kebon pala	-	0110212023@nurulfikri.ac.id	Islam	021-31720522	\N	\N	\N	\N	\N	288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Lukmanul Hakim	L	Majalengka	1995-02-16	Jl. Margonda Raya Gg. Beringin No. 29	-	0110112009@nurulfikri.ac.id	Islam	08988729627	\N	\N	\N	\N	\N	289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Nuh Fadhillah	L	Jakara	1994-10-10	Jalan Subur No 28	-	0110212025@nurulfikri.ac.id	Islam	8315244	\N	\N	\N	\N	\N	290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dudi Fitriahadi	L	Jakarta	1975-08-14	Pedongkelan Belakang	-	0110212041@nurulfikri.ac.id	Islam	021 96476280	\N	\N	\N	\N	\N	291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Akbar Agus	L	Jakarta	1982-09-30	Jl Malawi I no 85	-	0110212044@nurulfikri.ac.id	Islam	0899 8799 288	\N	\N	\N	\N	\N	292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Hendra Aditiyawijaya	L	Jakarta	1988-04-08	Jl.Malaka Gg.Bambu Tali No. 77 Cilangkap Cipayung	-	0110112001@nurulfikri.ac.id	Islam	021-8454850	\N	\N	\N	\N	\N	293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Nanang Kuswana	L	Majalengka	1977-09-20	Komplek lInux asri Jatijajar Tapos	-	0110212047@nurulfikri.ac.id	Islam	-	\N	\N	\N	\N	\N	294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Edo Riansyah	L	Depok	1990-10-08	Perumahan BambuKuning blok e3No3 BojongGede	-	0110212048@nurulfikri.ac.id	Islam	-	\N	\N	\N	\N	\N	295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muttaqiin	L	Jakarta	1985-01-30	JatiRayano47 JatiPadangPasar Minggu	-	0110212049@nurulfikri.ac.id	Islam	7811724	\N	\N	\N	\N	\N	296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Susilo Wibowo	L	Pati	1976-11-25	Jl Cimanengah	-	0110212045@nurulfikri.ac.id	Islam	08187803 11	\N	\N	\N	\N	\N	346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Imron Wirahadi Kusuma	L	Jakarta	1979-02-17	Jl Nuri 1 No 150 Depok Jaya	-	0110212038@nurulfikri.ac.id	Islam	0838 9760 8004	\N	\N	\N	\N	\N	359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Dio Risky Pratama	L	Jember	1992-12-13	Perum PDA 2 Blok B7 Jl. Haji Awi Pedurenan Jatiluhur-Jatiasih	-	0110112005@nurulfikri.ac.id	Islam	085714350993	\N	\N	\N	\N	\N	448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Fahmi Maisam Cahyo	L	Jakarta	1994-05-01	Komplek Deppen Blok CC 40	-	0110112006@nurulfikri.ac.id	Islam	021-51260288	\N	\N	\N	\N	\N	449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Henny Anggraeni	P	Jakarta	1993-10-28	Puri Kartika Baru Jl. Swadaya No. 45	-	0110112007@nurulfikri.ac.id	Islam	089653501169	\N	\N	\N	\N	\N	462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Ani Isnaini Khotimah	P	Bogor	1994-05-30	Jl Taman Indah II	-	0110112003@nurulfikri.ac.id	Islam	083870143621	\N	\N	\N	\N	\N	463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Deliza Nisa Mazidah	P	Jakarta	1993-12-01	Jl Lereng Indah Dempo No 31 Cinere Pamulang	-	0110112004@nurulfikri.ac.id	Islam	754 7462	\N	\N	\N	\N	\N	464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Siti Nurmala Sari	P	Bogor	1994-11-16	Kp Kambing Ds Karang Asem	-	0110112015@nurulfikri.ac.id	Islam	085711 344763	\N	\N	\N	\N	\N	465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Sani Zulviah	P	Sukabumi	1992-05-06	Kebonpedes	-	0110112017@nurulfikri.ac.id	Islam	085694536593	\N	\N	\N	\N	\N	466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Afif Nur Aysah	P	Pati	1994-07-01	Kp picung	-	0110112002@nurulfikri.ac.id	Islam	089601908571	\N	\N	\N	\N	\N	467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Maria Nurjanah	P	Bogor	1994-05-15	Jl Akses UI Kelapa dua Tugu Cimanggis	-	0110112010@nurulfikri.ac.id	Islam	0896 01691 898	\N	\N	\N	\N	\N	468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Muhammad Jundi	L	Depok	1994-11-04	Jl. Danau Batur 3 No. 73 Kel. Abadijaya Kec. Sukamajaya	-	0110112013@nurulfikri.ac.id	Islam	087878483931	\N	\N	\N	\N	\N	469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Watik Adidaya	L	Bogor	1991-09-27	Taman Duta jl Kemuning I blok E 12 No 2 Cimanggis	-	0110212042@nurulfikri.ac.id	Islam	-	\N	\N	\N	\N	\N	525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: camaba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('camaba_id_seq', 525, true);


--
-- Data for Name: camaba_kebutuhan_khusus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY camaba_kebutuhan_khusus (id, camaba_id, kebutuhan_khusus_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: camaba_kebutuhan_khusus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('camaba_kebutuhan_khusus_id_seq', 1, false);


--
-- Data for Name: camaba_prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY camaba_prodi (id, nocamaba, kode_prodi, noujian, nilai, lulus, idtahun_akademik, foto, created_at, updated_at, created_by, updated_by) FROM stdin;
18	2013TI0001	TI	\N	\N	f	2	\N	\N	\N	\N	\N
19	2014TI0001	TI	\N	\N	f	2	\N	\N	\N	\N	\N
20	2014TI0002	TI	\N	\N	f	2	\N	\N	\N	\N	\N
\.


--
-- Name: camaba_prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('camaba_prodi_id_seq', 20, true);


--
-- Data for Name: counter_nosurat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY counter_nosurat (id, nextcounter, tahun, idorg, kategori_id, created_at, updated_at, created_by, updated_by) FROM stdin;
2	1	2016	1	2	\N	\N	\N	\N
3	1	2016	1	3	\N	\N	\N	\N
4	1	2016	1	4	\N	\N	\N	\N
5	1	2016	1	5	\N	\N	\N	\N
1	2	2016	1	1	\N	\N	\N	\N
\.


--
-- Name: counter_nosurat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('counter_nosurat_id_seq', 5, true);


--
-- Data for Name: detail_akad_bayar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_akad_bayar (id, idakad, idtarif, nilai, islunas, qty, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	5	4000000	\N	1	\N	\N	\N	\N
4	2	2	2000000	\N	1	\N	\N	\N	\N
3	1	6	150000	\N	147	\N	\N	\N	\N
6	2	6	150000	\N	147	\N	\N	\N	\N
2	1	3	3500000	\N	8	\N	\N	\N	\N
5	2	3	3500000	\N	8	\N	\N	\N	\N
\.


--
-- Name: detail_akad_bayar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_akad_bayar_id_seq', 6, true);


--
-- Data for Name: detail_bimbinganpa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_bimbinganpa (id, bimbinganpa_id, refkonsulpa_id, isi, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: detail_bimbinganpa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_bimbinganpa_id_seq', 1, false);


--
-- Name: detail_hasil_studi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_hasil_studi_id_seq', 1, false);


--
-- Data for Name: detail_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_invoice (id, invoice_id, tarif_id, nilai, qty, keterangan, potongan, refpot_id, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	5	4000000	1	\N	0	0	\N	\N	\N	\N
2	1	6	150000	18	18 sks	0	0	\N	\N	\N	\N
3	1	3	3500000	1		0	0	\N	\N	\N	\N
\.


--
-- Name: detail_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_invoice_id_seq', 4, true);


--
-- Data for Name: detail_paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_paket (id, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: detail_paket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detail_paket_id_seq', 1, false);


--
-- Data for Name: dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dosen (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by, nik, orgid, gelar_depan, gelar_belakang, tglmulai_kerja, aktif, golongan, id, nidn, jafung_id, statusdosen_id, goldikti, homebase_id) FROM stdin;
BAMBANG PRIANTONO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9903019258	\N	\N	M.T	\N	0	\N	6	9903019258	1	\N	\N	1
BACHTIAR FIRDAUS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	404017602	\N	\N	S.T, M.P	\N	0	\N	5	0404017602	1	\N	\N	1
KURNIAWAN DWI PRASETYO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	415108403	\N	\N		\N	0	\N	10	0415108403	1	\N	\N	1
MUHAMMAD ARIP	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	412047702	\N	\N	S.Kom, S.Kom, M.Kom	\N	0	\N	14	0412047702	1	\N	\N	2
MUHAMMAD BINTANG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	420097706	\N	\N	S.Kom	\N	0	\N	15	0420097706	1	\N	\N	1
NUGROHO DWI SAPUTRA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	431088701	\N	\N		\N	0	\N	16	0431088701	1	\N	\N	1
REZA PRIMARDIANSYAH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	427057704	\N	\N	S.T, M.Kom	\N	0	\N	18	0427057704	1	\N	\N	2
SALMAN EL FARISI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	424088901	\N	\N		\N	0	\N	20	0424088901	1	\N	\N	2
SAPTO WALUYO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	426096501	\N	\N	S.Sos, M.Sc	\N	0	\N	21	0426096501	1	\N	\N	1
WARSONO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	401017122	\N	\N	S.Kom, M.Ti	\N	0	\N	24	0401017122	1	\N	\N	1
MGS. HENDRI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406036602	\N	Drs	M.M	\N	0	\N	12	0406036602	2	\N	\N	1
AHMAD RIO ADRIANSYAH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	413128601	\N	\N	S.Si, M.Si	\N	0	\N	3	0413128601	2	\N	\N	2
AMALIA RAHMAH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	402018701	\N	\N	S.T, S.T, M.T	\N	0	\N	4	0402018701	2	\N	\N	1
EFRIZAL ZAIDA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	424077104	\N	\N	S.Kom, M.M., M.Kom	\N	0	\N	7	0424077104	2	\N	\N	1
HENRY SAPTONO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	407097405	\N	\N	S.Si, M.Kom	\N	0	\N	8	0407097405	2	\N	\N	2
INDRA HERMAWAN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	413038701	\N	\N	S.Kom, M.Kom	\N	0	\N	9	0413038701	2	\N	\N	2
LUKMAN ROSYIDI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	421117805	\N	\N	S.T, M.M., M.T	\N	0	\N	11	0421117805	2	\N	\N	2
MUHAMMAD ALI AKBAR	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	415058501	\N	\N	S.Si, M.Kom	\N	0	\N	13	0415058501	2	\N	\N	2
REZA ALDIANSYAH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	429058305	\N	\N	S.T, M.Ti	\N	0	\N	17	0429058305	2	\N	\N	1
SIROJUL MUNIR	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	414047101	\N	\N	S.Si, M.Kom	\N	0	\N	22	0414047101	2	\N	\N	2
SUHENDI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6067204	\N	\N	S.T, M.M.S.I	\N	0	\N	23	06067204	2	\N	\N	1
ZAKI IMADUDDIN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	426088302	\N	\N	S.T, M.Kom	\N	0	\N	25	0426088302	2	\N	\N	2
RUSMANTO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	423076303	\N	Drs	M.M	\N	0	\N	19	0423076303	2	\N	\N	1
\.


--
-- Name: dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dosen_id_seq', 25, true);


--
-- Data for Name: elearning_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY elearning_kelas (id, jumlah_slide, jumlah_quiz, jumlah_tugas, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: elearning_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('elearning_kelas_id_seq', 1, false);


--
-- Data for Name: fakultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fakultas (visi, misi, alamat, website, telpon, email, nama, idorg, kode, parent_orgid, pejabat, nik_pejabat, nama_jabatan, created_at, updated_at, created_by, updated_by, id, nofakultas) FROM stdin;
\.


--
-- Name: fakultas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fakultas_id_seq', 1, true);


--
-- Data for Name: fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fasilitas (kode, nama, nilai, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: formulir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formulir (id, nomor, tgl_daftar, prodi_id, created_at, updated_at, created_by, updated_by, tarif_id) FROM stdin;
\.


--
-- Name: formulir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formulir_id_seq', 1, false);


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invoice (id, nomor, refid, total, tanggal, nim, semester, created_at, updated_at, created_by, updated_by) FROM stdin;
1	IN0001	1	0	2015-08-20 00:00:00	0110215004	20151	\N	\N	\N	\N
2	IN0002	2	0	2015-09-10 00:00:00	0110115007	20151	\N	\N	\N	\N
\.


--
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoice_id_seq', 2, true);


--
-- Data for Name: jabatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jabatan (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: jabatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jabatan_id_seq', 1, false);


--
-- Data for Name: jadwal_praktikum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jadwal_praktikum (id, kelas_id, jamke_mulai, jamke_akhir, ruang_id, hari, semester, ta_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: jadwal_praktikum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jadwal_praktikum_id_seq', 1, false);


--
-- Data for Name: jafung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jafung (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	-	\N	\N	\N	\N
2	Asisten Ahli	\N	\N	\N	\N
3	Lektor	\N	\N	\N	\N
\.


--
-- Name: jafung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jafung_id_seq', 3, true);


--
-- Data for Name: jalur_studi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jalur_studi (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Normal	\N	\N	\N	\N
2	Bea Studi Dhuafa	\N	\N	\N	\N
3	Bea Studi Prestasi	\N	\N	\N	\N
\.


--
-- Name: jalur_studi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jalur_studi_id_seq', 3, true);


--
-- Data for Name: jamke; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jamke (id, kode, mulai, akhir, created_at, updated_at, created_by, updated_by) FROM stdin;
1	I	08:00:00	08:50:00	\N	\N	\N	\N
2	II	09:00:00	09:50:00	\N	\N	\N	\N
3	III	10:00:00	10:50:00	\N	\N	\N	\N
4	IV	11:00:00	11:50:00	\N	\N	\N	\N
5	V	12:00:00	12:50:00	\N	\N	\N	\N
6	VI	13:00:00	13:50:00	\N	\N	\N	\N
7	VII	14:00:00	14:50:00	\N	\N	\N	\N
8	VIII	15:00:00	15:50:00	\N	\N	\N	\N
9	IX	16:00:00	16:50:00	\N	\N	\N	\N
10	X	17:00:00	17:50:00	\N	\N	\N	\N
11	XI	18:00:00	18:50:00	\N	\N	\N	\N
12	XII	19:00:00	19:50:00	\N	\N	\N	\N
13	XIII	20:00:00	20:50:00	\N	\N	\N	\N
\.


--
-- Name: jamke_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jamke_id_seq', 13, true);


--
-- Data for Name: jenis_bimbingan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_bimbingan (id, nama) FROM stdin;
1	Keuangan
2	Presensi
3	Akademik
4	Nilai
5	Lainnya
\.


--
-- Name: jenis_bimbingan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_bimbingan_id_seq', 5, true);


--
-- Data for Name: jenis_pekerjaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_pekerjaan (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Swasta	\N	\N	\N	\N
2	PNS	\N	\N	\N	\N
3	TNI/Polri	\N	\N	\N	\N
4	Lain-lain	\N	\N	\N	\N
5	Ibu Rumah Tangga	\N	\N	\N	\N
\.


--
-- Name: jenis_pekerjaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_pekerjaan_id_seq', 5, true);


--
-- Data for Name: jenis_pembayaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_pembayaran (id, nama, aktif, is_potongan, created_at, updated_at, created_by, updated_by) FROM stdin;
3	Wisuda	1	0	\N	\N	\N	\N
4	Legalisir	1	0	\N	\N	\N	\N
5	SKS	1	0	\N	\N	\N	\N
6	Biaya Semesteran	1	0	\N	\N	\N	\N
7	Cuti	1	0	\N	\N	\N	\N
2	Biaya Pembangunan	1	0	\N	\N	\N	\N
1	Pendaftaran	1	0	\N	\N	\N	\N
8	Bea Studi	1	1	\N	\N	\N	\N
9	Potongan Biaya Pembangunan	1	1	\N	\N	\N	\N
10	Potongan Biaya Semesteran	1	1	\N	\N	\N	\N
0	-	1	1	\N	\N	\N	\N
\.


--
-- Name: jenis_pembayaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_pembayaran_id_seq', 10, true);


--
-- Data for Name: jenis_prasarana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_prasarana (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Gedung	\N	\N	\N	\N
2	Tempat Ibadah	\N	\N	\N	\N
3	Lapangan OR	\N	\N	\N	\N
\.


--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_prasarana_id_seq', 3, true);


--
-- Data for Name: jenis_ruang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_ruang (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Ruang Kuliah	\N	\N	\N	\N
2	Lab Komputer	\N	\N	\N	\N
3	Ruang Dosen	\N	\N	\N	\N
4	Ruang Rapat	\N	\N	\N	\N
5	Ruang Kantor	\N	\N	\N	\N
6	Ruang Perpustakaan	\N	\N	\N	\N
7	Ruang Lain	\N	\N	\N	\N
8	Aula	\N	\N	\N	\N
\.


--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_ruang_id_seq', 8, true);


--
-- Data for Name: jenis_seminar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_seminar (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Proposal TA	\N	\N	\N	\N
2	TA	\N	\N	\N	\N
\.


--
-- Name: jenis_sidang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_sidang_id_seq', 2, true);


--
-- Data for Name: jenis_surat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenis_surat (id, nama, kategori_id, created_at, updated_at, created_by, updated_by) FROM stdin;
1	SK Mengajar	1	\N	\N	\N	\N
2	ST Dinas	3	\N	\N	\N	\N
\.


--
-- Name: jenis_surat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenis_surat_id_seq', 2, true);


--
-- Data for Name: jenjang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jenjang (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	S1	\N	\N	\N	\N
2	S2	\N	\N	\N	\N
3	S3	\N	\N	\N	\N
\.


--
-- Name: jenjang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jenjang_id_seq', 1, false);


--
-- Data for Name: kalendar_akademik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kalendar_akademik (id, prodi_id, ta_id, mulai_krs, selesai_krs, mulai_kuliah, selesai_kuliah, mulai_bayar, selesai_bayar, mulai_uts, selesai_uts, mulai_uas, selesai_uas, akhir_penilaian, akhir_cuti, keterangan, nama, kode, aktif, sp, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kalendar_akademik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kalendar_akademik_id_seq', 1, false);


--
-- Data for Name: kampus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kampus (visi, misi, alamat, website, telpon, email, nama, idorg, kode, parent_orgid, pejabat, nik_pejabat, nama_jabatan, created_at, updated_at, created_by, updated_by, id, kategori_id, akreditasi, nosk_banpt, tglsk_banpt, tglskakhir_banpt) FROM stdin;
		Kampus B Jl. Raya Lenteng Agung	http://nurulfikri.ac.id		info@nurulfikri.ac.id	STT-NF	1	STT-NF	\N	Ketua		Ketua	\N	\N	\N	\N	1	3	 		\N	\N
\.


--
-- Name: kampus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kampus_id_seq', 1, true);


--
-- Data for Name: kategori_kampus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kategori_kampus (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Akademi	\N	\N	\N	\N
2	Universitas	\N	\N	\N	\N
3	Sekolah Tinggi	\N	\N	\N	\N
4	Institut	\N	\N	\N	\N
\.


--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kategori_kampus_id_seq', 8, true);


--
-- Data for Name: kategori_matakuliah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kategori_matakuliah (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Kompetensi Perguruan Tinggi	\N	\N	\N	\N
2	Kompetensi Rumpun Ilmu	\N	\N	\N	\N
3	Program Studi	\N	\N	\N	\N
4	Peminatan	\N	\N	\N	\N
\.


--
-- Name: kategori_matakuliah_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kategori_matakuliah_id_seq', 5, true);


--
-- Data for Name: kategori_nilai_ta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kategori_nilai_ta (id, nama) FROM stdin;
\.


--
-- Name: kategori_nilai_ta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kategori_nilai_ta_id_seq', 1, false);


--
-- Data for Name: kategori_surat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kategori_surat (id, nama, kode, format, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Surat Keputusan	SK	COUNTER-JENIS-ORG-STTNF-BULAN-TAHUN	\N	\N	\N	\N
2	Surat Pengantar	SP	COUNTER-JENIS-ORG-STTNF-BULAN-TAHUN	\N	\N	\N	\N
3	Surat Tugas	ST	COUNTER-JENIS-ORG-STTNF-BULAN-TAHUN	\N	\N	\N	\N
4	Surat Keterangan	SKT	COUNTER-JENIS-ORG-STTNF-BULAN-TAHUN	\N	\N	\N	\N
5	Surat Undangan	SU	COUNTER-JENIS-ORG-STTNF-BULAN-TAHUN	\N	\N	\N	\N
\.


--
-- Name: kategori_surat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kategori_surat_id_seq', 5, true);


--
-- Data for Name: kebutuhan_khusus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kebutuhan_khusus (id, kode, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kebutuhan_khusus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kebutuhan_khusus_id_seq', 1, false);


--
-- Data for Name: kegiatan_akademik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kegiatan_akademik (id, deskripsi, kode_semester, org_id, mulai, akhir, nik_pic, budget, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kegiatan_akademik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kegiatan_akademik_id_seq', 1, false);


--
-- Data for Name: kehadiran_dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kehadiran_dosen (id, tanggal, jam_masuk, jam_pulang, tm_ke, materi, ontime, kelas_id, hadir, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kehadiran_dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kehadiran_dosen_id_seq', 1, false);


--
-- Data for Name: kehadiran_mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kehadiran_mahasiswa (id, tanggal, status_hadir, keterangan, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kehadiran_mahasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kehadiran_mahasiswa_id_seq', 1, false);


--
-- Data for Name: kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kelas (id, ta_id, mk_id, ruang_id, dosen_id, asdos_id, jamke_mulai, jamke_akhir, status, hari, semester, kode, abbr, tm, prk, lap, created_at, updated_at, created_by, updated_by) FROM stdin;
17	2	1	1	5	5	1	2	1	Senin	20151	P001	-  	2	0	0	\N	\N	\N	\N
18	2	2	2	3	3	3	4	1	Senin	20151	P002	-  	2	0	0	\N	\N	\N	\N
19	2	3	3	21	21	5	6	1	Senin	20151	P003	-  	2	0	0	\N	\N	\N	\N
20	2	4	1	9	9	1	3	1	Selasa	20151	P004	-  	2	1	0	\N	\N	\N	\N
21	2	5	2	23	23	4	5	1	Selasa	20151	P005	-  	3	0	0	\N	\N	\N	\N
22	2	6	3	19	19	6	8	1	Selasa	20151	S001	-  	2	1	0	\N	\N	\N	\N
23	2	7	1	11	11	1	3	1	Rabu	20151	P006	-  	3	0	0	\N	\N	\N	\N
24	2	8	2	3	3	4	6	1	Rabu	20151	P007	-  	3	0	0	\N	\N	\N	\N
25	2	1	1	5	5	1	2	1	Senin	20151	P008	-  	2	0	0	\N	\N	\N	\N
26	2	2	2	3	3	3	4	1	Senin	20151	P009	-  	2	0	0	\N	\N	\N	\N
27	2	3	3	21	21	5	6	1	Senin	20151	P010	-  	2	0	0	\N	\N	\N	\N
28	2	4	1	9	9	1	3	1	Kamis	20151	P011	-  	2	1	0	\N	\N	\N	\N
29	2	5	2	23	23	4	5	1	Kamis	20151	P012	-  	3	0	0	\N	\N	\N	\N
30	2	6	3	19	19	6	8	1	Kamis	20151	S013	-  	2	1	0	\N	\N	\N	\N
31	2	7	1	11	11	1	3	1	Jumat	20151	P014	-  	3	0	0	\N	\N	\N	\N
32	2	8	2	3	3	4	6	1	Rabu	20151	P015	-  	3	0	0	\N	\N	\N	\N
49	2	9	1	5	5	1	2	1	Senin	20152	P0021	-  	2	0	0	\N	\N	\N	\N
50	2	10	2	21	21	3	4	1	Senin	20152	P0022	-  	2	0	0	\N	\N	\N	\N
51	2	11	3	21	21	5	6	1	Senin	20152	P0023	-  	2	0	0	\N	\N	\N	\N
52	2	12	1	25	25	1	3	1	Selasa	20152	P0024	-  	2	1	0	\N	\N	\N	\N
53	2	13	2	23	23	4	5	1	Selasa	20152	P0025	-  	2	0	0	\N	\N	\N	\N
54	2	14	3	11	11	6	8	1	Selasa	20152	S0021	-  	2	1	0	\N	\N	\N	\N
55	2	15	1	9	9	1	3	1	Rabu	20152	P0026	-  	2	1	0	\N	\N	\N	\N
56	2	16	2	8	8	4	6	1	Rabu	20152	P0027	-  	2	1	0	\N	\N	\N	\N
73	2	9	1	5	5	1	2	1	Senin	20152	P00211	-  	2	0	0	\N	\N	\N	\N
74	2	10	2	21	21	3	4	1	Senin	20152	P00221	-  	2	0	0	\N	\N	\N	\N
75	2	11	3	21	21	5	6	1	Senin	20152	P00231	-  	2	0	0	\N	\N	\N	\N
76	2	12	1	22	22	1	3	1	Kamis	20152	P00241	-  	2	1	0	\N	\N	\N	\N
77	2	13	2	23	23	4	5	1	Kamis	20152	P00251	-  	2	0	0	\N	\N	\N	\N
78	2	14	3	11	11	6	8	1	Kamis	20152	S00211	-  	2	1	0	\N	\N	\N	\N
79	2	15	1	9	9	1	3	1	Jumat	20152	P00261	-  	2	1	0	\N	\N	\N	\N
80	2	16	2	8	8	4	6	1	Rabu	20152	P00271	-  	2	1	0	\N	\N	\N	\N
\.


--
-- Name: kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kelas_id_seq', 80, true);


--
-- Data for Name: kelas_prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kelas_prodi (id, prodi_id, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kelas_prodi_id_seq', 1, false);


--
-- Data for Name: keuangan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY keuangan (tunggakan, beasiswa_id, mahasiswa_mhswid, setoran, "statusKeu", "penundaanPembayaran", "jenisTunggakan", keterangan, "tglBayar", id) FROM stdin;
\.


--
-- Name: keuangan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('keuangan_id_seq', 1, false);


--
-- Data for Name: khs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY khs (id, nim, jumlah_sks, ips, tgl_buat, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: khs_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY khs_detail (id, kelas_id, nilai_akhir, grade, bobot, khs_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: khs_detail_komponen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY khs_detail_komponen (id, hasil_studi_id, komponen_id, nilai, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: khs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('khs_id_seq', 1, false);


--
-- Data for Name: komponen_nilai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY komponen_nilai (id, nama, abbr, aktif, default_persen, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Ujian Tengah Semester	UTS	1	0.29999999999999999	\N	\N	\N	\N
2	Ujian Akhir Semester	UAS	1	0.29999999999999999	\N	\N	\N	\N
\.


--
-- Name: komponen_nilai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('komponen_nilai_id_seq', 2, true);


--
-- Data for Name: komponen_nilai_seminar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY komponen_nilai_seminar (id, kategori_id, bobot, deskripsi) FROM stdin;
\.


--
-- Name: komponen_nilai_seminar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('komponen_nilai_seminar_id_seq', 1, false);


--
-- Data for Name: kpi_dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kpi_dosen (id, dosen_id, semester, tridharma_id, skor, created_at, updated_at) FROM stdin;
\.


--
-- Name: kpi_dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kpi_dosen_id_seq', 1, false);


--
-- Data for Name: krs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY krs (id, nim, jatah_sks, sks_diambil, semester, tgl_buat, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: krs_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY krs_detail (id, kelas_id, status, krs_id, last_update, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: krs_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('krs_detail_id_seq', 1, false);


--
-- Name: krs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('krs_id_seq', 1, false);


--
-- Data for Name: kuisioner_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kuisioner_kelas (id, qid, ans1, ans2, ans3, ans4, ovearall, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: kuisioner_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kuisioner_kelas_id_seq', 1, false);


--
-- Data for Name: kurikulum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kurikulum (id, mulai, akhir, nama, keterangan, aktif, kode, created_at, updated_at, created_by, updated_by) FROM stdin;
1	2015-08-01	2020-07-30	2015-KKNI	KKNI-2015	1	KKNI2015	\N	\N	\N	\N
\.


--
-- Name: kurikulum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kurikulum_id_seq', 1, true);


--
-- Data for Name: kurikulum_matakuliah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kurikulum_matakuliah (id, matkul_id, kurikulum_id, aktif, default_semester, kesedian_semester, prodi_id, wajib, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	1	1	1	Ganjil	1	1	\N	\N	\N	\N
2	2	1	1	1	Ganjil	1	1	\N	\N	\N	\N
3	3	1	1	1	Ganjil	1	1	\N	\N	\N	\N
4	4	1	1	1	Ganjil	1	1	\N	\N	\N	\N
5	5	1	1	1	Ganjil	1	1	\N	\N	\N	\N
6	6	1	1	1	Ganjil	1	1	\N	\N	\N	\N
7	7	1	1	1	Ganjil	1	1	\N	\N	\N	\N
8	8	1	1	1	Ganjil	1	1	\N	\N	\N	\N
9	1	1	1	1	Ganjil	2	1	\N	\N	\N	\N
10	2	1	1	1	Ganjil	2	1	\N	\N	\N	\N
11	3	1	1	1	Ganjil	2	1	\N	\N	\N	\N
12	4	1	1	1	Ganjil	2	1	\N	\N	\N	\N
13	5	1	1	1	Ganjil	2	1	\N	\N	\N	\N
14	6	1	1	1	Ganjil	2	1	\N	\N	\N	\N
15	7	1	1	1	Ganjil	2	1	\N	\N	\N	\N
16	8	1	1	1	Ganjil	2	1	\N	\N	\N	\N
24	8	1	1	2	Genap	1	1	\N	\N	\N	\N
25	9	1	1	2	Genap	1	1	\N	\N	\N	\N
26	10	1	1	2	Genap	1	1	\N	\N	\N	\N
27	11	1	1	2	Genap	1	1	\N	\N	\N	\N
28	12	1	1	2	Genap	1	1	\N	\N	\N	\N
29	13	1	1	2	Genap	1	1	\N	\N	\N	\N
30	14	1	1	2	Genap	1	1	\N	\N	\N	\N
31	15	1	1	2	Genap	1	1	\N	\N	\N	\N
32	8	1	1	2	Genap	2	1	\N	\N	\N	\N
33	9	1	1	2	Genap	2	1	\N	\N	\N	\N
34	10	1	1	2	Genap	2	1	\N	\N	\N	\N
35	11	1	1	2	Genap	2	1	\N	\N	\N	\N
36	12	1	1	2	Genap	2	1	\N	\N	\N	\N
37	13	1	1	2	Genap	2	1	\N	\N	\N	\N
38	14	1	1	2	Genap	2	1	\N	\N	\N	\N
39	15	1	1	2	Genap	2	1	\N	\N	\N	\N
\.


--
-- Name: kurikulum_matakuliah_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kurikulum_matakuliah_id_seq', 2, true);


--
-- Data for Name: log_ta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY log_ta (id, ta_id, keterangan, tanggal, status) FROM stdin;
\.


--
-- Name: log_ta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('log_ta_id_seq', 1, false);


--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mahasiswa (mhsid, nim, thn_masuk, ipk, total_sks, no_ijazah, tgl_lulus, camaba_id, prodi_id, status_id, peminatan_id, kode_rombel, user_id, created_at, updated_at, created_by, updated_by) FROM stdin;
309	0110112019	20121	\N	\N	\N	\N	220	1	\N	0	\N	\N	\N	\N	\N	\N
310	0110112012	20121	\N	\N	\N	\N	221	1	\N	0	\N	\N	\N	\N	\N	\N
311	0110112020	20121	\N	\N	\N	\N	222	1	\N	0	\N	\N	\N	\N	\N	\N
312	0110112016	20121	\N	\N	\N	\N	223	1	\N	0	\N	\N	\N	\N	\N	\N
313	0110112018	20121	\N	\N	\N	\N	224	1	\N	0	\N	\N	\N	\N	\N	\N
316	0110212009	20121	\N	\N	\N	\N	227	2	\N	0	\N	\N	\N	\N	\N	\N
317	0110212010	20121	\N	\N	\N	\N	228	2	\N	0	\N	\N	\N	\N	\N	\N
318	0110212011	20121	\N	\N	\N	\N	229	2	\N	0	\N	\N	\N	\N	\N	\N
319	0110212012	20121	\N	\N	\N	\N	230	2	\N	0	\N	\N	\N	\N	\N	\N
320	0110212013	20121	\N	\N	\N	\N	231	2	\N	0	\N	\N	\N	\N	\N	\N
321	0110212014	20121	\N	\N	\N	\N	232	2	\N	0	\N	\N	\N	\N	\N	\N
322	0110212015	20121	\N	\N	\N	\N	233	2	\N	0	\N	\N	\N	\N	\N	\N
324	0110212017	20121	\N	\N	\N	\N	235	2	\N	0	\N	\N	\N	\N	\N	\N
325	0110212018	20121	\N	\N	\N	\N	236	2	\N	0	\N	\N	\N	\N	\N	\N
326	0110212019	20121	\N	\N	\N	\N	237	2	\N	0	\N	\N	\N	\N	\N	\N
327	0110212020	20121	\N	\N	\N	\N	238	2	\N	0	\N	\N	\N	\N	\N	\N
328	0110212021	20121	\N	\N	\N	\N	239	2	\N	0	\N	\N	\N	\N	\N	\N
329	0110212006	20121	\N	\N	\N	\N	240	2	\N	0	\N	\N	\N	\N	\N	\N
330	0110212007	20121	\N	\N	\N	\N	241	2	\N	0	\N	\N	\N	\N	\N	\N
332	0110212005	20121	\N	\N	\N	\N	243	2	\N	0	\N	\N	\N	\N	\N	\N
333	0110212001	20121	\N	\N	\N	\N	244	2	\N	0	\N	\N	\N	\N	\N	\N
334	0110112022	20121	\N	\N	\N	\N	245	1	\N	0	\N	\N	\N	\N	\N	\N
335	0110112008	20121	\N	\N	\N	\N	246	1	\N	0	\N	\N	\N	\N	\N	\N
336	0110112014	20121	\N	\N	\N	\N	247	1	\N	0	\N	\N	\N	\N	\N	\N
337	0110212003	20121	\N	\N	\N	\N	248	2	\N	0	\N	\N	\N	\N	\N	\N
338	0110212022	20121	\N	\N	\N	\N	249	2	\N	0	\N	\N	\N	\N	\N	\N
339	0110212026	20121	\N	\N	\N	\N	250	2	\N	0	\N	\N	\N	\N	\N	\N
341	0110212029	20121	\N	\N	\N	\N	252	2	\N	0	\N	\N	\N	\N	\N	\N
342	0110212030	20121	\N	\N	\N	\N	253	2	\N	0	\N	\N	\N	\N	\N	\N
343	0110212033	20121	\N	\N	\N	\N	254	2	\N	0	\N	\N	\N	\N	\N	\N
357	0110112021	20121	\N	\N	\N	\N	268	1	\N	0	\N	\N	\N	\N	\N	\N
358	0110212032	20121	\N	\N	\N	\N	269	2	\N	0	\N	\N	\N	\N	\N	\N
360	0110212043	20121	\N	\N	\N	\N	271	2	\N	0	\N	\N	\N	\N	\N	\N
361	0110212046	20121	\N	\N	\N	\N	272	2	\N	0	\N	\N	\N	\N	\N	\N
368	0110212036	20121	\N	\N	\N	\N	279	2	\N	0	\N	\N	\N	\N	\N	\N
369	0110212034	20121	\N	\N	\N	\N	280	2	\N	0	\N	\N	\N	\N	\N	\N
370	0110212035	20121	\N	\N	\N	\N	281	2	\N	0	\N	\N	\N	\N	\N	\N
371	0110212027	20121	\N	\N	\N	\N	282	2	\N	0	\N	\N	\N	\N	\N	\N
372	0110212031	20121	\N	\N	\N	\N	283	2	\N	0	\N	\N	\N	\N	\N	\N
374	0110212040	20121	\N	\N	\N	\N	285	2	\N	0	\N	\N	\N	\N	\N	\N
375	0110212037	20121	\N	\N	\N	\N	286	2	\N	0	\N	\N	\N	\N	\N	\N
376	0110212024	20121	\N	\N	\N	\N	287	2	\N	0	\N	\N	\N	\N	\N	\N
377	0110212023	20121	\N	\N	\N	\N	288	2	\N	0	\N	\N	\N	\N	\N	\N
378	0110112009	20121	\N	\N	\N	\N	289	1	\N	0	\N	\N	\N	\N	\N	\N
379	0110212025	20121	\N	\N	\N	\N	290	2	\N	0	\N	\N	\N	\N	\N	\N
380	0110212041	20121	\N	\N	\N	\N	291	2	\N	0	\N	\N	\N	\N	\N	\N
382	0110112001	20121	\N	\N	\N	\N	293	1	\N	0	\N	\N	\N	\N	\N	\N
383	0110212047	20121	\N	\N	\N	\N	294	2	\N	0	\N	\N	\N	\N	\N	\N
384	0110212048	20121	\N	\N	\N	\N	295	2	\N	0	\N	\N	\N	\N	\N	\N
385	0110212049	20121	\N	\N	\N	\N	296	2	\N	0	\N	\N	\N	\N	\N	\N
448	0110212038	20121	\N	\N	\N	\N	359	2	\N	0	\N	\N	\N	\N	\N	\N
537	0110112005	20121	\N	\N	\N	\N	448	1	\N	0	\N	\N	\N	\N	\N	\N
538	0110112006	20121	\N	\N	\N	\N	449	1	\N	0	\N	\N	\N	\N	\N	\N
551	0110112007	20121	\N	\N	\N	\N	462	1	\N	0	\N	\N	\N	\N	\N	\N
552	0110112003	20121	\N	\N	\N	\N	463	1	\N	0	\N	\N	\N	\N	\N	\N
553	0110112004	20121	\N	\N	\N	\N	464	1	\N	0	\N	\N	\N	\N	\N	\N
554	0110112015	20121	\N	\N	\N	\N	465	1	\N	0	\N	\N	\N	\N	\N	\N
555	0110112017	20121	\N	\N	\N	\N	466	1	\N	0	\N	\N	\N	\N	\N	\N
556	0110112002	20121	\N	\N	\N	\N	467	1	\N	0	\N	\N	\N	\N	\N	\N
558	0110112013	20121	\N	\N	\N	\N	469	1	\N	0	\N	\N	\N	\N	\N	\N
308	0110112011	20121	\N	\N	\N	\N	219	1	\N	0	\N	\N	\N	\N	\N	\N
315	0110212008	20121	\N	\N	\N	\N	226	2	\N	0	\N	\N	\N	\N	\N	\N
323	0110212016	20121	\N	\N	\N	\N	234	2	\N	0	\N	\N	\N	\N	\N	\N
331	0110212004	20121	\N	\N	\N	\N	242	2	\N	0	\N	\N	\N	\N	\N	\N
340	0110212028	20121	\N	\N	\N	\N	251	2	\N	0	\N	\N	\N	\N	\N	\N
373	0110212039	20121	\N	\N	\N	\N	284	2	\N	0	\N	\N	\N	\N	\N	\N
381	0110212044	20121	\N	\N	\N	\N	292	2	\N	0	\N	\N	\N	\N	\N	\N
435	0110212045	20121	\N	\N	\N	\N	346	2	\N	0	\N	\N	\N	\N	\N	\N
557	0110112010	20121	\N	\N	\N	\N	468	1	\N	0	\N	\N	\N	\N	\N	\N
614	0110212042	20121	\N	\N	\N	\N	525	2	\N	0	\N	\N	\N	\N	\N	\N
\.


--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mahasiswa_mhsid_seq', 615, true);


--
-- Data for Name: matakuliah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matakuliah (id, kode, nama, sks, kodemk_syarat, deskripsi, dosen_pengampu, capaian_belajar, kategori_id, abbr, tm, prk, lap, created_at, updated_at, created_by, updated_by) FROM stdin;
1	NF11001	Pendidikan Agama	2	\N	\N	\N	\N	1	PAI	2	0	0	\N	\N	\N	\N
2	NF11002	Matematika Dasar	2	\N	\N	\N	\N	1	MDA	2	0	0	\N	\N	\N	\N
3	NF11003	Bahasa Indonesia	2	\N	\N	\N	\N	1	BHS	2	0	0	\N	\N	\N	\N
4	IE11001	Dasar-dasar Pemrograman	3	\N	\N	\N	\N	2	DDP	2	1	0	\N	\N	\N	\N
5	IE11003	Pengantar Teknologi Informasi	2	\N	\N	\N	\N	2	PTI	2	0	0	\N	\N	\N	\N
6	IE11004	Pengantar Open Source dan Aplikasi	3	\N	\N	\N	\N	2	OSA	2	1	0	\N	\N	\N	\N
7	IE11006	Organisasi dan Arsitektur Komputer	3	\N	\N	\N	\N	2	OAK	3	0	0	\N	\N	\N	\N
8	IE11007	Matematika Diskrit	3	\N	\N	\N	\N	2	MDI	3	0	0	\N	\N	\N	\N
9	NF12001	Keterampilan Berpikir Kreatif	2	\N	\N	\N	\N	1	KBK	2	0	0	\N	\N	\N	\N
10	NF12002	Pancasila dan Pendidikan Kewarganegaraan	3	\N	\N	\N	\N	1	PKN	3	0	0	\N	\N	\N	\N
11	NF12003	Bahasa Inggris	2	\N	\N	\N	\N	1	ENG	2	0	0	\N	\N	\N	\N
12	IE12001	Basis Data I	3	\N	\N	\N	\N	2	BD1	2	1	0	\N	\N	\N	\N
13	IE12003	Sistem Operasi	2	\N	\N	\N	\N	2	SIO	2	0	0	\N	\N	\N	\N
14	IE12004	Jaringan Komputer	3	\N	\N	\N	\N	2	JKO	3	0	0	\N	\N	\N	\N
15	IE12005	Struktur Data dan Algoritma	3	\N	\N	\N	\N	2	SDA	3	0	0	\N	\N	\N	\N
16	IE12006	Administrasi Sistem	3	\N	\N	\N	\N	2	ADS	2	1	0	\N	\N	\N	\N
17	NF21001	Pembentukan Karakter	2	\N	\N	\N	\N	1	KAR	2	0	0	\N	\N	\N	\N
18	IE21001	Pemrograman Web	3	\N	\N	\N	\N	2	WEB	2	1	0	\N	\N	\N	\N
19	IE21003	Basis Data II	3	\N	\N	\N	\N	2	BD2	3	0	0	\N	\N	\N	\N
20	IE21004	Tata Kelola Teknologi Informasi	3	\N	\N	\N	\N	2	TTI	3	0	0	\N	\N	\N	\N
21	IE21005	Pemrograman Berorientasi Objek	3	\N	\N	\N	\N	2	PBO	2	1	0	\N	\N	\N	\N
22	NF21003	Statistik dan Probabilitas	3	\N	\N	\N	\N	1	STP	3	0	0	\N	\N	\N	\N
23	NF21002	Metode Penelitian	2	\N	\N	\N	\N	1	MPE	2	0	0	\N	\N	\N	\N
24	NF22001	Keterampilan Komunikasi & Kerjasama	2	\N	\N	\N	\N	1	KOM	2	0	0	\N	\N	\N	\N
25	IE22002	Rekayasa Perangkat Lunak	3	\N	\N	\N	\N	2	RPL	3	0	0	\N	\N	\N	\N
26	IE22003	Data Warehouse	2	\N	\N	\N	\N	2	DWH	2	0	0	\N	\N	\N	\N
27	IE22001	Interaksi Manusia dan Komputer	2	\N	\N	\N	\N	2	IMK	2	0	0	\N	\N	\N	\N
28	TI22001	Pemrograman Sistem dan Jaringan	3	\N	\N	\N	\N	3	PSJ	2	1	0	\N	\N	\N	\N
29	TI22003	Pemrograman Web Lanjutan	3	\N	\N	\N	\N	3	PWL	2	1	0	\N	\N	\N	\N
30	TI22005	Analisis Numerik	3	\N	\N	\N	\N	3	ANM	3	0	0	\N	\N	\N	\N
31	TI22006	Pemprograman Visual	3	\N	\N	\N	\N	3	VIS	2	1	0	\N	\N	\N	\N
32	NF31001	Keterampilan Kepemimpinan	2	\N	\N	\N	\N	1	PIM	2	0	0	\N	\N	\N	\N
33	TI31001	Komputasi Paralel	3	\N	\N	\N	\N	3	PAR	2	1	0	\N	\N	\N	\N
34	TI31002	Big Data	3	\N	\N	\N	\N	3	BIG	2	1	0	\N	\N	\N	\N
35	TI31003	Kecerdasan Buatan	3	\N	\N	\N	\N	3	KCB	3	0	0	\N	\N	\N	\N
36	TI31004	Pemrograman Mobile	3	\N	\N	\N	\N	3	MOB	2	1	0	\N	\N	\N	\N
37	IE31001	Manajemen Proyek	3	\N	\N	\N	\N	2	MPY	3	0	0	\N	\N	\N	\N
38	NF32001	Technopreneurship & Kewirausahaan	3	\N	\N	\N	\N	1	TEC	3	0	0	\N	\N	\N	\N
39	TI32001	Pengolahan Citra	3	\N	\N	\N	\N	3	CTR	3	0	0	\N	\N	\N	\N
40	IE32001	Cloud computing	2	\N	\N	\N	\N	2	CLD	2	0	0	\N	\N	\N	\N
41	TI32002	Natural Language Processing (NLP)	3	\N	\N	\N	\N	3	NLP	3	0	0	\N	\N	\N	\N
42	TI32003	Sistem Terdistribusi	3	\N	\N	\N	\N	3	STR	3	0	0	\N	\N	\N	\N
43	NF41001	Etika Profesi	2	\N	\N	\N	\N	1	ETP	2	0	0	\N	\N	\N	\N
44	TI41002	Enterprise Application Integration (Integrasi Sistem)	2	\N	\N	\N	\N	2	EAI	2	0	0	\N	\N	\N	\N
45	IE41001	Keamanan Sistem Informasi	2	\N	\N	\N	\N	2	KSI	2	0	0	\N	\N	\N	\N
46	TI40001	Kerja Praktek TI	3	\N	\N	\N	\N	3	KPT	0	0	3	\N	\N	\N	\N
47	NF40001	Tugas Akhir I	2	\N	\N	\N	\N	1	TA1	0	0	2	\N	\N	\N	\N
48	NF40002	Tugas Akhir II	4	\N	\N	\N	\N	1	TA2	0	0	4	\N	\N	\N	\N
49	TI31011	OOAD ( TPL )	3	\N	\N	\N	\N	4	OAD	3	0	0	\N	\N	\N	\N
50	TI32011	Pola Desain Perangkat Lunak (TPL)	3	\N	\N	\N	\N	4	PDP	2	0	0	\N	\N	\N	\N
51	TI32012	Tugas Proyek Perangkat Lunak (TPL)	3	\N	\N	\N	\N	4	TPP	1	0	2	\N	\N	\N	\N
52	TI41011	SQA (TPL)	2	\N	\N	\N	\N	4	SQA	2	0	0	\N	\N	\N	\N
53	TI31021	Administrasi Jaringan ( Infrastruktur TI)	3	\N	\N	\N	\N	4	ADJ	2	1	0	\N	\N	\N	\N
54	TI32021	Tugas Proyek Infrastruktur (Infrastruktur TI)	3	\N	\N	\N	\N	4	TPI	0	0	3	\N	\N	\N	\N
55	TI32022	Manajemen Infrastruktur IT (Infrastruktur TI)	3	\N	\N	\N	\N	4	MIT	3	0	0	\N	\N	\N	\N
56	TI41021	Keamanan Komputer dan Jaringan (Infrastruktur TI)	2	\N	\N	\N	\N	4	KKJ	2	0	0	\N	\N	\N	\N
57	TI40111	Grafika Komputer	3	\N	\N	\N	\N	4	GKO	3	0	0	\N	\N	\N	\N
58	TI40112	Pemrograman Game	3	\N	\N	\N	\N	4	GAM	2	1	0	\N	\N	\N	\N
59	TI40113	Pemrograman Framework	3	\N	\N	\N	\N	4	FRA	2	1	0	\N	\N	\N	\N
60	TI40114	Desain Analisis Algoritma	3	\N	\N	\N	\N	4	DAA	3	0	0	\N	\N	\N	\N
61	TI40121	Jaringan Nirkabel	3	\N	\N	\N	\N	4	JNI	2	1	0	\N	\N	\N	\N
62	TI40122	Routing & Switching	3	\N	\N	\N	\N	4	RSW	2	1	0	\N	\N	\N	\N
63	TI40123	IT Disaster Recovery Plan	3	\N	\N	\N	\N	4	DRP	3	0	0	\N	\N	\N	\N
64	TI40124	Teknologi Virtualisasi	3	\N	\N	\N	\N	4	TVS	3	0	0	\N	\N	\N	\N
65	TI40125	Ethical Hacking	2	\N	\N	\N	\N	4	ETH	2	0	0	\N	\N	\N	\N
66	TI40101	Web Security	2	\N	\N	\N	\N	4	WSE	2	0	0	\N	\N	\N	\N
67	TI40126	Cyber Law	2	\N	\N	\N	\N	4	CLA	2	0	0	\N	\N	\N	\N
68	TI40115	Data Mining	2	\N	\N	\N	\N	4	DMI	2	0	0	\N	\N	\N	\N
69	TI40116	Semantic Web	2	\N	\N	\N	\N	4	SWE	2	0	0	\N	\N	\N	\N
70	TI40127	Digital Forensik	2	\N	\N	\N	\N	4	DFO	2	0	0	\N	\N	\N	\N
71	TI40128	Kriptografi	2	\N	\N	\N	\N	4	KTO	2	0	0	\N	\N	\N	\N
72	TI40117	Visualisasi Data	3	\N	\N	\N	\N	4	VDA	2	1	0	\N	\N	\N	\N
100	SI21001	Pengantar Bisnis	2	\N	\N	\N	\N	3	PBI	0	0	0	\N	\N	\N	\N
101	SI22001	Sistem Informasi Manajemen	3	\N	\N	\N	\N	3	SIM	0	0	0	\N	\N	\N	\N
102	SI22002	Pengantar Akuntansi	2	\N	\N	\N	\N	3	PAK	0	0	0	\N	\N	\N	\N
103	SI22003	Manajemen Produksi & Riset Operasi	3	\N	\N	\N	\N	3	MPR	0	0	0	\N	\N	\N	\N
104	SI22004	Prinsip-Prinsip Manajemen	2	\N	\N	\N	\N	3	PPM	0	0	0	\N	\N	\N	\N
105	SI31001	Manajemen Pemasaran Berbasis IT	2	\N	\N	\N	\N	3	MPI	0	0	0	\N	\N	\N	\N
106	SI31002	Sistem Informasi Akuntansi dan Keuangan	3	\N	\N	\N	\N	3	SIA	0	0	0	\N	\N	\N	\N
107	SI31004	Sistem Penunjang Keputusan	3	\N	\N	\N	\N	3	SPK	0	0	0	\N	\N	\N	\N
108	SI31005	Audit Sistem Informasi	2	\N	\N	\N	\N	3	ASI	0	0	0	\N	\N	\N	\N
109	SI31006	Manajemen SDM Berbasis IT	3	\N	\N	\N	\N	3	SDM	0	0	0	\N	\N	\N	\N
110	SI32001	Enterprise Resource planning	3	\N	\N	\N	\N	3	ERP	0	0	0	\N	\N	\N	\N
111	SI32003	Knowledge management	2	\N	\N	\N	\N	3	KLM	0	0	0	\N	\N	\N	\N
112	SI32004	IT Risk Management	2	\N	\N	\N	\N	3	ITR	0	0	0	\N	\N	\N	\N
113	SI41002	Change Management	2	\N	\N	\N	\N	3	CHM	0	0	0	\N	\N	\N	\N
114	SI40001	Kerja Praktek SI	3	\N	\N	\N	\N	3	KPS	0	0	0	\N	\N	\N	\N
115	SI31011	E-Government	3	\N	\N	\N	\N	3	GOV	0	0	0	\N	\N	\N	\N
116	SI32011	Audit Sistem Informasi Lanjutan	3	\N	\N	\N	\N	3	ASI	0	0	0	\N	\N	\N	\N
117	SI32012	Penjaminan Mutu Sistem Informasi	3	\N	\N	\N	\N	3	PMS	0	0	0	\N	\N	\N	\N
118	SI41011	Proyek: IT Governance	3	\N	\N	\N	\N	3	PGOV	0	0	0	\N	\N	\N	\N
119	SI40101	Sistem Informasi Penilaian Kinerja	3	\N	\N	\N	\N	3	SIPK	0	0	0	\N	\N	\N	\N
120	SI40102	Manajemen Aset	3	\N	\N	\N	\N	3	MAS	0	0	0	\N	\N	\N	\N
121	SI40111	Audit Sistem Informasi Berbasis Komputer	3	\N	\N	\N	\N	3	ASIK	0	0	0	\N	\N	\N	\N
122	SI40112	IT Service Management	3	\N	\N	\N	\N	3	ITSM	0	0	0	\N	\N	\N	\N
123	SI40113	IT DRP	3	\N	\N	\N	\N	3	IDRP	0	0	0	\N	\N	\N	\N
124	SI40103	Cyber Law	2	\N	\N	\N	\N	3	CYB	0	0	0	\N	\N	\N	\N
125	SI40104	Prilaku Organisasi	2	\N	\N	\N	\N	3	POG	0	0	0	\N	\N	\N	\N
126	SI31021	Customer Relationship Management	3	\N	\N	\N	\N	3	CRM	0	0	0	\N	\N	\N	\N
127	SI32021	Supply Chain Management	3	\N	\N	\N	\N	3	SCM	0	0	0	\N	\N	\N	\N
128	SI32022	Perencanaan strategik SI	3	\N	\N	\N	\N	3	PSSI	0	0	0	\N	\N	\N	\N
129	SI41021	Proyek enterprise SI	3	\N	\N	\N	\N	3	PESI	0	0	0	\N	\N	\N	\N
\.


--
-- Name: matakuliah_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matakuliah_id_seq', 80, false);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (id, name, parent, route, "order", data, icon) FROM stdin;
105	Keuangan	\N	/keu/default/index	1	\N	money
107	Master Data	\N	/md/default/index	3	\N	database
108	Articles	\N	/articles/default/index	4	\N	newspaper-o
109	Users	\N	/user/admin/index	5	\N	group
110	RBAC	\N	/admin/assignment/index	6	\N	magic
111	Route	110	/admin/route/index	1	\N	
112	Assignment	110	/admin/assignment/index	2	\N	
113	Role	110	/admin/role/index	3	\N	
114	Permission	110	/admin/permission/index	4	\N	
115	Menu	110	/admin/menu/index	5	\N	
116	Mahasiswa Baru	105	/keu/default/index	1	\N	user
121	Laporan	105	/keu/default/index	5	\N	files-o
117	HER-Register & Pembayaran	105	/keu/her-register/index	2	\N	money
122	Bank	118	/keu/bank/index	1	\N	bank
123	Jenis Pembayaran	118	/keu/jenis-pembayaran/index	2	\N	money
124	Tarif	118	/keu/tarif/index	3	\N	dollar
125	Virtual Bank	118	/keu/virtual-bank/index	4	\N	credit-card
118	Master Data Keuangan	105	/keu/default/master-keuangan	3	\N	stack-overflow
106	Prodi	\N	/prodi/default/index	2	\N	graduation-cap
126	Kartu Rencana Studi	106	/prodi/krs/index	1	\N	clipboard
127	Verifikasi KRS Mahasiswa	106	/prodi/krs/approve	2	\N	check-circle
119	Upload Data Bank	105	/keu/transaksi-virtual/index	4	\N	upload
128	Kelas Dosen	106	/prodi/matkul-dosen/index	3	\N	book
\.


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 128, true);


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migration (version, apply_time) FROM stdin;
m000000_000000_base	1429437945
m141022_115823_create_user_table	1429437949
m141022_115912_create_rbac_tables	1429437949
m141022_115922_create_session_table	1429437950
m150104_153617_create_article_table	1429437950
m130524_201442_init	1432731715
m140209_132017_init	1443778308
m140403_174025_create_account_table	1443778308
m140504_113157_update_tables	1443778308
m140504_130429_create_token_table	1443778308
m140830_171933_fix_ip_field	1443778309
m140830_172703_change_account_table_name	1443778309
m141222_110026_update_ip_field	1443778309
m140602_111327_create_menu_table	1443778565
m140506_102106_rbac_init	1443778581
\.


--
-- Data for Name: nilai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nilai (prodi_id, smt, "prgPendidikan", mhs_id, nim, mk_id, nilai_uas, nilai_uts, nilai_tugas1, nilai_tugas2, nilai_tugas3, nilai_presentasi, nilai_praktik, nilai_absensi, grade, islock, keterangan, status_nilai, created_at, updated_at, created_by, updated_by, camaba_id, kode_rombel, nilai_akhir, id, ta_id, detail) FROM stdin;
1	2	1	\N	0110112021	5	80	80	80	80	80	80	80	80	B	\N	\N	Baik	\N	\N	\N	\N	222	TI1401	\N	3	\N	\N
2	3	1	\N	0110112021	2	50	80	0	0	80	80	\N	60	D	\N	\N	Bermasalah	\N	\N	\N	\N	219	TI1401	\N	4	\N	\N
2	1	1	309	0110112019	1	80	80	80	80	80	80	80	80	B	\N	\N	Baik	\N	\N	\N	\N	221	TI1401	\N	1	\N	\N
1	1	1	\N	0110112020	3	80	80	80	80	80	80	80	80	B+	\N	\N	Baik	\N	\N	\N	\N	224	TI1401	\N	2	1	\N
\.


--
-- Name: nilai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nilai_id_seq', 4, true);


--
-- Data for Name: nilai_seminar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nilai_seminar (id, nilai, dosen_id, status_dosen, seminar_id, komponen_nilai_id) FROM stdin;
\.


--
-- Name: nilai_seminar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nilai_seminar_id_seq', 1, false);


--
-- Data for Name: organisasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY organisasi (visi, misi, alamat, website, telpon, email, nama, idorg, kode, parent_orgid, pejabat, nik_pejabat, nama_jabatan, created_at, updated_at, created_by, updated_by) FROM stdin;
						WAKET I Bidang Akademik	2	WK-1	1	Wakil Ketua		Ketua	\N	\N	\N	\N
						WAKET II Bidang Keuangan dan Sarana Prasarana	5	WK-2	1	Wakil Ketua		Ketua	\N	\N	\N	\N
						WAKET III Bidang Kemahasiswaan	6	WK-3	1	Wakil Ketua		Ketua	\N	\N	\N	\N
						Lembaga Penjaminan Mutu Internal	9	LPMI	2	Ketua		Ketua	\N	\N	\N	\N
		Depok				Lembaga Penelitian Pengabdian Masyarakat	7	LPPM	2	Ketua		Ketua	\N	\N	\N	\N
						UPT Perpustakaan	8	UPT-Perpus	2	Kepala		Kepala	\N	\N	\N	\N
						Biro Sarana dan Prasarana	11	BSP	5	Kepala		Kepala	\N	\N	\N	\N
						UPT Komputer	10	UPT-KOM	2	Kepala		Kepala	\N	\N	\N	\N
						Biro Administrasi Akademik	12	BAAK	2	Kepala		Kepala	\N	\N	\N	\N
\.


--
-- Name: organisasi_idorg_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('organisasi_idorg_seq', 11, true);


--
-- Data for Name: paket_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY paket_kelas (id, ta_id, semester, tot_sks, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: paket_kelas_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY paket_kelas_detail (id, paket_kelas_id, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: paket_kelas_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paket_kelas_detail_id_seq', 1, false);


--
-- Name: paket_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paket_kelas_id_seq', 1, false);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payment (id, nomor, detail_invoice_id, jumlah, tanggal, ket, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_id_seq', 1, false);


--
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pegawai (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by, nik, orgid, gelar_depan, gelar_belakang, tglmulai_kerja, aktif, golongan) FROM stdin;
\.


--
-- Data for Name: pembayaran_formulir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pembayaran_formulir (id, formulir_id, tgl_bayar, jumlah, nocamaba, atas_nama, keterangan, jenis_bayar, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: pembayaran_formulir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pembayaran_formulir_id_seq', 1, false);


--
-- Data for Name: peminatan_prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peminatan_prodi (id, kode, nama, kompetensi, prodi_id, created_at, updated_at, created_by, updated_by) FROM stdin;
1	SE	Software Engineering	-	2	\N	\N	\N	\N
2	IF	IT Infrastructure	-	2	\N	\N	\N	\N
3	IGOV	IT Governancee	-	1	\N	\N	\N	\N
4	EIS	Enterprise Information System	-	1	\N	\N	\N	\N
\.


--
-- Name: peminatan_prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('peminatan_prodi_id_seq', 4, true);


--
-- Data for Name: penanganan_khusus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY penanganan_khusus (id, mahasiswa_mhswid, "keuangan_statusKeu", "kehadiran_mahasiswa_statusAbsensi", "rencana_studi_statusRencanaStudi", "penilaian_kelas_statusNilai") FROM stdin;
\.


--
-- Data for Name: penilaian_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY penilaian_kelas (id, persen_absen, persen_uts, persen_uas, persen_tugas1, persen_tugas2, persen_tugas3, persen_presentasi, persen_praktik, islock, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: persentase_nilai_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persentase_nilai_kelas (id, kelas_id, komponen_id, persen, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: persentase_nilai_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persentase_nilai_kelas_id_seq', 1, false);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY person (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: peserta_kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peserta_kelas (id, kelas_id, mhs_id, nilai_absen, nilai_uts, nilai_uas, nilai_tugas1, nilai_tugas2, nilai_tugas3, nilai_presentase, nilai_praktik, nilai_akhir, grade, islock, keterangan, status_krs, created_at, updated_at, created_by, updated_by) FROM stdin;
1	17	309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
2	17	310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
4	17	311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
5	17	312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
6	18	309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
7	18	310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
8	18	311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
9	18	312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
\.


--
-- Name: peserta_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('peserta_kelas_id_seq', 10, true);


--
-- Data for Name: pmb_camaba_nilai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pmb_camaba_nilai (id, pmb_materi_uji, nilai, kodesoal, nocamaba, islulus, created_at, updated_at, created_by, updated_by) FROM stdin;
29	1	78	P001	2013TI0001	1	\N	\N	\N	\N
30	2	65	B001	2013TI0001	1	\N	\N	\N	\N
28	3	80	W001	2013TI0001	1	\N	\N	\N	\N
\.


--
-- Name: pmb_camaba_nilai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pmb_camaba_nilai_id_seq', 30, true);


--
-- Data for Name: pmb_kegiatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pmb_kegiatan (id, ka_id, nama, tgl_daftar, tgl_ujian, tgl_pengumuman, tgl_daftar_ulang, created_at, updated_at, created_by, updated_by) FROM stdin;
1	1	Ujian Tulis	2012-12-31	2013-03-06	2013-04-08	2013-05-14	\N	\N	\N	\N
2	1	Prestasi Olah raga & Seni	2013-02-08	2013-03-04	2013-03-26	2013-04-01	\N	\N	\N	\N
3	1	SNMPTN Undangan & Prestasi Olimpiade Sains	2013-02-21	2013-03-07	2013-04-05	2013-05-07	\N	\N	\N	\N
\.


--
-- Name: pmb_kegiatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pmb_kegiatan_id_seq', 3, true);


--
-- Data for Name: pmb_materi_ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pmb_materi_ujian (id, kode, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	P001	Test Potensi Akademik	\N	\N	\N	\N
2	P002	Bahasa Inggris	\N	\N	\N	\N
3	P003	Wawancara	\N	\N	\N	\N
\.


--
-- Name: pmb_materi_ujian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pmb_materi_ujian_id_seq', 3, true);


--
-- Data for Name: pmb_nilai_kelulusan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pmb_nilai_kelulusan (id, thn_akademik_id, pmb_materi_uji, kelulusan_minimal, list_kodesoal, created_at, updated_at, created_by, updated_by) FROM stdin;
3	2	3	70	W001	\N	\N	\N	\N
1	2	1	60	P001,P002,P003	\N	\N	\N	\N
2	2	2	60	B001,B002	\N	\N	\N	\N
\.


--
-- Name: pmb_nilai_kelulusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pmb_nilai_kelulusan_id_seq', 3, true);


--
-- Data for Name: pmb_ujian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pmb_ujian (id, nama, tanggal, jam_mulai, jam_akhir, idruang, idtahunajaran, gelombang, editable, minkelulusan, created_at, updated_at, created_by, updated_by) FROM stdin;
3	Ujian PMB 2013 Gel-III	2013-09-16	10:00:00	12:00:00	1	2	3	1	55	\N	\N	\N	\N
2	Ujian PMB 2013 Gel-II	2013-08-05	10:00:00	12:00:00	1	2	2	1	55	\N	\N	\N	\N
1	Ujian PMB 2013 Gel-I	2013-07-01	10:00:00	12:00:00	1	2	1	0	55	\N	\N	\N	\N
\.


--
-- Name: pmb_ujian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pmb_ujian_id_seq', 3, true);


--
-- Data for Name: prasarana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prasarana (kode, nama, nilai, created_at, updated_at, created_by, updated_by, id, alamat, luas, jenis_id) FROM stdin;
K-A	Kampus A	\N	\N	\N	\N	\N	1	Jl. Margonda Raya No.522 Depok	\N	1
K-B	Kampus B	\N	\N	\N	\N	\N	2	Jl. Lenteng Agung No.20 Jakarta Selatan	\N	1
K-C	Kampus C	\N	\N	\N	\N	\N	3	-	\N	1
\.


--
-- Name: prasarana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prasarana_id_seq', 3, true);


--
-- Data for Name: presensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY presensi (id, prodi_id, ta_id, smt, "prgPendidikan", camaba_id, nim, mk_id, pertemuan2, tgl_pertemuan2, pertemuan3, tgl_pertemuan3, pertemuan4, tgl_pertemuan4, pertemuan5, tgl_pertemuan5, pertemuan6, tgl_pertemuan6, pertemuan7, tgl_pertemuan7, pertemuan8, tgl_pertemuan8, pertemuan9, tgl_pertemuan9, pertemuan10, tgl_pertemuan10, pertemuan11, tgl_pertemuan11, pertemuan12, tgl_pertemuan12, pertemuan13, tgl_pertemuan13, pertemuan14, tgl_pertemuan14, nilai_presensi, status_presensi, created_at, updated_at, created_by, updated_by, pertemuan1, tgl_pertemuan1, kode_rombel) FROM stdin;
1	2	1	1	1	222	0110112020	2	1	2017-08-08	1	2017-08-15	1	2017-08-15	\N	2017-08-22	1	2017-08-29	3	2017-08-29	1	2017-08-15	1	2017-08-28	1	2017-08-16	1	2017-08-24	1	2017-08-24	2	2017-08-29	1	2017-08-31	80	Baik	\N	\N	\N	\N	1	2017-08-01	TI1401
\.


--
-- Name: presensi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('presensi_id_seq', 1, true);


--
-- Data for Name: prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY prodi (visi, misi, alamat, website, telpon, email, nama, idorg, kode, parent_orgid, pejabat, nik_pejabat, nama_jabatan, created_at, updated_at, created_by, updated_by, id, akreditasi, nosk_banpt, tglsk_banpt, tglakhirsk_banpt, gelar, jenjang_id, fakultas_id) FROM stdin;
						Teknik Informatika	4	TI	2	Ketua Prodi		Ketua	\N	\N	\N	\N	2	C		\N	\N	S.Kom	1	\N
						Sistem Informasi	3	SI	2	Ketua Prodi		Ketua	\N	\N	\N	\N	1	C		\N	\N	S.Kom	1	\N
\.


--
-- Name: prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prodi_id_seq', 2, true);


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profile (user_id, name, public_email, gravatar_email, gravatar_id, location, website, bio) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N	\N
6	\N	\N	\N	\N	\N	\N	\N
7	\N	\N	\N	\N	\N	\N	\N
8	\N	\N	\N	\N	\N	\N	\N
9	\N	\N	\N	\N	\N	\N	\N
10	\N	\N	\N	\N	\N	\N	\N
11	Watik Adidaya			d41d8cd98f00b204e9800998ecf8427e			
12	Sirojul Munir			d41d8cd98f00b204e9800998ecf8427e			
34	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: program_pendidikan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY program_pendidikan (id, kode, nama, aktif, created_at, updated_at, created_by, updated_by) FROM stdin;
1	REG	Reguler	0	\N	\N	\N	\N
\.


--
-- Name: program_pendidikan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('program_pendidikan_id_seq', 1, true);


--
-- Data for Name: quisioner_dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quisioner_dosen (id, nama, aktif, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: quisioner_dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quisioner_dosen_id_seq', 1, false);


--
-- Data for Name: range_gaji; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY range_gaji (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	 < 1.000.000 	\N	\N	\N	\N
2	1.000.000-3.000.000	\N	\N	\N	\N
3	3.000.000-5.000.000	\N	\N	\N	\N
4	5.000.000-10.000.000	\N	\N	\N	\N
5	 > 10.000.000	\N	\N	\N	\N
0	-	\N	\N	\N	\N
\.


--
-- Name: range_gaji_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('range_gaji_id_seq', 5, true);


--
-- Data for Name: refkonsul_pa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY refkonsul_pa (id, nama, urutan, created_at, updated_at, created_by, updated_by) FROM stdin;
1	presensi	1	\N	\N	\N	\N
2	keuangan	2	\N	\N	\N	\N
3	perkuliahan	3	\N	\N	\N	\N
4	nilai uts	4	\N	\N	\N	\N
5	lain-lain	5	\N	\N	\N	\N
\.


--
-- Name: refkonsul_pa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('refkonsul_pa_id_seq', 5, true);


--
-- Data for Name: rencana_studi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rencana_studi (id, matakuliah_id, khs_detail_grade, khs_file, matakuliah_sks, created_at, updated_at, created_by, updated_by, jatah_sks, sks_diambil) FROM stdin;
\.


--
-- Data for Name: retur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY retur (id, tanggal, payment_id, jumlah, ket, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: retur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('retur_id_seq', 1, false);


--
-- Data for Name: rombel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rombel (kode, dosenpa_id, nama, prodi_id, ta_id, paket_kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
TI1401	22	TI201401	2	2	\N	\N	\N	\N	\N
SI1401	22	SI201401	1	2	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ruang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ruang (id, gedung_id, kode, kapasitas, created_at, updated_at, created_by, updated_by) FROM stdin;
2	2	B203	25	\N	\N	\N	\N
3	2	B205	25	\N	\N	\N	\N
1	2	B204	50	\N	\N	\N	\N
10001	2	NORU	0	\N	\N	\N	\N
\.


--
-- Name: ruang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ruang_id_seq', 3, true);


--
-- Data for Name: semester; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY semester (semester, id) FROM stdin;
\.


--
-- Name: semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('semester_id_seq', 1, false);


--
-- Data for Name: seminar_ta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seminar_ta (id, tgl, ta_id, nilai_akhir, nilai_total_pembimbing, nilai_total_penguji1, nilai_total_penguji2, jenis_seminar_id) FROM stdin;
\.


--
-- Name: seminar_ta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seminar_ta_id_seq', 1, false);


--
-- Data for Name: status_absen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_absen (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Hadir	\N	\N	\N	\N
2	Izin	\N	\N	\N	\N
3	Sakit	\N	\N	\N	\N
4	Tidak Hadir	\N	\N	\N	\N
\.


--
-- Name: status_absen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_absen_id_seq', 4, true);


--
-- Data for Name: status_dosen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_dosen (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Tetap	\N	\N	\N	\N
2	Luar Biasa	\N	\N	\N	\N
3	Tamu	\N	\N	\N	\N
\.


--
-- Name: status_dosen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_dosen_id_seq', 3, true);


--
-- Data for Name: status_mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_mahasiswa (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	aktif	\N	\N	\N	\N
2	Cuti	\N	\N	\N	\N
3	Tidak Aktif	\N	\N	\N	\N
4	DO	\N	\N	\N	\N
\.


--
-- Name: status_mahasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_mahasiswa_id_seq', 4, true);


--
-- Name: studi_mahasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('studi_mahasiswa_id_seq', 1, false);


--
-- Data for Name: surat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY surat (id, nomor, tanggal, deskripsi, jenis_id, orgid_surat, orgid_pengeluar_surat) FROM stdin;
2	001/SK/KETUA/STT-NF/I/2016	2016-01-27	SK Mengajar 20152	1	1	\N
\.


--
-- Name: surat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('surat_id_seq', 2, true);


--
-- Data for Name: tahun_akademik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tahun_akademik (id, awal, akhir, nama, aktif) FROM stdin;
1	2013-08-01	2014-07-30	2013-2014	0
2	2015-08-01	2016-07-30	2015-2016	1
\.


--
-- Name: tahun_akademik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tahun_akademik_id_seq', 2, true);


--
-- Data for Name: tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tarif (id, idjenis, aktif, jumlah, gelombang, idta, deskripsi, nomor_virtual, mulai_bayar, akhir_bayar, kode, created_at, updated_at, created_by, updated_by) FROM stdin;
3	6	1	3500000	0	2	Biaya Semesteran	\N	\N	\N	\N	\N	\N	\N	\N
6	5	1	150000	0	2	Biaya SKS		\N	\N	\N	\N	\N	\N	\N
1	1	1	300000	0	2	Pendaftaran Camaba	\N	\N	\N	REG-001	\N	\N	\N	\N
2	2	1	2000000	1	2	BOP Gelombang I	\N	\N	\N	PMB-BOP161	\N	\N	\N	\N
4	2	1	3000000	2	2	BOP Gelombang II		\N	\N	PMB-BOP162	\N	\N	\N	\N
5	2	1	4000000	3	2	BOP Gelombang III		\N	\N	PMB-BOP163	\N	\N	\N	\N
\.


--
-- Name: tarif_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tarif_id_seq', 6, true);


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY token (user_id, code, created_at, type) FROM stdin;
1	9QAqhSAFPbZAPJYX78_9Fa_DjkwZYDlI	1444019341	0
2	-PnO8rEbRkXq19RS5so06PixofI1AkD1	1444019451	0
1	P0PkTLeAzv9JhUwZdhK4jMD_Flk2sA8i	1462854258	2
\.


--
-- Data for Name: transkrip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transkrip (id, mk_id, grade, sks, semester, bobot, mhs_id, status, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Name: transkrip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transkrip_id_seq', 1, false);


--
-- Data for Name: tugas_akhir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tugas_akhir (id, judul, dosen_pembimbing_id, mhs_id, yudisium_id, status_akhir, nilai_rata_ta1, nilai_rata_ta2, grade_ta1, grade_ta2) FROM stdin;
\.


--
-- Name: tugas_akhir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tugas_akhir_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, email, password_hash, auth_key, confirmed_at, unconfirmed_email, blocked_at, registration_ip, created_at, updated_at, flags, status, password_reset_token, access_token, last_login_time, last_login_ip) FROM stdin;
7	amalia	amalia@nurulfikri.co.id	$2y$12$2tZo89Vzx83gZtIpaFEg8uGt.ohbfFXDH7EbGCKbxzs64BsN5CT56	oyTEiioSGR9Tf9UNhlHIWVo0GZCg6llz	1449082788	\N	\N	127.0.0.1	1449082788	1449082788	0	10	\N	123456	\N	\N
8	samsudin	samsudin@nurulfikri.co.id	$2y$12$cWjbtDgisrBBe64h5Y0UdeLnnEBt9hmtV2ekeuRTuaneHRseb0.lS	wM9hexs0LNxi2MwJN9bie19Kh9orZhEn	1449082822	\N	\N	127.0.0.1	1449082822	1449082822	0	10	\N	123456	\N	\N
9	hendrasas	hendrasas@nurulfikri.ac.id	$2y$12$Liz7uP4ep1iY1LPOI4UITe09LBSMWCmRAWEmPEPb1QVmUAwHL3Pka	mPzcfy0hT4awtD2AgwicmZQ6OvHNObwj	1449084088	\N	\N	127.0.0.1	1449084089	1449084089	0	10	\N	123456	\N	\N
2	edo	edo@nurulfikri.com	$2y$12$2.GOupnFnjNziY1aMuEDhOCPOBodRcw9se90lU/bpVZ7HJ4RCWUYm	s2UFhBpLd3GosUWETZ_b1_sM47YX7DIx	1444113336	\N	\N	127.0.0.1	1444019451	1444019451	0	10	\N	123456	\N	\N
6	rusmanto	rus@nurulfikri.com	$2y$12$4zBUfjT6iX8nD9KpnwVjiuQnBuU4ajRCuiNn3EvaYUfC2IJdNgDRS	x4iUGLcPBz1wjAmsZH84sl9eczCU0ioB	1449075897	\N	\N	127.0.0.1	1449075897	1449075897	0	10	\N	123456	\N	\N
10	indrah	indra@nurulfikri.ac.id	$2y$12$lbzdzeiPCK6u6UQP3MVOVutDsMmLnm7OPEsCYxvFLNiozQ/dQ4mO2	uLlKCJkhC0J9RIc3Rkf429qG9pPptO0B	1451233804	\N	\N	::1	1451233805	1451233805	0	10	\N	123456	\N	\N
11	watik	watikity@gmail.com	$2y$12$2Ulqv1Oo/TbmOf0kuVWycO/OQpTpp4lZShPB897IAWVfnalOwGQa2	BrO39d25SpXmjjepNdnVbx_KeYrnh2FN	1453131361	\N	\N	127.0.0.1	1453131361	1453131361	0	10	\N	123456	\N	\N
12	rojulman	rojulman@nurulfikri.ac.id	$2y$12$rS8ClU.wwHpmonwVipJWhOv6jKji5mCcjHb1./VTZ2ZbljeLwfb2S	hLkG148HG1-Uhm2kkV5kSW3wCdzzM_HR	1453134425	\N	\N	127.0.0.1	1453134426	1453134426	0	10	\N	123456	\N	\N
34	edoriansyah@gmail.com	edoriansyah@gmail.com	$2y$12$iljaXAYnJh/ySChnq3UxqucxHR5Mb/P1hKZa1QRP3YhpX5ekGy8jK	H_SyFwV4T-9JRVma4thRdVswZiUa6elg	1460120607	\N	\N	127.0.0.1	1460120271	1460120271	0	10	\N	123456	\N	\N
1	admin	edo@nurulfikri.co.id	$2y$10$XFZGgKJzzWJAfVS4oQNPvOMFfHCyjhw907u/1LNCjQhy8mVyXAhVy	_ZHcdErJSgOaGp4M2hdhB7laVpfRfwPv	1444096721	rojulman@gmail.com	\N	127.0.0.1	1444019341	1462854258	0	10	\N	123456	\N	\N
35	aisyah	ahumairah13@gmail.com	$2y$13$3BE87ha08J28ott27CxGE.Hwq/2fHJraMgrKR3u0H70DL1dZf4NiS	U8-1SFrR8_H7V6Uz5HqmP3qr7bLOlotQ	\N	\N	\N	\N	1502270242	1502270242	0	10	\N	\N	\N	\N
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 35, true);


--
-- Data for Name: virtual_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY virtual_bank (nomor, bank_id, aktif, jenis_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: waktu_pa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY waktu_pa (id, nama) FROM stdin;
1	Awal Semester
2	Sebelum UTS
3	Sebelum UAS
4	Lainnya
\.


--
-- Name: waktu_pa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('waktu_pa_id_seq', 4, true);


--
-- Data for Name: yudisium; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY yudisium (id, tgl, no_sk, semester, berita_acara) FROM stdin;
1000	2050-10-09	-	dummy	\N
\.


--
-- Name: yudisium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('yudisium_id_seq', 1, false);


--
-- Name: absen_dosen absen_dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_dosen
    ADD CONSTRAINT absen_dosen_pkey PRIMARY KEY (id);


--
-- Name: absen_mahasiswa absen_mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa
    ADD CONSTRAINT absen_mahasiswa_pkey PRIMARY KEY (id);


--
-- Name: akad_bayar akad_bayar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_bayar
    ADD CONSTRAINT akad_bayar_pkey PRIMARY KEY (id);


--
-- Name: akad_kelas akad_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_kelas
    ADD CONSTRAINT akad_kelas_pkey PRIMARY KEY (id);


--
-- Name: article_attachments article_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_attachments
    ADD CONSTRAINT article_attachments_pkey PRIMARY KEY (id);


--
-- Name: article_categories article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: article_items article_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_items
    ADD CONSTRAINT article_items_pkey PRIMARY KEY (id);


--
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- Name: bank bank_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_kode_key UNIQUE (kode);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: beasiswa beasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beasiswa
    ADD CONSTRAINT beasiswa_pkey PRIMARY KEY (id);


--
-- Name: bimbingan_detail bimbingan_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_detail
    ADD CONSTRAINT bimbingan_detail_pkey PRIMARY KEY (id);


--
-- Name: bimbingan_pa bimbingan_pa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa
    ADD CONSTRAINT bimbingan_pa_pkey PRIMARY KEY (id);


--
-- Name: camaba_kebutuhan_khusus camaba_kebutuhan_khusus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_kebutuhan_khusus
    ADD CONSTRAINT camaba_kebutuhan_khusus_pkey PRIMARY KEY (id);


--
-- Name: camaba camaba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pkey PRIMARY KEY (id);


--
-- Name: camaba_prodi camaba_prodi_noujian_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_prodi
    ADD CONSTRAINT camaba_prodi_noujian_key UNIQUE (noujian);


--
-- Name: camaba_prodi camaba_prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_prodi
    ADD CONSTRAINT camaba_prodi_pkey PRIMARY KEY (id);


--
-- Name: counter_nosurat counter_nosurat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counter_nosurat
    ADD CONSTRAINT counter_nosurat_pkey PRIMARY KEY (id);


--
-- Name: detail_akad_bayar detail_akad_bayar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_akad_bayar
    ADD CONSTRAINT detail_akad_bayar_pkey PRIMARY KEY (id);


--
-- Name: detail_bimbinganpa detail_bimbinganpa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_bimbinganpa
    ADD CONSTRAINT detail_bimbinganpa_pkey PRIMARY KEY (id);


--
-- Name: khs_detail_komponen detail_hasil_studi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail_komponen
    ADD CONSTRAINT detail_hasil_studi_pkey PRIMARY KEY (id);


--
-- Name: detail_invoice detail_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_invoice
    ADD CONSTRAINT detail_invoice_pkey PRIMARY KEY (id);


--
-- Name: detail_paket detail_paket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_paket
    ADD CONSTRAINT detail_paket_pkey PRIMARY KEY (id);


--
-- Name: dosen dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen
    ADD CONSTRAINT dosen_pkey PRIMARY KEY (id);


--
-- Name: elearning_kelas elearning_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elearning_kelas
    ADD CONSTRAINT elearning_kelas_pkey PRIMARY KEY (id);


--
-- Name: fakultas fakultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fakultas
    ADD CONSTRAINT fakultas_pkey PRIMARY KEY (id);


--
-- Name: formulir formulir_nomor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulir
    ADD CONSTRAINT formulir_nomor_key UNIQUE (nomor);


--
-- Name: formulir formulir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulir
    ADD CONSTRAINT formulir_pkey PRIMARY KEY (id);


--
-- Name: invoice invoice_nomor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_nomor_key UNIQUE (nomor);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: jabatan jabatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jabatan
    ADD CONSTRAINT jabatan_pkey PRIMARY KEY (id);


--
-- Name: jadwal_praktikum jadwal_praktikum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jadwal_praktikum
    ADD CONSTRAINT jadwal_praktikum_pkey PRIMARY KEY (id);


--
-- Name: jafung jafung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jafung
    ADD CONSTRAINT jafung_pkey PRIMARY KEY (id);


--
-- Name: jalur_studi jalur_studi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jalur_studi
    ADD CONSTRAINT jalur_studi_pkey PRIMARY KEY (id);


--
-- Name: jamke jamke_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jamke
    ADD CONSTRAINT jamke_pkey PRIMARY KEY (id);


--
-- Name: jenis_bimbingan jenis_bimbingan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_bimbingan
    ADD CONSTRAINT jenis_bimbingan_pkey PRIMARY KEY (id);


--
-- Name: jenis_pekerjaan jenis_pekerjaan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_pekerjaan
    ADD CONSTRAINT jenis_pekerjaan_pkey PRIMARY KEY (id);


--
-- Name: jenis_pembayaran jenis_pembayaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_pembayaran
    ADD CONSTRAINT jenis_pembayaran_pkey PRIMARY KEY (id);


--
-- Name: jenis_prasarana jenis_prasarana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_prasarana
    ADD CONSTRAINT jenis_prasarana_pkey PRIMARY KEY (id);


--
-- Name: jenis_ruang jenis_ruang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_ruang
    ADD CONSTRAINT jenis_ruang_pkey PRIMARY KEY (id);


--
-- Name: jenis_seminar jenis_sidang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_seminar
    ADD CONSTRAINT jenis_sidang_pkey PRIMARY KEY (id);


--
-- Name: jenis_surat jenis_surat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_surat
    ADD CONSTRAINT jenis_surat_pkey PRIMARY KEY (id);


--
-- Name: jenjang jenjang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenjang
    ADD CONSTRAINT jenjang_pkey PRIMARY KEY (id);


--
-- Name: kalendar_akademik kalendar_akademik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendar_akademik
    ADD CONSTRAINT kalendar_akademik_pkey PRIMARY KEY (id);


--
-- Name: kampus kampus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kampus
    ADD CONSTRAINT kampus_pkey PRIMARY KEY (id);


--
-- Name: kategori_kampus kategori_kampus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_kampus
    ADD CONSTRAINT kategori_kampus_pkey PRIMARY KEY (id);


--
-- Name: kategori_matakuliah kategori_matakuliah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_matakuliah
    ADD CONSTRAINT kategori_matakuliah_pkey PRIMARY KEY (id);


--
-- Name: kategori_nilai_ta kategori_nilai_ta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_nilai_ta
    ADD CONSTRAINT kategori_nilai_ta_pkey PRIMARY KEY (id);


--
-- Name: kategori_surat kategori_surat_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_surat
    ADD CONSTRAINT kategori_surat_kode_key UNIQUE (kode);


--
-- Name: kategori_surat kategori_surat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategori_surat
    ADD CONSTRAINT kategori_surat_pkey PRIMARY KEY (id);


--
-- Name: kebutuhan_khusus kebutuhan_khusus_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kebutuhan_khusus
    ADD CONSTRAINT kebutuhan_khusus_kode_key UNIQUE (kode);


--
-- Name: kebutuhan_khusus kebutuhan_khusus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kebutuhan_khusus
    ADD CONSTRAINT kebutuhan_khusus_pkey PRIMARY KEY (id);


--
-- Name: kegiatan_akademik kegiatan_akademik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kegiatan_akademik
    ADD CONSTRAINT kegiatan_akademik_pkey PRIMARY KEY (id);


--
-- Name: kehadiran_dosen kehadiran_dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_dosen
    ADD CONSTRAINT kehadiran_dosen_pkey PRIMARY KEY (id);


--
-- Name: kehadiran_mahasiswa kehadiran_mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_mahasiswa
    ADD CONSTRAINT kehadiran_mahasiswa_pkey PRIMARY KEY (id);


--
-- Name: kelas kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_pkey PRIMARY KEY (id);


--
-- Name: kelas_prodi kelas_prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas_prodi
    ADD CONSTRAINT kelas_prodi_pkey PRIMARY KEY (id);


--
-- Name: keuangan keuangan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY keuangan
    ADD CONSTRAINT keuangan_pkey PRIMARY KEY (id);


--
-- Name: khs khs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs
    ADD CONSTRAINT khs_pkey PRIMARY KEY (id);


--
-- Name: kelas kode_unik; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kode_unik UNIQUE (ta_id, kode);


--
-- Name: komponen_nilai komponen_nilai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komponen_nilai
    ADD CONSTRAINT komponen_nilai_pkey PRIMARY KEY (id);


--
-- Name: komponen_nilai_seminar komponen_nilai_seminar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komponen_nilai_seminar
    ADD CONSTRAINT komponen_nilai_seminar_pkey PRIMARY KEY (id);


--
-- Name: kpi_dosen kpi_dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kpi_dosen
    ADD CONSTRAINT kpi_dosen_pkey PRIMARY KEY (id);


--
-- Name: krs_detail krs_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs_detail
    ADD CONSTRAINT krs_detail_pkey PRIMARY KEY (id);


--
-- Name: krs krs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs
    ADD CONSTRAINT krs_pkey PRIMARY KEY (id);


--
-- Name: kuisioner_kelas kuisioner_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kuisioner_kelas
    ADD CONSTRAINT kuisioner_kelas_pkey PRIMARY KEY (id);


--
-- Name: kurikulum kurikulum_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum
    ADD CONSTRAINT kurikulum_kode_key UNIQUE (kode);


--
-- Name: kurikulum_matakuliah kurikulum_matakuliah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum_matakuliah
    ADD CONSTRAINT kurikulum_matakuliah_pkey PRIMARY KEY (id);


--
-- Name: kurikulum kurikulum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum
    ADD CONSTRAINT kurikulum_pkey PRIMARY KEY (id);


--
-- Name: log_ta log_ta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_ta
    ADD CONSTRAINT log_ta_pkey PRIMARY KEY (id);


--
-- Name: mahasiswa mahasiswa_nim_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa
    ADD CONSTRAINT mahasiswa_nim_key UNIQUE (nim);


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (mhsid);


--
-- Name: matakuliah matakuliah_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matakuliah
    ADD CONSTRAINT matakuliah_kode_key UNIQUE (kode);


--
-- Name: matakuliah matakuliah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matakuliah
    ADD CONSTRAINT matakuliah_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: nilai nilai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_pkey PRIMARY KEY (id);


--
-- Name: nilai_seminar nilai_seminar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai_seminar
    ADD CONSTRAINT nilai_seminar_pkey PRIMARY KEY (id);


--
-- Name: organisasi organisasi_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY organisasi
    ADD CONSTRAINT organisasi_kode_key UNIQUE (kode);


--
-- Name: organisasi organisasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY organisasi
    ADD CONSTRAINT organisasi_pkey PRIMARY KEY (idorg);


--
-- Name: paket_kelas_detail paket_kelas_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas_detail
    ADD CONSTRAINT paket_kelas_detail_pkey PRIMARY KEY (id);


--
-- Name: paket_kelas paket_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas
    ADD CONSTRAINT paket_kelas_pkey PRIMARY KEY (id);


--
-- Name: payment payment_nomor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_nomor_key UNIQUE (nomor);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (nik);


--
-- Name: pembayaran_formulir pembayaran_formulir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pembayaran_formulir
    ADD CONSTRAINT pembayaran_formulir_pkey PRIMARY KEY (id);


--
-- Name: peminatan_prodi peminatan_prodi_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peminatan_prodi
    ADD CONSTRAINT peminatan_prodi_kode_key UNIQUE (kode);


--
-- Name: peminatan_prodi peminatan_prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peminatan_prodi
    ADD CONSTRAINT peminatan_prodi_pkey PRIMARY KEY (id);


--
-- Name: penanganan_khusus penanganan_khusus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penanganan_khusus
    ADD CONSTRAINT penanganan_khusus_pkey PRIMARY KEY (id);


--
-- Name: penilaian_kelas penilaian_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penilaian_kelas
    ADD CONSTRAINT penilaian_kelas_pkey PRIMARY KEY (id);


--
-- Name: persentase_nilai_kelas persentase_nilai_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persentase_nilai_kelas
    ADD CONSTRAINT persentase_nilai_kelas_pkey PRIMARY KEY (id);


--
-- Name: peserta_kelas peserta_kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peserta_kelas
    ADD CONSTRAINT peserta_kelas_pkey PRIMARY KEY (id);


--
-- Name: pmb_camaba_nilai pmb_detail_nilai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_camaba_nilai
    ADD CONSTRAINT pmb_detail_nilai_pkey PRIMARY KEY (id);


--
-- Name: pmb_kegiatan pmb_kegiatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_kegiatan
    ADD CONSTRAINT pmb_kegiatan_pkey PRIMARY KEY (id);


--
-- Name: pmb_materi_ujian pmb_materi_ujian_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_materi_ujian
    ADD CONSTRAINT pmb_materi_ujian_kode_key UNIQUE (kode);


--
-- Name: pmb_materi_ujian pmb_materi_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_materi_ujian
    ADD CONSTRAINT pmb_materi_ujian_pkey PRIMARY KEY (id);


--
-- Name: pmb_nilai_kelulusan pmb_nilai_kelulusan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_nilai_kelulusan
    ADD CONSTRAINT pmb_nilai_kelulusan_pkey PRIMARY KEY (id);


--
-- Name: pmb_ujian pmb_ujian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_ujian
    ADD CONSTRAINT pmb_ujian_pkey PRIMARY KEY (id);


--
-- Name: prasarana prasarana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prasarana
    ADD CONSTRAINT prasarana_pkey PRIMARY KEY (id);


--
-- Name: presensi presensi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pkey PRIMARY KEY (id);


--
-- Name: prodi prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prodi
    ADD CONSTRAINT prodi_pkey PRIMARY KEY (id);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (user_id);


--
-- Name: program_pendidikan program_pendidikan_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY program_pendidikan
    ADD CONSTRAINT program_pendidikan_kode_key UNIQUE (kode);


--
-- Name: program_pendidikan program_pendidikan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY program_pendidikan
    ADD CONSTRAINT program_pendidikan_pkey PRIMARY KEY (id);


--
-- Name: quisioner_dosen quisioner_dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quisioner_dosen
    ADD CONSTRAINT quisioner_dosen_pkey PRIMARY KEY (id);


--
-- Name: range_gaji range_gaji_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY range_gaji
    ADD CONSTRAINT range_gaji_pkey PRIMARY KEY (id);


--
-- Name: refkonsul_pa refkonsul_pa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refkonsul_pa
    ADD CONSTRAINT refkonsul_pa_pkey PRIMARY KEY (id);


--
-- Name: rencana_studi rencana_studi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rencana_studi
    ADD CONSTRAINT rencana_studi_pkey PRIMARY KEY (id);


--
-- Name: retur retur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retur
    ADD CONSTRAINT retur_pkey PRIMARY KEY (id);


--
-- Name: rombel rombel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rombel
    ADD CONSTRAINT rombel_pkey PRIMARY KEY (kode);


--
-- Name: ruang ruang_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ruang
    ADD CONSTRAINT ruang_kode_key UNIQUE (kode);


--
-- Name: ruang ruang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ruang
    ADD CONSTRAINT ruang_pkey PRIMARY KEY (id);


--
-- Name: semester semester_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semester
    ADD CONSTRAINT semester_pkey PRIMARY KEY (semester);


--
-- Name: seminar_ta seminar_ta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seminar_ta
    ADD CONSTRAINT seminar_ta_pkey PRIMARY KEY (id);


--
-- Name: status_absen status_absen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_absen
    ADD CONSTRAINT status_absen_pkey PRIMARY KEY (id);


--
-- Name: status_dosen status_dosen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_dosen
    ADD CONSTRAINT status_dosen_pkey PRIMARY KEY (id);


--
-- Name: status_mahasiswa status_mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY status_mahasiswa
    ADD CONSTRAINT status_mahasiswa_pkey PRIMARY KEY (id);


--
-- Name: khs_detail studi_mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail
    ADD CONSTRAINT studi_mahasiswa_pkey PRIMARY KEY (id);


--
-- Name: surat surat_nomor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surat
    ADD CONSTRAINT surat_nomor_key UNIQUE (nomor);


--
-- Name: surat surat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surat
    ADD CONSTRAINT surat_pkey PRIMARY KEY (id);


--
-- Name: tahun_akademik tahun_akademik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tahun_akademik
    ADD CONSTRAINT tahun_akademik_pkey PRIMARY KEY (id);


--
-- Name: tarif tarif_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT tarif_kode_key UNIQUE (kode);


--
-- Name: tarif tarif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT tarif_pkey PRIMARY KEY (id);


--
-- Name: transkrip transkrip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transkrip
    ADD CONSTRAINT transkrip_pkey PRIMARY KEY (id);


--
-- Name: tugas_akhir tugas_akhir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tugas_akhir
    ADD CONSTRAINT tugas_akhir_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: virtual_bank virtual_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY virtual_bank
    ADD CONSTRAINT virtual_bank_pkey PRIMARY KEY (nomor);


--
-- Name: waktu_pa waktu_pa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY waktu_pa
    ADD CONSTRAINT waktu_pa_pkey PRIMARY KEY (id);


--
-- Name: yudisium yudisium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY yudisium
    ADD CONSTRAINT yudisium_pkey PRIMARY KEY (id);


--
-- Name: access; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX access ON article_categories USING btree (access);


--
-- Name: category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category ON article_categories USING btree (state, access);


--
-- Name: catid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catid ON article_items USING btree (catid);


--
-- Name: created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX created ON article_items USING btree (created);


--
-- Name: created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX created_by ON article_items USING btree (created_by);


--
-- Name: fki_beasiswa_mahasiswa_mhswid_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_beasiswa_mahasiswa_mhswid_fkey ON beasiswa USING btree (mahasiswa_mshswid);


--
-- Name: fki_keuangan_beasiswa_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_keuangan_beasiswa_id_fkey ON keuangan USING btree (beasiswa_id);


--
-- Name: fki_nilai_camaba_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_camaba_id_fkey ON nilai USING btree (camaba_id);


--
-- Name: fki_nilai_kode_rombel_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_kode_rombel_fkey ON nilai USING btree (kode_rombel);


--
-- Name: fki_nilai_mhs_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_mhs_id_fkey ON nilai USING btree (mhs_id);


--
-- Name: fki_nilai_mk_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_mk_id_fkey ON nilai USING btree (mk_id);


--
-- Name: fki_nilai_nim_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_nim_fkey ON nilai USING btree (nim);


--
-- Name: fki_nilai_prgPendidikan_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_nilai_prgPendidikan_fkey" ON nilai USING btree ("prgPendidikan");


--
-- Name: fki_nilai_prodi_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_prodi_id ON nilai USING btree (prodi_id);


--
-- Name: fki_nilai_ta_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_nilai_ta_id_fkey ON nilai USING btree (ta_id);


--
-- Name: fki_presensi_camaba_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_camaba_id_fkey ON presensi USING btree (camaba_id);


--
-- Name: fki_presensi_kode_rombel_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_kode_rombel_fkey ON presensi USING btree (kode_rombel);


--
-- Name: fki_presensi_mk_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_mk_id_fkey ON presensi USING btree (mk_id);


--
-- Name: fki_presensi_pertemuan10_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan10_fkey ON presensi USING btree (pertemuan10);


--
-- Name: fki_presensi_pertemuan11_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan11_fkey ON presensi USING btree (pertemuan11);


--
-- Name: fki_presensi_pertemuan12_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan12_fkey ON presensi USING btree (pertemuan12);


--
-- Name: fki_presensi_pertemuan13_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan13_fkey ON presensi USING btree (pertemuan13);


--
-- Name: fki_presensi_pertemuan14_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan14_fkey ON presensi USING btree (pertemuan14);


--
-- Name: fki_presensi_pertemuan1_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan1_fkey ON presensi USING btree (pertemuan1);


--
-- Name: fki_presensi_pertemuan2_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan2_fkey ON presensi USING btree (pertemuan2);


--
-- Name: fki_presensi_pertemuan3_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan3_fkey ON presensi USING btree (pertemuan3);


--
-- Name: fki_presensi_pertemuan4_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan4_fkey ON presensi USING btree (pertemuan4);


--
-- Name: fki_presensi_pertemuan5_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan5_fkey ON presensi USING btree (pertemuan5);


--
-- Name: fki_presensi_pertemuan6_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan6_fkey ON presensi USING btree (pertemuan6);


--
-- Name: fki_presensi_pertemuan7_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan7_fkey ON presensi USING btree (pertemuan7);


--
-- Name: fki_presensi_pertemuan8_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan8_fkey ON presensi USING btree (pertemuan8);


--
-- Name: fki_presensi_pertemuan9_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_pertemuan9_fkey ON presensi USING btree (pertemuan9);


--
-- Name: fki_presensi_prgPedidikan_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_presensi_prgPedidikan_fkey" ON presensi USING btree ("prgPendidikan");


--
-- Name: fki_presensi_prodi_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_prodi_id_fkey ON presensi USING btree (prodi_id);


--
-- Name: fki_presensi_ta_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_presensi_ta_id_fkey ON presensi USING btree (ta_id);


--
-- Name: fki_rencana_studi_matakulliah_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_rencana_studi_matakulliah_id ON rencana_studi USING btree (matakuliah_id);


--
-- Name: hits; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hits ON article_items USING btree (hits);


--
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_item-type" ON auth_item USING btree (type);


--
-- Name: item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX item ON article_items USING btree (state, access);


--
-- Name: itemid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX itemid ON article_attachments USING btree (itemid);


--
-- Name: language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX language ON article_categories USING btree (language);


--
-- Name: ordering; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ordering ON article_categories USING btree (ordering);


--
-- Name: parentid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX parentid ON article_categories USING btree (parentid);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: password_resets_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_token_index ON password_resets USING btree (token);


--
-- Name: published; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX published ON article_categories USING btree (state);


--
-- Name: title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX title ON article_items USING btree (title);


--
-- Name: token_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX token_unique ON token USING btree (user_id, code, type);


--
-- Name: user_unique_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_unique_email ON "user" USING btree (email);


--
-- Name: user_unique_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_unique_username ON "user" USING btree (username);


--
-- Name: absen_dosen absen_dosen_dosen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_dosen
    ADD CONSTRAINT absen_dosen_dosen_id_fkey FOREIGN KEY (dosen_id) REFERENCES dosen(id);


--
-- Name: absen_dosen absen_dosen_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_dosen
    ADD CONSTRAINT absen_dosen_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: absen_mahasiswa absen_mahasiswa_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa
    ADD CONSTRAINT absen_mahasiswa_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: absen_mahasiswa absen_mahasiswa_mhsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa
    ADD CONSTRAINT absen_mahasiswa_mhsid_fkey FOREIGN KEY (mhsid) REFERENCES mahasiswa(mhsid);


--
-- Name: absen_mahasiswa absen_mahasiswa_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa
    ADD CONSTRAINT absen_mahasiswa_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: absen_mahasiswa absen_mahasiswa_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY absen_mahasiswa
    ADD CONSTRAINT absen_mahasiswa_status_id_fkey FOREIGN KEY (status_id) REFERENCES status_absen(id);


--
-- Name: akad_kelas akad_kelas_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_kelas
    ADD CONSTRAINT akad_kelas_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: akad_kelas akad_kelas_komponen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY akad_kelas
    ADD CONSTRAINT akad_kelas_komponen_id_fkey FOREIGN KEY (komponen_id) REFERENCES komponen_nilai(id);


--
-- Name: article_attachments article_attachments_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_attachments
    ADD CONSTRAINT article_attachments_itemid_fkey FOREIGN KEY (itemid) REFERENCES article_items(id);


--
-- Name: article_items article_items_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY article_items
    ADD CONSTRAINT article_items_userid_fkey FOREIGN KEY (userid) REFERENCES "user"(id);


--
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: beasiswa beasiswa_mahasiswa_mhswid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beasiswa
    ADD CONSTRAINT beasiswa_mahasiswa_mhswid_fkey FOREIGN KEY (mahasiswa_mshswid) REFERENCES mahasiswa(mhsid);


--
-- Name: beasiswa beasiswa_semester_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY beasiswa
    ADD CONSTRAINT beasiswa_semester_fkey FOREIGN KEY (semester) REFERENCES semester(semester);


--
-- Name: bimbingan_detail bimbingan_detail_bimbingan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_detail
    ADD CONSTRAINT bimbingan_detail_bimbingan_id_fkey FOREIGN KEY (bimbingan_id) REFERENCES bimbingan_pa(id);


--
-- Name: bimbingan_detail bimbingan_detail_jenis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_detail
    ADD CONSTRAINT bimbingan_detail_jenis_id_fkey FOREIGN KEY (jenis_id) REFERENCES jenis_bimbingan(id);


--
-- Name: bimbingan_pa bimbingan_pa_jamke_akhir_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa
    ADD CONSTRAINT bimbingan_pa_jamke_akhir_fkey FOREIGN KEY (jamke_akhir) REFERENCES jamke(id);


--
-- Name: bimbingan_pa bimbingan_pa_jamke_mulai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa
    ADD CONSTRAINT bimbingan_pa_jamke_mulai_fkey FOREIGN KEY (jamke_mulai) REFERENCES jamke(id);


--
-- Name: bimbingan_pa bimbingan_pa_mhsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa
    ADD CONSTRAINT bimbingan_pa_mhsid_fkey FOREIGN KEY (mhsid) REFERENCES mahasiswa(mhsid);


--
-- Name: bimbingan_pa bimbingan_pa_ruang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bimbingan_pa
    ADD CONSTRAINT bimbingan_pa_ruang_id_fkey FOREIGN KEY (ruang_id) REFERENCES ruang(id);


--
-- Name: camaba camaba_gaji_ayah_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_gaji_ayah_fkey FOREIGN KEY (gaji_ayah) REFERENCES range_gaji(id);


--
-- Name: camaba camaba_gaji_ibu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_gaji_ibu_fkey FOREIGN KEY (gaji_ibu) REFERENCES range_gaji(id);


--
-- Name: camaba camaba_gaji_wali_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_gaji_wali_fkey FOREIGN KEY (gaji_wali) REFERENCES range_gaji(id);


--
-- Name: camaba camaba_jalurstudi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_jalurstudi_id_fkey FOREIGN KEY (jalurstudi_id) REFERENCES jalur_studi(id);


--
-- Name: camaba_kebutuhan_khusus camaba_kebutuhan_khusus_camaba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_kebutuhan_khusus
    ADD CONSTRAINT camaba_kebutuhan_khusus_camaba_id_fkey FOREIGN KEY (camaba_id) REFERENCES camaba(id);


--
-- Name: camaba_kebutuhan_khusus camaba_kebutuhan_khusus_kebutuhan_khusus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_kebutuhan_khusus
    ADD CONSTRAINT camaba_kebutuhan_khusus_kebutuhan_khusus_id_fkey FOREIGN KEY (kebutuhan_khusus_id) REFERENCES kebutuhan_khusus(id);


--
-- Name: camaba camaba_pekerjaan_ayah_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pekerjaan_ayah_fkey FOREIGN KEY (pekerjaan_ayah) REFERENCES jenis_pekerjaan(id);


--
-- Name: camaba camaba_pekerjaan_ibu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pekerjaan_ibu_fkey FOREIGN KEY (pekerjaan_ibu) REFERENCES jenis_pekerjaan(id);


--
-- Name: camaba camaba_pekerjaan_wali_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pekerjaan_wali_fkey FOREIGN KEY (pekerjaan_wali) REFERENCES jenis_pekerjaan(id);


--
-- Name: camaba camaba_pendidikan_ayah_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pendidikan_ayah_id_fkey FOREIGN KEY (pendidikan_ayah_id) REFERENCES jenjang(id);


--
-- Name: camaba camaba_pendidikan_ibu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pendidikan_ibu_id_fkey FOREIGN KEY (pendidikan_ibu_id) REFERENCES jenjang(id);


--
-- Name: camaba camaba_pendidikan_wali_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pendidikan_wali_id_fkey FOREIGN KEY (pendidikan_wali_id) REFERENCES jenjang(id);


--
-- Name: camaba camaba_pilihan1_prodi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba
    ADD CONSTRAINT camaba_pilihan1_prodi_fkey FOREIGN KEY (pilihan1_prodi) REFERENCES prodi(id);


--
-- Name: camaba_prodi camaba_prodi_idtahun_akademik_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY camaba_prodi
    ADD CONSTRAINT camaba_prodi_idtahun_akademik_fkey FOREIGN KEY (idtahun_akademik) REFERENCES tahun_akademik(id);


--
-- Name: counter_nosurat counter_nosurat_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counter_nosurat
    ADD CONSTRAINT counter_nosurat_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES kategori_surat(id);


--
-- Name: detail_akad_bayar detail_akad_bayar_idakad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_akad_bayar
    ADD CONSTRAINT detail_akad_bayar_idakad_fkey FOREIGN KEY (idakad) REFERENCES akad_bayar(id);


--
-- Name: detail_akad_bayar detail_akad_bayar_idtarif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_akad_bayar
    ADD CONSTRAINT detail_akad_bayar_idtarif_fkey FOREIGN KEY (idtarif) REFERENCES tarif(id);


--
-- Name: detail_bimbinganpa detail_bimbinganpa_bimbinganpa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_bimbinganpa
    ADD CONSTRAINT detail_bimbinganpa_bimbinganpa_id_fkey FOREIGN KEY (bimbinganpa_id) REFERENCES bimbingan_pa(id);


--
-- Name: detail_bimbinganpa detail_bimbinganpa_refkonsulpa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_bimbinganpa
    ADD CONSTRAINT detail_bimbinganpa_refkonsulpa_id_fkey FOREIGN KEY (refkonsulpa_id) REFERENCES refkonsul_pa(id);


--
-- Name: khs_detail_komponen detail_hasil_studi_hasil_studi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail_komponen
    ADD CONSTRAINT detail_hasil_studi_hasil_studi_id_fkey FOREIGN KEY (hasil_studi_id) REFERENCES khs_detail(id);


--
-- Name: khs_detail_komponen detail_hasil_studi_komponen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail_komponen
    ADD CONSTRAINT detail_hasil_studi_komponen_id_fkey FOREIGN KEY (komponen_id) REFERENCES komponen_nilai(id);


--
-- Name: detail_invoice detail_invoice_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_invoice
    ADD CONSTRAINT detail_invoice_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES invoice(id);


--
-- Name: detail_invoice detail_invoice_tarif_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_invoice
    ADD CONSTRAINT detail_invoice_tarif_id_fkey FOREIGN KEY (tarif_id) REFERENCES tarif(id);


--
-- Name: detail_paket detail_paket_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detail_paket
    ADD CONSTRAINT detail_paket_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: dosen dosen_homebase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen
    ADD CONSTRAINT dosen_homebase_id_fkey FOREIGN KEY (homebase_id) REFERENCES prodi(id);


--
-- Name: dosen dosen_jafung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen
    ADD CONSTRAINT dosen_jafung_id_fkey FOREIGN KEY (jafung_id) REFERENCES jafung(id);


--
-- Name: dosen dosen_statusdosen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dosen
    ADD CONSTRAINT dosen_statusdosen_id_fkey FOREIGN KEY (statusdosen_id) REFERENCES status_dosen(id);


--
-- Name: elearning_kelas elearning_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elearning_kelas
    ADD CONSTRAINT elearning_kelas_id_fkey FOREIGN KEY (id) REFERENCES kelas(id);


--
-- Name: profile fk_user_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT fk_user_profile FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: token fk_user_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY token
    ADD CONSTRAINT fk_user_token FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: formulir formulir_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulir
    ADD CONSTRAINT formulir_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: formulir formulir_tarif_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulir
    ADD CONSTRAINT formulir_tarif_id_fkey FOREIGN KEY (tarif_id) REFERENCES tarif(id);


--
-- Name: khs_detail hasil_studi_khs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail
    ADD CONSTRAINT hasil_studi_khs_id_fkey FOREIGN KEY (khs_id) REFERENCES khs(id);


--
-- Name: jadwal_praktikum jadwal_praktikum_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jadwal_praktikum
    ADD CONSTRAINT jadwal_praktikum_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: jadwal_praktikum jadwal_praktikum_ruang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jadwal_praktikum
    ADD CONSTRAINT jadwal_praktikum_ruang_id_fkey FOREIGN KEY (ruang_id) REFERENCES ruang(id);


--
-- Name: jadwal_praktikum jadwal_praktikum_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jadwal_praktikum
    ADD CONSTRAINT jadwal_praktikum_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: jenis_surat jenis_surat_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jenis_surat
    ADD CONSTRAINT jenis_surat_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES kategori_surat(id);


--
-- Name: kalendar_akademik kalendar_akademik_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendar_akademik
    ADD CONSTRAINT kalendar_akademik_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: kalendar_akademik kalendar_akademik_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendar_akademik
    ADD CONSTRAINT kalendar_akademik_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: kampus kampus_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kampus
    ADD CONSTRAINT kampus_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES kategori_kampus(id);


--
-- Name: kegiatan_akademik kegiatan_akademik_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kegiatan_akademik
    ADD CONSTRAINT kegiatan_akademik_org_id_fkey FOREIGN KEY (org_id) REFERENCES organisasi(idorg);


--
-- Name: kehadiran_dosen kehadiran_dosen_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_dosen
    ADD CONSTRAINT kehadiran_dosen_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: kehadiran_mahasiswa kehadiran_mahasiswa_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kehadiran_mahasiswa
    ADD CONSTRAINT kehadiran_mahasiswa_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: kelas kelas_asdos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_asdos_id_fkey FOREIGN KEY (asdos_id) REFERENCES dosen(id);


--
-- Name: kelas kelas_dosen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_dosen_id_fkey FOREIGN KEY (dosen_id) REFERENCES dosen(id);


--
-- Name: kelas kelas_jamke_akhir_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_jamke_akhir_fkey FOREIGN KEY (jamke_akhir) REFERENCES jamke(id);


--
-- Name: kelas kelas_jamke_mulai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_jamke_mulai_fkey FOREIGN KEY (jamke_mulai) REFERENCES jamke(id);


--
-- Name: kelas kelas_mk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_mk_id_fkey FOREIGN KEY (mk_id) REFERENCES matakuliah(id);


--
-- Name: kelas_prodi kelas_prodi_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas_prodi
    ADD CONSTRAINT kelas_prodi_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: kelas_prodi kelas_prodi_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas_prodi
    ADD CONSTRAINT kelas_prodi_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: kelas kelas_ruang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_ruang_id_fkey FOREIGN KEY (ruang_id) REFERENCES ruang(id);


--
-- Name: kelas kelas_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kelas
    ADD CONSTRAINT kelas_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: komponen_nilai_seminar komponen_nilai_seminar_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komponen_nilai_seminar
    ADD CONSTRAINT komponen_nilai_seminar_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES kategori_nilai_ta(id);


--
-- Name: krs_detail krs_detail_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs_detail
    ADD CONSTRAINT krs_detail_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: krs_detail krs_detail_krs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs_detail
    ADD CONSTRAINT krs_detail_krs_id_fkey FOREIGN KEY (krs_id) REFERENCES krs(id);


--
-- Name: krs krs_nim_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY krs
    ADD CONSTRAINT krs_nim_fkey FOREIGN KEY (nim) REFERENCES mahasiswa(nim);


--
-- Name: kuisioner_kelas kuisioner_kelas_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kuisioner_kelas
    ADD CONSTRAINT kuisioner_kelas_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: kuisioner_kelas kuisioner_kelas_qid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kuisioner_kelas
    ADD CONSTRAINT kuisioner_kelas_qid_fkey FOREIGN KEY (qid) REFERENCES quisioner_dosen(id);


--
-- Name: kurikulum_matakuliah kurikulum_matakuliah_kurikulum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum_matakuliah
    ADD CONSTRAINT kurikulum_matakuliah_kurikulum_id_fkey FOREIGN KEY (kurikulum_id) REFERENCES kurikulum(id);


--
-- Name: kurikulum_matakuliah kurikulum_matakuliah_matkul_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum_matakuliah
    ADD CONSTRAINT kurikulum_matakuliah_matkul_id_fkey FOREIGN KEY (matkul_id) REFERENCES matakuliah(id);


--
-- Name: kurikulum_matakuliah kurikulum_matakuliah_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurikulum_matakuliah
    ADD CONSTRAINT kurikulum_matakuliah_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: log_ta log_ta_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY log_ta
    ADD CONSTRAINT log_ta_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tugas_akhir(id);


--
-- Name: mahasiswa mahasiswa_kode_rombel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa
    ADD CONSTRAINT mahasiswa_kode_rombel_fkey FOREIGN KEY (kode_rombel) REFERENCES rombel(kode);


--
-- Name: mahasiswa mahasiswa_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa
    ADD CONSTRAINT mahasiswa_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: mahasiswa mahasiswa_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mahasiswa
    ADD CONSTRAINT mahasiswa_status_id_fkey FOREIGN KEY (status_id) REFERENCES status_mahasiswa(id);


--
-- Name: matakuliah matakuliah_dosen_pengampu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matakuliah
    ADD CONSTRAINT matakuliah_dosen_pengampu_fkey FOREIGN KEY (dosen_pengampu) REFERENCES dosen(id);


--
-- Name: matakuliah matakuliah_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matakuliah
    ADD CONSTRAINT matakuliah_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES kategori_matakuliah(id);


--
-- Name: menu menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: nilai nilai_camaba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_camaba_id_fkey FOREIGN KEY (camaba_id) REFERENCES camaba(id);


--
-- Name: nilai nilai_kode_rombel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_kode_rombel_fkey FOREIGN KEY (kode_rombel) REFERENCES rombel(kode);


--
-- Name: nilai nilai_mhs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_mhs_id_fkey FOREIGN KEY (mhs_id) REFERENCES mahasiswa(mhsid);


--
-- Name: nilai nilai_mk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_mk_id_fkey FOREIGN KEY (mk_id) REFERENCES matakuliah(id);


--
-- Name: nilai nilai_nim_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_nim_fkey FOREIGN KEY (nim) REFERENCES mahasiswa(nim);


--
-- Name: nilai nilai_prgPendidikan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT "nilai_prgPendidikan_fkey" FOREIGN KEY ("prgPendidikan") REFERENCES program_pendidikan(id);


--
-- Name: nilai nilai_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: nilai_seminar nilai_seminar_dosen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai_seminar
    ADD CONSTRAINT nilai_seminar_dosen_id_fkey FOREIGN KEY (dosen_id) REFERENCES dosen(id);


--
-- Name: nilai_seminar nilai_seminar_komponen_nilai_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai_seminar
    ADD CONSTRAINT nilai_seminar_komponen_nilai_id_fkey FOREIGN KEY (komponen_nilai_id) REFERENCES komponen_nilai_seminar(id);


--
-- Name: nilai_seminar nilai_seminar_seminar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai_seminar
    ADD CONSTRAINT nilai_seminar_seminar_id_fkey FOREIGN KEY (seminar_id) REFERENCES seminar_ta(id);


--
-- Name: nilai nilai_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nilai
    ADD CONSTRAINT nilai_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: paket_kelas_detail paket_kelas_detail_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas_detail
    ADD CONSTRAINT paket_kelas_detail_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: paket_kelas_detail paket_kelas_detail_paket_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas_detail
    ADD CONSTRAINT paket_kelas_detail_paket_kelas_id_fkey FOREIGN KEY (paket_kelas_id) REFERENCES paket_kelas(id);


--
-- Name: paket_kelas paket_kelas_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paket_kelas
    ADD CONSTRAINT paket_kelas_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: payment payment_detail_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_detail_invoice_id_fkey FOREIGN KEY (detail_invoice_id) REFERENCES detail_invoice(id);


--
-- Name: pegawai pegawai_orgid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pegawai
    ADD CONSTRAINT pegawai_orgid_fkey FOREIGN KEY (orgid) REFERENCES organisasi(idorg);


--
-- Name: pembayaran_formulir pembayaran_formulir_formulir_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pembayaran_formulir
    ADD CONSTRAINT pembayaran_formulir_formulir_id_fkey FOREIGN KEY (formulir_id) REFERENCES formulir(id);


--
-- Name: peminatan_prodi peminatan_prodi_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peminatan_prodi
    ADD CONSTRAINT peminatan_prodi_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: penilaian_kelas penilaian_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY penilaian_kelas
    ADD CONSTRAINT penilaian_kelas_id_fkey FOREIGN KEY (id) REFERENCES kelas(id);


--
-- Name: persentase_nilai_kelas persentase_nilai_kelas_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persentase_nilai_kelas
    ADD CONSTRAINT persentase_nilai_kelas_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: persentase_nilai_kelas persentase_nilai_kelas_komponen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persentase_nilai_kelas
    ADD CONSTRAINT persentase_nilai_kelas_komponen_id_fkey FOREIGN KEY (komponen_id) REFERENCES komponen_nilai(id);


--
-- Name: peserta_kelas peserta_kelas_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peserta_kelas
    ADD CONSTRAINT peserta_kelas_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: peserta_kelas peserta_kelas_mhs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peserta_kelas
    ADD CONSTRAINT peserta_kelas_mhs_id_fkey FOREIGN KEY (mhs_id) REFERENCES mahasiswa(mhsid);


--
-- Name: pmb_camaba_nilai pmb_detail_nilai_pmb_materi_uji_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_camaba_nilai
    ADD CONSTRAINT pmb_detail_nilai_pmb_materi_uji_fkey FOREIGN KEY (pmb_materi_uji) REFERENCES pmb_materi_ujian(id);


--
-- Name: pmb_nilai_kelulusan pmb_nilai_kelulusan_pmb_materi_uji_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_nilai_kelulusan
    ADD CONSTRAINT pmb_nilai_kelulusan_pmb_materi_uji_fkey FOREIGN KEY (pmb_materi_uji) REFERENCES pmb_materi_ujian(id);


--
-- Name: pmb_nilai_kelulusan pmb_nilai_kelulusan_thn_akademik_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_nilai_kelulusan
    ADD CONSTRAINT pmb_nilai_kelulusan_thn_akademik_id_fkey FOREIGN KEY (thn_akademik_id) REFERENCES tahun_akademik(id);


--
-- Name: pmb_ujian pmb_ujian_idruang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_ujian
    ADD CONSTRAINT pmb_ujian_idruang_fkey FOREIGN KEY (idruang) REFERENCES ruang(id);


--
-- Name: pmb_ujian pmb_ujian_idtahunajaran_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pmb_ujian
    ADD CONSTRAINT pmb_ujian_idtahunajaran_fkey FOREIGN KEY (idtahunajaran) REFERENCES tahun_akademik(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: prasarana prasarana_jenis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prasarana
    ADD CONSTRAINT prasarana_jenis_id_fkey FOREIGN KEY (jenis_id) REFERENCES jenis_prasarana(id);


--
-- Name: presensi presensi_camaba_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_camaba_id_fkey FOREIGN KEY (camaba_id) REFERENCES camaba(id);


--
-- Name: presensi presensi_kode_rombel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_kode_rombel_fkey FOREIGN KEY (kode_rombel) REFERENCES rombel(kode);


--
-- Name: presensi presensi_mk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_mk_id_fkey FOREIGN KEY (mk_id) REFERENCES matakuliah(id);


--
-- Name: presensi presensi_pertemuan10_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan10_fkey FOREIGN KEY (pertemuan10) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan11_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan11_fkey FOREIGN KEY (pertemuan11) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan12_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan12_fkey FOREIGN KEY (pertemuan12) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan13_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan13_fkey FOREIGN KEY (pertemuan13) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan14_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan14_fkey FOREIGN KEY (pertemuan14) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan1_fkey FOREIGN KEY (pertemuan1) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan2_fkey FOREIGN KEY (pertemuan2) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan3_fkey FOREIGN KEY (pertemuan3) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan4_fkey FOREIGN KEY (pertemuan4) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan5_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan5_fkey FOREIGN KEY (pertemuan5) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan6_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan6_fkey FOREIGN KEY (pertemuan6) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan7_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan7_fkey FOREIGN KEY (pertemuan7) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan8_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan8_fkey FOREIGN KEY (pertemuan8) REFERENCES status_absen(id);


--
-- Name: presensi presensi_pertemuan9_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_pertemuan9_fkey FOREIGN KEY (pertemuan9) REFERENCES status_absen(id);


--
-- Name: presensi presensi_prgPedidikan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT "presensi_prgPedidikan_fkey" FOREIGN KEY ("prgPendidikan") REFERENCES program_pendidikan(id);


--
-- Name: presensi presensi_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: presensi presensi_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY presensi
    ADD CONSTRAINT presensi_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: prodi prodi_jenjang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prodi
    ADD CONSTRAINT prodi_jenjang_id_fkey FOREIGN KEY (jenjang_id) REFERENCES jenjang(id);


--
-- Name: rencana_studi rencana_studi_matakuliah_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rencana_studi
    ADD CONSTRAINT rencana_studi_matakuliah_id FOREIGN KEY (matakuliah_id) REFERENCES matakuliah(id);


--
-- Name: retur retur_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retur
    ADD CONSTRAINT retur_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES payment(id);


--
-- Name: rombel rombel_dosenpa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rombel
    ADD CONSTRAINT rombel_dosenpa_id_fkey FOREIGN KEY (dosenpa_id) REFERENCES dosen(id);


--
-- Name: rombel rombel_paket_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rombel
    ADD CONSTRAINT rombel_paket_kelas_id_fkey FOREIGN KEY (paket_kelas_id) REFERENCES paket_kelas(id);


--
-- Name: rombel rombel_prodi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rombel
    ADD CONSTRAINT rombel_prodi_id_fkey FOREIGN KEY (prodi_id) REFERENCES prodi(id);


--
-- Name: rombel rombel_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rombel
    ADD CONSTRAINT rombel_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tahun_akademik(id);


--
-- Name: ruang ruang_gedung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ruang
    ADD CONSTRAINT ruang_gedung_id_fkey FOREIGN KEY (gedung_id) REFERENCES prasarana(id);


--
-- Name: seminar_ta seminar_ta_jenis_seminar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seminar_ta
    ADD CONSTRAINT seminar_ta_jenis_seminar_id_fkey FOREIGN KEY (jenis_seminar_id) REFERENCES jenis_seminar(id);


--
-- Name: seminar_ta seminar_ta_ta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seminar_ta
    ADD CONSTRAINT seminar_ta_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES tugas_akhir(id);


--
-- Name: khs_detail studi_mahasiswa_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY khs_detail
    ADD CONSTRAINT studi_mahasiswa_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES kelas(id);


--
-- Name: surat surat_jenis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY surat
    ADD CONSTRAINT surat_jenis_id_fkey FOREIGN KEY (jenis_id) REFERENCES jenis_surat(id);


--
-- Name: tarif tarif_idjenis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT tarif_idjenis_fkey FOREIGN KEY (idjenis) REFERENCES jenis_pembayaran(id);


--
-- Name: tarif tarif_idta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT tarif_idta_fkey FOREIGN KEY (idta) REFERENCES tahun_akademik(id);


--
-- Name: transkrip transkrip_mhs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transkrip
    ADD CONSTRAINT transkrip_mhs_id_fkey FOREIGN KEY (mhs_id) REFERENCES mahasiswa(mhsid);


--
-- Name: transkrip transkrip_mk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transkrip
    ADD CONSTRAINT transkrip_mk_id_fkey FOREIGN KEY (mk_id) REFERENCES matakuliah(id);


--
-- Name: tugas_akhir tugas_akhir_dosen_pembimbing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tugas_akhir
    ADD CONSTRAINT tugas_akhir_dosen_pembimbing_id_fkey FOREIGN KEY (dosen_pembimbing_id) REFERENCES dosen(id);


--
-- Name: tugas_akhir tugas_akhir_mhs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tugas_akhir
    ADD CONSTRAINT tugas_akhir_mhs_id_fkey FOREIGN KEY (mhs_id) REFERENCES mahasiswa(mhsid);


--
-- Name: tugas_akhir tugas_akhir_yudisium_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tugas_akhir
    ADD CONSTRAINT tugas_akhir_yudisium_id_fkey FOREIGN KEY (yudisium_id) REFERENCES yudisium(id);


--
-- Name: virtual_bank virtual_bank_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY virtual_bank
    ADD CONSTRAINT virtual_bank_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES bank(id);


--
-- Name: virtual_bank virtual_bank_jenis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY virtual_bank
    ADD CONSTRAINT virtual_bank_jenis_id_fkey FOREIGN KEY (jenis_id) REFERENCES jenis_pembayaran(id);


--
-- PostgreSQL database dump complete
--

