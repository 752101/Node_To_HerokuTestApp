--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.22
-- Dumped by pg_dump version 9.2.22
-- Started on 2017-09-05 16:56:17

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 10 (class 2615 OID 18363)
-- Name: HTSi_Owner; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "HTSi_Owner";


ALTER SCHEMA "HTSi_Owner" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 19694)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 3 (class 3079 OID 19680)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "HTSi_Owner";


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = "HTSi_Owner", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 18659)
-- Name: activeingredient; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE activeingredient (
    irn uuid NOT NULL,
    ingredientname character varying(50) NOT NULL,
    therapeuticclassirn uuid NOT NULL,
    measurementunitsirn_premix uuid NOT NULL,
    measurementunitsirn_ingred uuid NOT NULL,
    premixquantity numeric(28,10) NOT NULL,
    quantity numeric(28,10) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".activeingredient OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19646)
-- Name: activitylog; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE activitylog (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    source character(10) NOT NULL,
    activitytypeirn uuid NOT NULL,
    status bit(1) NOT NULL,
    notes text,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".activitylog OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 19638)
-- Name: activitytype; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE activitytype (
    irn uuid NOT NULL,
    activityid integer NOT NULL,
    activitytype character(20) NOT NULL,
    activitydescription text NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".activitytype OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 18390)
-- Name: affiliatecountries; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE affiliatecountries (
    irn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    affiliatecountryname character varying(40) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".affiliatecountries OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 18370)
-- Name: affiliates; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE affiliates (
    irn uuid NOT NULL,
    affiliatecode character(20) NOT NULL,
    affiliatename character varying(40) NOT NULL,
    regionsirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".affiliates OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 18415)
-- Name: breeds; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE breeds (
    irn uuid NOT NULL,
    breedname character varying(40) NOT NULL,
    specietypesirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".breeds OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18694)
-- Name: customerlocations; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE customerlocations (
    irn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    customersirn uuid NOT NULL,
    customerlocationcode character(20) NOT NULL,
    customerlocationname character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    city character varying(40) NOT NULL,
    state character varying(10) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".customerlocations OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18684)
-- Name: customers; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE customers (
    irn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    customercode character(20) NOT NULL,
    customername character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    city character varying(40) NOT NULL,
    state character varying(10) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".customers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19623)
-- Name: errorlog; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE errorlog (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    errortypeirn uuid NOT NULL,
    errordate timestamp without time zone NOT NULL,
    source character(10) NOT NULL,
    status bit(1) NOT NULL,
    contactdetails character varying(20),
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".errorlog OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 19600)
-- Name: errortype; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE errortype (
    irn uuid NOT NULL,
    errorcode character varying(20) NOT NULL,
    errortype character varying(20) NOT NULL,
    errordescription text NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".errortype OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18819)
-- Name: healthprogramclasses; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE healthprogramclasses (
    irn uuid NOT NULL,
    healthprogramphasesirn uuid NOT NULL,
    therapeuticclassirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".healthprogramclasses OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18834)
-- Name: healthprogramentries; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE healthprogramentries (
    irn uuid NOT NULL,
    healthprogramclassesirn uuid NOT NULL,
    activeingredientirn uuid NOT NULL,
    manufacturerirn uuid NOT NULL,
    dosage numeric(28,10) NOT NULL,
    measurementunitsirn uuid,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".healthprogramentries OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18799)
-- Name: healthprogramphases; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE healthprogramphases (
    irn uuid NOT NULL,
    healthprogramsirn uuid NOT NULL,
    phaseirn uuid NOT NULL,
    healthprogramtypeirn uuid NOT NULL,
    startage integer NOT NULL,
    endage integer NOT NULL,
    comment character varying(255),
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".healthprogramphases OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18754)
-- Name: healthprograms; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE healthprograms (
    irn uuid NOT NULL,
    programname character varying(40) NOT NULL,
    healthprogramtypeirn uuid NOT NULL,
    durationdays integer NOT NULL,
    effectivestartdate timestamp without time zone NOT NULL,
    effectiveenddate timestamp without time zone NOT NULL,
    breedsirn uuid,
    customerlocationsirn uuid NOT NULL,
    speciestypeirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    markettypeirn uuid NOT NULL,
    targetweightrangeirn uuid NOT NULL,
    measurementunitsirn uuid,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".healthprograms OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18709)
-- Name: healthprogramtype; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE healthprogramtype (
    irn uuid NOT NULL,
    programtypecode character(20) NOT NULL,
    programtypename character varying(40) NOT NULL,
    startdate integer NOT NULL,
    enddate integer NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".healthprogramtype OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 18579)
-- Name: lesionbyuser; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesionbyuser (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    lesionsirn uuid NOT NULL,
    "Order" integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesionbyuser OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 18443)
-- Name: lesiongroups; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesiongroups (
    irn uuid NOT NULL,
    groupname character varying(30) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesiongroups OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 18448)
-- Name: lesions; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesions (
    irn uuid NOT NULL,
    lesioncode character(20) NOT NULL,
    lesionname character varying(40) NOT NULL,
    lesioncodedescription character varying(255),
    defaultscore numeric(28,10) NOT NULL,
    minscore numeric(28,10) NOT NULL,
    maxscore numeric(28,10) NOT NULL,
    lesionscoretypesirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 18534)
-- Name: lesionsbyaffiliates; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesionsbyaffiliates (
    irn uuid NOT NULL,
    lesionsirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    measurementunitsirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesionsbyaffiliates OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 18554)
-- Name: lesionsbygroups; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesionsbygroups (
    irn uuid NOT NULL,
    lesionsirn uuid NOT NULL,
    lesiongroupsirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesionsbygroups OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 18458)
-- Name: lesionscores; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesionscores (
    irn uuid NOT NULL,
    lesionsirn uuid NOT NULL,
    score integer NOT NULL,
    creationdate timestamp without time zone,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesionscores OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 18438)
-- Name: lesionscoretypes; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE lesionscoretypes (
    irn uuid NOT NULL,
    scoretype integer NOT NULL,
    scoretypedescription character varying(20) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".lesionscoretypes OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18679)
-- Name: manufacturers; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE manufacturers (
    irn uuid NOT NULL,
    manufacturername character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".manufacturers OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 18425)
-- Name: markettype; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE markettype (
    irn uuid NOT NULL,
    markettype character varying(50) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".markettype OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 18483)
-- Name: measurementcategories; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE measurementcategories (
    irn uuid NOT NULL,
    measurementcategorycode character(20) NOT NULL,
    measurementcategoryname character varying(200) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".measurementcategories OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 18498)
-- Name: measurementconversions; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE measurementconversions (
    irn uuid NOT NULL,
    measurementconversioncode character(20) NOT NULL,
    measurementconversionname character varying(40) NOT NULL,
    measurementunitsirn_src uuid NOT NULL,
    measurementunitsirn_dest uuid,
    activeflag bit(1) NOT NULL,
    factor numeric(28,10) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".measurementconversions OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 18513)
-- Name: measurementgroups; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE measurementgroups (
    irn uuid NOT NULL,
    measurementgroupcode character(20) NOT NULL,
    measurementgroupname character varying(40) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".measurementgroups OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 18518)
-- Name: measurementunitgroups; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE measurementunitgroups (
    irn uuid NOT NULL,
    code character(20) NOT NULL,
    measurementunitgroupname character varying(40) NOT NULL,
    measurementgroupsirn uuid NOT NULL,
    measurementunitsirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".measurementunitgroups OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 18488)
-- Name: measurementunits; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE measurementunits (
    irn uuid NOT NULL,
    measurementunitcode character(20) NOT NULL,
    measurementunitname character varying(40) NOT NULL,
    measurementcategoriesirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".measurementunits OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 18634)
-- Name: module; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE module (
    irn uuid NOT NULL,
    modulename character varying(20) NOT NULL,
    moduletypename character varying(20) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".module OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 18639)
-- Name: moduleassignbyrole; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE moduleassignbyrole (
    irn uuid NOT NULL,
    rolesirn uuid NOT NULL,
    moduleirn uuid NOT NULL,
    addpermission bit(1) NOT NULL,
    modifypermission bit(1) NOT NULL,
    deletepermission bit(1) NOT NULL,
    selectpermission bit(1) NOT NULL,
    version integer NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".moduleassignbyrole OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18714)
-- Name: phase; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE phase (
    irn uuid NOT NULL,
    phasename character varying(50) NOT NULL,
    phasedescription character varying(50) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".phase OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18719)
-- Name: phaseclass; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE phaseclass (
    irn uuid NOT NULL,
    phaseirn uuid NOT NULL,
    therapeuticclassirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".phaseclass OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 19117)
-- Name: postingsessionentries; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE postingsessionentries (
    irn uuid NOT NULL,
    protienentitiesirn uuid NOT NULL,
    birdno integer NOT NULL,
    comment text,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL,
    u_ne uuid,
    u_th uuid,
    u_ld uuid,
    u_trc uuid,
    u_pr uuid,
    u_cap uuid,
    u_rw uuid,
    u_liv uuid,
    u_sc uuid,
    u_bt uuid,
    u_bnm uuid,
    u_bl uuid,
    u_rkt uuid,
    u_ip uuid,
    u_ol uuid,
    u_mc uuid,
    u_clr uuid,
    u_tds uuid,
    u_ceca numeric(28,10) NOT NULL,
    u_ab uuid,
    u_le uuid,
    u_bact numeric(28,10) NOT NULL,
    u_gmx uuid,
    u_cbs uuid,
    u_gtn uuid,
    u_wc uuid,
    u_eod uuid,
    u_eoc uuid,
    u_tn uuid,
    u_ccs uuid,
    u_fh uuid,
    u_gmi uuid,
    u_gac uuid,
    u_cs uuid,
    u_eoj uuid,
    u_bur uuid,
    u_dc uuid,
    u_mtc uuid,
    u_bmr uuid,
    u_mmx uuid,
    u_bdm uuid,
    u_bb uuid,
    u_bf uuid,
    u_ac uuid,
    u_om uuid,
    u_tk uuid,
    u_ml uuid,
    u_sns uuid,
    u_it uuid,
    u_thy uuid,
    u_gbr uuid,
    u_giz uuid,
    u_pnu uuid,
    u_cl uuid,
    u_gnx uuid,
    u_ent uuid,
    u_fp uuid,
    u_tw uuid,
    u_sh uuid,
    u_bsm uuid,
    u_ccc uuid,
    u_cca uuid,
    u_pl uuid,
    u_bpe uuid,
    u_cm uuid,
    u_sx uuid,
    u_ce uuid,
    u_i2_t numeric(28,10) NOT NULL,
    u_prv uuid,
    u_htk uuid,
    u_cwt uuid,
    u_cgy uuid,
    u_hk uuid,
    u_cdv uuid,
    u_ry uuid,
    u_coh uuid,
    u_hex uuid,
    u_btl uuid,
    u_rc numeric(28,10) NOT NULL,
    u_ap uuid,
    u_ars uuid,
    u_cfm uuid,
    u_bls uuid,
    u_am uuid,
    u_het uuid,
    u_tra uuid,
    u_ncp numeric(28,10) NOT NULL,
    u_bps uuid,
    u_ctn uuid,
    u_ctk uuid,
    u_ri numeric(28,10) NOT NULL,
    u_ie uuid,
    u_hy uuid,
    u_ih uuid,
    u_i2_v1 numeric(28,10) NOT NULL,
    u_i2 numeric(28,10) NOT NULL,
    u_bow numeric(28,10),
    u_spw numeric(28,10),
    u_b numeric(28,10),
    u_a numeric(28,10),
    u_box numeric(28,10),
    u_buw numeric(28,10),
    u_l numeric(28,10),
    u_gul numeric(28,10),
    u_guw numeric(28,10)
);


ALTER TABLE "HTSi_Owner".postingsessionentries OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18934)
-- Name: postingsessions; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE postingsessions (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    postingdate timestamp without time zone NOT NULL,
    affiliatesirn uuid NOT NULL,
    markettypeirn uuid NOT NULL,
    targetweightrangeirn uuid NOT NULL,
    feedprogramirn uuid,
    waterprogramirn uuid,
    vaccineprogramirn uuid,
    status character(10) NOT NULL,
    comment text,
    customersirn uuid NOT NULL,
    customerlocationsirn uuid NOT NULL,
    lockedflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".postingsessions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18860)
-- Name: proteinfarms; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE proteinfarms (
    irn uuid NOT NULL,
    farmno character(20) NOT NULL,
    proteinfarmname character(40) NOT NULL,
    customerlocationsirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    "No.ofhouses" integer NOT NULL,
    activeflag bit(1) NOT NULL,
    address character varying(30) NOT NULL,
    address2 character varying(30) NOT NULL,
    city character varying(40) NOT NULL,
    state character varying(40) NOT NULL,
    zip character(10),
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".proteinfarms OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18875)
-- Name: proteinhouses; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE proteinhouses (
    irn uuid NOT NULL,
    houseno character(20) NOT NULL,
    proteinfarmsirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".proteinhouses OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19072)
-- Name: protienentities; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE protienentities (
    irn uuid NOT NULL,
    proteinfarmsirn uuid NOT NULL,
    proteinhousesirn uuid NOT NULL,
    breedsirn uuid,
    healthprogramsirn uuid,
    specietypesirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    diagnostician uuid NOT NULL,
    postingsessionsirn uuid NOT NULL,
    flockid integer NOT NULL,
    activeflag bit(1) NOT NULL,
    dateplaced timestamp without time zone NOT NULL,
    entityno character varying(40) NOT NULL,
    numberofbirds integer NOT NULL,
    normalflockflag bit(1) NOT NULL,
    birdage integer NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".protienentities OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 18365)
-- Name: regions; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE regions (
    irn uuid NOT NULL,
    regioncode character(20) NOT NULL,
    regionname character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".regions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19580)
-- Name: reportprofile; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE reportprofile (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    chartno integer NOT NULL,
    lesiongroupsirn uuid NOT NULL,
    lesionsirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".reportprofile OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 18614)
-- Name: roleassignbyaffliateregion; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE roleassignbyaffliateregion (
    irn uuid NOT NULL,
    rolesirn uuid NOT NULL,
    affiliatesirn uuid NOT NULL,
    regionsirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".roleassignbyaffliateregion OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 18594)
-- Name: roles; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    irn uuid NOT NULL,
    role character(50) NOT NULL,
    roledescription character varying(255) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".roles OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 18400)
-- Name: species; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE species (
    irn uuid NOT NULL,
    speciescode character(20) NOT NULL,
    speciesname character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".species OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 18405)
-- Name: specietypes; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE specietypes (
    irn uuid NOT NULL,
    specietypename character varying(40) NOT NULL,
    speciesirn uuid NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".specietypes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 19665)
-- Name: synchronization; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE synchronization (
    irn uuid NOT NULL,
    usersirn uuid NOT NULL,
    source character(10) NOT NULL,
    status bit(1) NOT NULL,
    machinename character varying(50) NOT NULL,
    errortypeirn uuid NOT NULL,
    lastsyncdate timestamp without time zone NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".synchronization OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 18430)
-- Name: targetweightrange; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE targetweightrange (
    irn uuid NOT NULL,
    targetweightrange text NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".targetweightrange OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18654)
-- Name: therapeuticclass; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE therapeuticclass (
    irn uuid NOT NULL,
    therapeuticclasscode character(20) NOT NULL,
    therapeuticclassname character varying(40) NOT NULL,
    activeflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".therapeuticclass OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 18599)
-- Name: userroles; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE userroles (
    irn uuid NOT NULL,
    rolesirn uuid NOT NULL,
    usersirn uuid NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".userroles OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 18574)
-- Name: users; Type: TABLE; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    irn uuid NOT NULL,
    userid character(30) NOT NULL,
    username character(10) NOT NULL,
    activeflag bit(1) NOT NULL,
    emailid character varying(255),
    phonenumber integer,
    adminflag bit(1) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    creationuserid character(10) NOT NULL,
    lastmoduserid character(10) NOT NULL,
    lastmoddate timestamp without time zone NOT NULL
);


ALTER TABLE "HTSi_Owner".users OWNER TO postgres;

--
-- TOC entry 2161 (class 2606 OID 18663)
-- Name: activeingredient_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activeingredient
    ADD CONSTRAINT activeingredient_pkey PRIMARY KEY (irn);


--
-- TOC entry 2237 (class 2606 OID 19653)
-- Name: activitylog_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activitylog
    ADD CONSTRAINT activitylog_pkey PRIMARY KEY (irn);


--
-- TOC entry 2233 (class 2606 OID 19645)
-- Name: activitytype_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activitytype
    ADD CONSTRAINT activitytype_pkey PRIMARY KEY (irn);


--
-- TOC entry 2061 (class 2606 OID 18394)
-- Name: affiliatecountries_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY affiliatecountries
    ADD CONSTRAINT affiliatecountries_pkey PRIMARY KEY (irn);


--
-- TOC entry 2057 (class 2606 OID 18374)
-- Name: affiliates_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY affiliates
    ADD CONSTRAINT affiliates_pkey PRIMARY KEY (irn);


--
-- TOC entry 2073 (class 2606 OID 18419)
-- Name: breeds_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY breeds
    ADD CONSTRAINT breeds_pkey PRIMARY KEY (irn);


--
-- TOC entry 2173 (class 2606 OID 18698)
-- Name: customerlocations_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customerlocations
    ADD CONSTRAINT customerlocations_pkey PRIMARY KEY (irn);


--
-- TOC entry 2169 (class 2606 OID 18688)
-- Name: customers_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (irn);


--
-- TOC entry 2231 (class 2606 OID 19627)
-- Name: errorlog_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errorlog
    ADD CONSTRAINT errorlog_pkey PRIMARY KEY (irn);


--
-- TOC entry 2227 (class 2606 OID 19607)
-- Name: errortype_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errortype
    ADD CONSTRAINT errortype_pkey PRIMARY KEY (irn);


--
-- TOC entry 2197 (class 2606 OID 18823)
-- Name: healthprogramclasses_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramclasses
    ADD CONSTRAINT healthprogramclasses_pkey PRIMARY KEY (irn);


--
-- TOC entry 2201 (class 2606 OID 18838)
-- Name: healthprogramentries_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT healthprogramentries_pkey PRIMARY KEY (irn);


--
-- TOC entry 2193 (class 2606 OID 18803)
-- Name: healthprogramphases_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramphases
    ADD CONSTRAINT healthprogramphases_pkey PRIMARY KEY (irn);


--
-- TOC entry 2189 (class 2606 OID 18758)
-- Name: healthprograms_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_pkey PRIMARY KEY (irn);


--
-- TOC entry 2177 (class 2606 OID 18713)
-- Name: healthprogramtype_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramtype
    ADD CONSTRAINT healthprogramtype_pkey PRIMARY KEY (irn);


--
-- TOC entry 2133 (class 2606 OID 18583)
-- Name: lesionbyuser_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionbyuser
    ADD CONSTRAINT lesionbyuser_pkey PRIMARY KEY (irn);


--
-- TOC entry 2089 (class 2606 OID 18447)
-- Name: lesiongroups_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesiongroups
    ADD CONSTRAINT lesiongroups_pkey PRIMARY KEY (irn);


--
-- TOC entry 2093 (class 2606 OID 18452)
-- Name: lesions_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesions
    ADD CONSTRAINT lesions_pkey PRIMARY KEY (irn);


--
-- TOC entry 2121 (class 2606 OID 18538)
-- Name: lesionsbyaffiliates_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionsbyaffiliates
    ADD CONSTRAINT lesionsbyaffiliates_pkey PRIMARY KEY (irn);


--
-- TOC entry 2125 (class 2606 OID 18558)
-- Name: lesionsbygroups_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionsbygroups
    ADD CONSTRAINT lesionsbygroups_pkey PRIMARY KEY (irn);


--
-- TOC entry 2097 (class 2606 OID 18462)
-- Name: lesionscores_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionscores
    ADD CONSTRAINT lesionscores_pkey PRIMARY KEY (irn);


--
-- TOC entry 2085 (class 2606 OID 18442)
-- Name: lesionscoretypes_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionscoretypes
    ADD CONSTRAINT lesionscoretypes_pkey PRIMARY KEY (irn);


--
-- TOC entry 2165 (class 2606 OID 18683)
-- Name: manufacturers_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (irn);


--
-- TOC entry 2077 (class 2606 OID 18429)
-- Name: markettype_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY markettype
    ADD CONSTRAINT markettype_pkey PRIMARY KEY (irn);


--
-- TOC entry 2101 (class 2606 OID 18487)
-- Name: measurementcategories_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementcategories
    ADD CONSTRAINT measurementcategories_pkey PRIMARY KEY (irn);


--
-- TOC entry 2109 (class 2606 OID 18502)
-- Name: measurementconversions_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementconversions
    ADD CONSTRAINT measurementconversions_pkey PRIMARY KEY (irn);


--
-- TOC entry 2113 (class 2606 OID 18517)
-- Name: measurementgroups_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementgroups
    ADD CONSTRAINT measurementgroups_pkey PRIMARY KEY (irn);


--
-- TOC entry 2117 (class 2606 OID 18522)
-- Name: measurementunitgroups_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementunitgroups
    ADD CONSTRAINT measurementunitgroups_pkey PRIMARY KEY (irn);


--
-- TOC entry 2105 (class 2606 OID 18492)
-- Name: measurementunits_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementunits
    ADD CONSTRAINT measurementunits_pkey PRIMARY KEY (irn);


--
-- TOC entry 2149 (class 2606 OID 18638)
-- Name: module_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT module_pkey PRIMARY KEY (irn);


--
-- TOC entry 2153 (class 2606 OID 18643)
-- Name: moduleassignbyrole_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moduleassignbyrole
    ADD CONSTRAINT moduleassignbyrole_pkey PRIMARY KEY (irn);


--
-- TOC entry 2181 (class 2606 OID 18718)
-- Name: phase_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phase
    ADD CONSTRAINT phase_pkey PRIMARY KEY (irn);


--
-- TOC entry 2185 (class 2606 OID 18723)
-- Name: phaseclass_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phaseclass
    ADD CONSTRAINT phaseclass_pkey PRIMARY KEY (irn);


--
-- TOC entry 2221 (class 2606 OID 19124)
-- Name: postingsessionentries_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_pkey PRIMARY KEY (irn);


--
-- TOC entry 2213 (class 2606 OID 18941)
-- Name: postingsessions_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_pkey PRIMARY KEY (irn);


--
-- TOC entry 2205 (class 2606 OID 18864)
-- Name: proteinfarms_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proteinfarms
    ADD CONSTRAINT proteinfarms_pkey PRIMARY KEY (irn);


--
-- TOC entry 2209 (class 2606 OID 18879)
-- Name: proteinhouses_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proteinhouses
    ADD CONSTRAINT proteinhouses_pkey PRIMARY KEY (irn);


--
-- TOC entry 2217 (class 2606 OID 19076)
-- Name: protienentities_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_pkey PRIMARY KEY (irn);


--
-- TOC entry 2053 (class 2606 OID 18369)
-- Name: regions_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (irn);


--
-- TOC entry 2225 (class 2606 OID 19584)
-- Name: reportprofile_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reportprofile
    ADD CONSTRAINT reportprofile_pkey PRIMARY KEY (irn);


--
-- TOC entry 2145 (class 2606 OID 18618)
-- Name: roleassignbyaffliateregion_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roleassignbyaffliateregion
    ADD CONSTRAINT roleassignbyaffliateregion_pkey PRIMARY KEY (irn);


--
-- TOC entry 2137 (class 2606 OID 18598)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (irn);


--
-- TOC entry 2065 (class 2606 OID 18404)
-- Name: species_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY species
    ADD CONSTRAINT species_pkey PRIMARY KEY (irn);


--
-- TOC entry 2069 (class 2606 OID 18409)
-- Name: specietypes_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY specietypes
    ADD CONSTRAINT specietypes_pkey PRIMARY KEY (irn);


--
-- TOC entry 2239 (class 2606 OID 19669)
-- Name: synchronization_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY synchronization
    ADD CONSTRAINT synchronization_pkey PRIMARY KEY (irn);


--
-- TOC entry 2081 (class 2606 OID 18437)
-- Name: targetweightrange_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY targetweightrange
    ADD CONSTRAINT targetweightrange_pkey PRIMARY KEY (irn);


--
-- TOC entry 2157 (class 2606 OID 18658)
-- Name: therapeuticclass_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY therapeuticclass
    ADD CONSTRAINT therapeuticclass_pkey PRIMARY KEY (irn);


--
-- TOC entry 2163 (class 2606 OID 19762)
-- Name: uk_activeingredient; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activeingredient
    ADD CONSTRAINT uk_activeingredient UNIQUE (ingredientname, therapeuticclassirn);


--
-- TOC entry 2235 (class 2606 OID 19824)
-- Name: uk_activitytype; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activitytype
    ADD CONSTRAINT uk_activitytype UNIQUE (activityid);


--
-- TOC entry 2063 (class 2606 OID 19786)
-- Name: uk_affiliatecountries; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY affiliatecountries
    ADD CONSTRAINT uk_affiliatecountries UNIQUE (affiliatecountryname);


--
-- TOC entry 2059 (class 2606 OID 19782)
-- Name: uk_affiliates; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY affiliates
    ADD CONSTRAINT uk_affiliates UNIQUE (affiliatename);


--
-- TOC entry 2075 (class 2606 OID 19792)
-- Name: uk_breeds; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY breeds
    ADD CONSTRAINT uk_breeds UNIQUE (breedname);


--
-- TOC entry 2175 (class 2606 OID 19780)
-- Name: uk_customerlocations; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customerlocations
    ADD CONSTRAINT uk_customerlocations UNIQUE (customersirn, customerlocationname);


--
-- TOC entry 2171 (class 2606 OID 19778)
-- Name: uk_customers; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT uk_customers UNIQUE (customername);


--
-- TOC entry 2229 (class 2606 OID 19826)
-- Name: uk_errortype; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY errortype
    ADD CONSTRAINT uk_errortype UNIQUE (errorcode);


--
-- TOC entry 2199 (class 2606 OID 19752)
-- Name: uk_healthprogramclasses; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramclasses
    ADD CONSTRAINT uk_healthprogramclasses UNIQUE (healthprogramphasesirn, therapeuticclassirn);


--
-- TOC entry 2203 (class 2606 OID 19754)
-- Name: uk_healthprogramentries; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT uk_healthprogramentries UNIQUE (healthprogramclassesirn, activeingredientirn);


--
-- TOC entry 2195 (class 2606 OID 19750)
-- Name: uk_healthprogramphases; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramphases
    ADD CONSTRAINT uk_healthprogramphases UNIQUE (healthprogramsirn, phaseirn, healthprogramtypeirn);


--
-- TOC entry 2191 (class 2606 OID 19748)
-- Name: uk_healthprograms; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT uk_healthprograms UNIQUE (programname, healthprogramtypeirn, customerlocationsirn);


--
-- TOC entry 2179 (class 2606 OID 19756)
-- Name: uk_healthprogramtype; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY healthprogramtype
    ADD CONSTRAINT uk_healthprogramtype UNIQUE (programtypecode);


--
-- TOC entry 2135 (class 2606 OID 19810)
-- Name: uk_lesionbyuser; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionbyuser
    ADD CONSTRAINT uk_lesionbyuser UNIQUE (usersirn, lesionsirn);


--
-- TOC entry 2091 (class 2606 OID 19804)
-- Name: uk_lesiongroups; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesiongroups
    ADD CONSTRAINT uk_lesiongroups UNIQUE (groupname);


--
-- TOC entry 2095 (class 2606 OID 19798)
-- Name: uk_lesions; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesions
    ADD CONSTRAINT uk_lesions UNIQUE (lesioncode);


--
-- TOC entry 2123 (class 2606 OID 19808)
-- Name: uk_lesionsbyaffiliates; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionsbyaffiliates
    ADD CONSTRAINT uk_lesionsbyaffiliates UNIQUE (lesionsirn, affiliatesirn);


--
-- TOC entry 2127 (class 2606 OID 19806)
-- Name: uk_lesionsbygroups; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionsbygroups
    ADD CONSTRAINT uk_lesionsbygroups UNIQUE (lesionsirn, lesiongroupsirn);


--
-- TOC entry 2099 (class 2606 OID 19800)
-- Name: uk_lesionscores; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionscores
    ADD CONSTRAINT uk_lesionscores UNIQUE (lesionsirn, score);


--
-- TOC entry 2087 (class 2606 OID 19802)
-- Name: uk_lesionscoretypes; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lesionscoretypes
    ADD CONSTRAINT uk_lesionscoretypes UNIQUE (scoretype);


--
-- TOC entry 2167 (class 2606 OID 19764)
-- Name: uk_manufacturers; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manufacturers
    ADD CONSTRAINT uk_manufacturers UNIQUE (manufacturername);


--
-- TOC entry 2079 (class 2606 OID 19794)
-- Name: uk_markettype; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY markettype
    ADD CONSTRAINT uk_markettype UNIQUE (markettype);


--
-- TOC entry 2103 (class 2606 OID 19770)
-- Name: uk_measurementcategories; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementcategories
    ADD CONSTRAINT uk_measurementcategories UNIQUE (measurementcategorycode, measurementcategoryname);


--
-- TOC entry 2111 (class 2606 OID 19772)
-- Name: uk_measurementconversions; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementconversions
    ADD CONSTRAINT uk_measurementconversions UNIQUE (measurementconversionname);


--
-- TOC entry 2115 (class 2606 OID 19774)
-- Name: uk_measurementgroups; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementgroups
    ADD CONSTRAINT uk_measurementgroups UNIQUE (measurementgroupname);


--
-- TOC entry 2119 (class 2606 OID 19776)
-- Name: uk_measurementunitgroups; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementunitgroups
    ADD CONSTRAINT uk_measurementunitgroups UNIQUE (measurementgroupsirn, measurementunitsirn);


--
-- TOC entry 2107 (class 2606 OID 19768)
-- Name: uk_measurementunits; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY measurementunits
    ADD CONSTRAINT uk_measurementunits UNIQUE (measurementunitcode);


--
-- TOC entry 2151 (class 2606 OID 19820)
-- Name: uk_module; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY module
    ADD CONSTRAINT uk_module UNIQUE (modulename);


--
-- TOC entry 2155 (class 2606 OID 19822)
-- Name: uk_moduleassignbyrole; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY moduleassignbyrole
    ADD CONSTRAINT uk_moduleassignbyrole UNIQUE (rolesirn, moduleirn);


--
-- TOC entry 2183 (class 2606 OID 19758)
-- Name: uk_phase; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phase
    ADD CONSTRAINT uk_phase UNIQUE (phasename);


--
-- TOC entry 2187 (class 2606 OID 19760)
-- Name: uk_phaseclass; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phaseclass
    ADD CONSTRAINT uk_phaseclass UNIQUE (phaseirn, therapeuticclassirn);


--
-- TOC entry 2223 (class 2606 OID 19740)
-- Name: uk_postingsessionentries; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT uk_postingsessionentries UNIQUE (protienentitiesirn, birdno);


--
-- TOC entry 2215 (class 2606 OID 19738)
-- Name: uk_postingsessions; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT uk_postingsessions UNIQUE (usersirn, postingdate, customersirn, customerlocationsirn);


--
-- TOC entry 2207 (class 2606 OID 19742)
-- Name: uk_proteinfarms; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proteinfarms
    ADD CONSTRAINT uk_proteinfarms UNIQUE (proteinfarmname, customerlocationsirn);


--
-- TOC entry 2211 (class 2606 OID 19744)
-- Name: uk_proteinhouses; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proteinhouses
    ADD CONSTRAINT uk_proteinhouses UNIQUE (houseno, proteinfarmsirn);


--
-- TOC entry 2219 (class 2606 OID 19746)
-- Name: uk_protienentities; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT uk_protienentities UNIQUE (proteinfarmsirn, proteinhousesirn, postingsessionsirn);


--
-- TOC entry 2055 (class 2606 OID 19784)
-- Name: uk_regions; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT uk_regions UNIQUE (regionname);


--
-- TOC entry 2147 (class 2606 OID 19818)
-- Name: uk_roleassignbyaffliateregion; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roleassignbyaffliateregion
    ADD CONSTRAINT uk_roleassignbyaffliateregion UNIQUE (rolesirn, affiliatesirn, regionsirn);


--
-- TOC entry 2139 (class 2606 OID 19814)
-- Name: uk_roles; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT uk_roles UNIQUE (role);


--
-- TOC entry 2067 (class 2606 OID 19788)
-- Name: uk_species; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY species
    ADD CONSTRAINT uk_species UNIQUE (speciesname);


--
-- TOC entry 2071 (class 2606 OID 19790)
-- Name: uk_specietypes; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY specietypes
    ADD CONSTRAINT uk_specietypes UNIQUE (specietypename, speciesirn);


--
-- TOC entry 2083 (class 2606 OID 19796)
-- Name: uk_targetweightrange; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY targetweightrange
    ADD CONSTRAINT uk_targetweightrange UNIQUE (targetweightrange);


--
-- TOC entry 2159 (class 2606 OID 19766)
-- Name: uk_therapeuticclass; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY therapeuticclass
    ADD CONSTRAINT uk_therapeuticclass UNIQUE (therapeuticclasscode);


--
-- TOC entry 2141 (class 2606 OID 19816)
-- Name: uk_userroles; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT uk_userroles UNIQUE (rolesirn, usersirn);


--
-- TOC entry 2129 (class 2606 OID 19812)
-- Name: uk_users; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_users UNIQUE (userid);


--
-- TOC entry 2143 (class 2606 OID 18603)
-- Name: userroles_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (irn);


--
-- TOC entry 2131 (class 2606 OID 18578)
-- Name: users_pkey; Type: CONSTRAINT; Schema: HTSi_Owner; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (irn);


--
-- TOC entry 2265 (class 2606 OID 18674)
-- Name: activeingredient_measurementunitsirn_ingred_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY activeingredient
    ADD CONSTRAINT activeingredient_measurementunitsirn_ingred_fkey FOREIGN KEY (measurementunitsirn_ingred) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2266 (class 2606 OID 18669)
-- Name: activeingredient_measurementunitsirn_premix_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY activeingredient
    ADD CONSTRAINT activeingredient_measurementunitsirn_premix_fkey FOREIGN KEY (measurementunitsirn_premix) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2267 (class 2606 OID 18664)
-- Name: activeingredient_therapeuticclassirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY activeingredient
    ADD CONSTRAINT activeingredient_therapeuticclassirn_fkey FOREIGN KEY (therapeuticclassirn) REFERENCES therapeuticclass(irn) MATCH FULL;


--
-- TOC entry 2405 (class 2606 OID 19659)
-- Name: activitylog_activitytypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY activitylog
    ADD CONSTRAINT activitylog_activitytypeirn_fkey FOREIGN KEY (activitytypeirn) REFERENCES activitytype(irn) MATCH FULL;


--
-- TOC entry 2406 (class 2606 OID 19654)
-- Name: activitylog_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY activitylog
    ADD CONSTRAINT activitylog_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2241 (class 2606 OID 18395)
-- Name: affiliatecountries_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY affiliatecountries
    ADD CONSTRAINT affiliatecountries_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn);


--
-- TOC entry 2240 (class 2606 OID 18375)
-- Name: affiliates_regionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY affiliates
    ADD CONSTRAINT affiliates_regionsirn_fkey FOREIGN KEY (regionsirn) REFERENCES regions(irn);


--
-- TOC entry 2243 (class 2606 OID 18420)
-- Name: breeds_specietypesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY breeds
    ADD CONSTRAINT breeds_specietypesirn_fkey FOREIGN KEY (specietypesirn) REFERENCES specietypes(irn);


--
-- TOC entry 2270 (class 2606 OID 18699)
-- Name: customerlocations_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY customerlocations
    ADD CONSTRAINT customerlocations_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2269 (class 2606 OID 18704)
-- Name: customerlocations_customersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY customerlocations
    ADD CONSTRAINT customerlocations_customersirn_fkey FOREIGN KEY (customersirn) REFERENCES customers(irn) MATCH FULL;


--
-- TOC entry 2268 (class 2606 OID 18689)
-- Name: customers_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2403 (class 2606 OID 19633)
-- Name: errorlog_errortypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY errorlog
    ADD CONSTRAINT errorlog_errortypeirn_fkey FOREIGN KEY (errortypeirn) REFERENCES errortype(irn) MATCH FULL;


--
-- TOC entry 2404 (class 2606 OID 19628)
-- Name: errorlog_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY errorlog
    ADD CONSTRAINT errorlog_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2285 (class 2606 OID 18824)
-- Name: healthprogramclasses_healthprogramphasesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramclasses
    ADD CONSTRAINT healthprogramclasses_healthprogramphasesirn_fkey FOREIGN KEY (healthprogramphasesirn) REFERENCES healthprogramphases(irn) MATCH FULL;


--
-- TOC entry 2284 (class 2606 OID 18829)
-- Name: healthprogramclasses_therapeuticclassirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramclasses
    ADD CONSTRAINT healthprogramclasses_therapeuticclassirn_fkey FOREIGN KEY (therapeuticclassirn) REFERENCES therapeuticclass(irn) MATCH FULL;


--
-- TOC entry 2288 (class 2606 OID 18844)
-- Name: healthprogramentries_activeingredientirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT healthprogramentries_activeingredientirn_fkey FOREIGN KEY (activeingredientirn) REFERENCES activeingredient(irn) MATCH FULL;


--
-- TOC entry 2289 (class 2606 OID 18839)
-- Name: healthprogramentries_healthprogramclassesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT healthprogramentries_healthprogramclassesirn_fkey FOREIGN KEY (healthprogramclassesirn) REFERENCES healthprogramclasses(irn) MATCH FULL;


--
-- TOC entry 2287 (class 2606 OID 18849)
-- Name: healthprogramentries_manufacturerirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT healthprogramentries_manufacturerirn_fkey FOREIGN KEY (manufacturerirn) REFERENCES manufacturers(irn) MATCH FULL;


--
-- TOC entry 2286 (class 2606 OID 18854)
-- Name: healthprogramentries_measurementunitsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramentries
    ADD CONSTRAINT healthprogramentries_measurementunitsirn_fkey FOREIGN KEY (measurementunitsirn) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2283 (class 2606 OID 18804)
-- Name: healthprogramphases_healthprogramsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramphases
    ADD CONSTRAINT healthprogramphases_healthprogramsirn_fkey FOREIGN KEY (healthprogramsirn) REFERENCES healthprograms(irn) MATCH FULL;


--
-- TOC entry 2281 (class 2606 OID 18814)
-- Name: healthprogramphases_healthprogramtypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramphases
    ADD CONSTRAINT healthprogramphases_healthprogramtypeirn_fkey FOREIGN KEY (healthprogramtypeirn) REFERENCES healthprogramtype(irn) MATCH FULL;


--
-- TOC entry 2282 (class 2606 OID 18809)
-- Name: healthprogramphases_phaseirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprogramphases
    ADD CONSTRAINT healthprogramphases_phaseirn_fkey FOREIGN KEY (phaseirn) REFERENCES phase(irn) MATCH FULL;


--
-- TOC entry 2276 (class 2606 OID 18779)
-- Name: healthprograms_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2279 (class 2606 OID 18764)
-- Name: healthprograms_breedsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_breedsirn_fkey FOREIGN KEY (breedsirn) REFERENCES breeds(irn) MATCH FULL;


--
-- TOC entry 2278 (class 2606 OID 18769)
-- Name: healthprograms_customerlocationsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_customerlocationsirn_fkey FOREIGN KEY (customerlocationsirn) REFERENCES customerlocations(irn) MATCH FULL;


--
-- TOC entry 2280 (class 2606 OID 18759)
-- Name: healthprograms_healthprogramtypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_healthprogramtypeirn_fkey FOREIGN KEY (healthprogramtypeirn) REFERENCES healthprogramtype(irn) MATCH FULL;


--
-- TOC entry 2275 (class 2606 OID 18784)
-- Name: healthprograms_markettypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_markettypeirn_fkey FOREIGN KEY (markettypeirn) REFERENCES markettype(irn) MATCH FULL;


--
-- TOC entry 2273 (class 2606 OID 18794)
-- Name: healthprograms_measurementunitsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_measurementunitsirn_fkey FOREIGN KEY (measurementunitsirn) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2277 (class 2606 OID 18774)
-- Name: healthprograms_speciestypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_speciestypeirn_fkey FOREIGN KEY (speciestypeirn) REFERENCES specietypes(irn) MATCH FULL;


--
-- TOC entry 2274 (class 2606 OID 18789)
-- Name: healthprograms_targetweightrangeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY healthprograms
    ADD CONSTRAINT healthprograms_targetweightrangeirn_fkey FOREIGN KEY (targetweightrangeirn) REFERENCES targetweightrange(irn) MATCH FULL;


--
-- TOC entry 2256 (class 2606 OID 18589)
-- Name: lesionbyuser_lesionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionbyuser
    ADD CONSTRAINT lesionbyuser_lesionsirn_fkey FOREIGN KEY (lesionsirn) REFERENCES lesions(irn) MATCH FULL;


--
-- TOC entry 2257 (class 2606 OID 18584)
-- Name: lesionbyuser_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionbyuser
    ADD CONSTRAINT lesionbyuser_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2244 (class 2606 OID 18453)
-- Name: lesions_lesionscoretypesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesions
    ADD CONSTRAINT lesions_lesionscoretypesirn_fkey FOREIGN KEY (lesionscoretypesirn) REFERENCES lesionscoretypes(irn) MATCH FULL;


--
-- TOC entry 2252 (class 2606 OID 18544)
-- Name: lesionsbyaffiliates_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionsbyaffiliates
    ADD CONSTRAINT lesionsbyaffiliates_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2253 (class 2606 OID 18539)
-- Name: lesionsbyaffiliates_lesionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionsbyaffiliates
    ADD CONSTRAINT lesionsbyaffiliates_lesionsirn_fkey FOREIGN KEY (lesionsirn) REFERENCES lesions(irn) MATCH FULL;


--
-- TOC entry 2251 (class 2606 OID 18549)
-- Name: lesionsbyaffiliates_measurementunitsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionsbyaffiliates
    ADD CONSTRAINT lesionsbyaffiliates_measurementunitsirn_fkey FOREIGN KEY (measurementunitsirn) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2254 (class 2606 OID 18564)
-- Name: lesionsbygroups_lesiongroupsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionsbygroups
    ADD CONSTRAINT lesionsbygroups_lesiongroupsirn_fkey FOREIGN KEY (lesiongroupsirn) REFERENCES lesiongroups(irn) MATCH FULL;


--
-- TOC entry 2255 (class 2606 OID 18559)
-- Name: lesionsbygroups_lesionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionsbygroups
    ADD CONSTRAINT lesionsbygroups_lesionsirn_fkey FOREIGN KEY (lesionsirn) REFERENCES lesions(irn) MATCH FULL;


--
-- TOC entry 2245 (class 2606 OID 18463)
-- Name: lesionscores_lesionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY lesionscores
    ADD CONSTRAINT lesionscores_lesionsirn_fkey FOREIGN KEY (lesionsirn) REFERENCES lesions(irn) MATCH FULL;


--
-- TOC entry 2247 (class 2606 OID 18508)
-- Name: measurementconversions_measurementunitsirn_dest_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY measurementconversions
    ADD CONSTRAINT measurementconversions_measurementunitsirn_dest_fkey FOREIGN KEY (measurementunitsirn_dest) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2248 (class 2606 OID 18503)
-- Name: measurementconversions_measurementunitsirn_src_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY measurementconversions
    ADD CONSTRAINT measurementconversions_measurementunitsirn_src_fkey FOREIGN KEY (measurementunitsirn_src) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2250 (class 2606 OID 18523)
-- Name: measurementunitgroups_measurementgroupsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY measurementunitgroups
    ADD CONSTRAINT measurementunitgroups_measurementgroupsirn_fkey FOREIGN KEY (measurementgroupsirn) REFERENCES measurementgroups(irn) MATCH FULL;


--
-- TOC entry 2249 (class 2606 OID 18528)
-- Name: measurementunitgroups_measurementunitsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY measurementunitgroups
    ADD CONSTRAINT measurementunitgroups_measurementunitsirn_fkey FOREIGN KEY (measurementunitsirn) REFERENCES measurementunits(irn) MATCH FULL;


--
-- TOC entry 2246 (class 2606 OID 18493)
-- Name: measurementunits_measurementcategoriesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY measurementunits
    ADD CONSTRAINT measurementunits_measurementcategoriesirn_fkey FOREIGN KEY (measurementcategoriesirn) REFERENCES measurementcategories(irn) MATCH FULL;


--
-- TOC entry 2263 (class 2606 OID 18649)
-- Name: moduleassignbyrole_moduleirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY moduleassignbyrole
    ADD CONSTRAINT moduleassignbyrole_moduleirn_fkey FOREIGN KEY (moduleirn) REFERENCES module(irn) MATCH FULL;


--
-- TOC entry 2264 (class 2606 OID 18644)
-- Name: moduleassignbyrole_rolesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY moduleassignbyrole
    ADD CONSTRAINT moduleassignbyrole_rolesirn_fkey FOREIGN KEY (rolesirn) REFERENCES roles(irn) MATCH FULL;


--
-- TOC entry 2272 (class 2606 OID 18724)
-- Name: phaseclass_phaseirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY phaseclass
    ADD CONSTRAINT phaseclass_phaseirn_fkey FOREIGN KEY (phaseirn) REFERENCES phase(irn) MATCH FULL;


--
-- TOC entry 2271 (class 2606 OID 18729)
-- Name: phaseclass_therapeuticclassirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY phaseclass
    ADD CONSTRAINT phaseclass_therapeuticclassirn_fkey FOREIGN KEY (therapeuticclassirn) REFERENCES therapeuticclass(irn) MATCH FULL;


--
-- TOC entry 2311 (class 2606 OID 19130)
-- Name: postingsessionentries_protienentitiesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_protienentitiesirn_fkey FOREIGN KEY (protienentitiesirn) REFERENCES protienentities(irn) MATCH FULL;


--
-- TOC entry 2330 (class 2606 OID 19225)
-- Name: postingsessionentries_u_ab_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ab_fkey FOREIGN KEY (u_ab) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2353 (class 2606 OID 19340)
-- Name: postingsessionentries_u_ac_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ac_fkey FOREIGN KEY (u_ac) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2391 (class 2606 OID 19530)
-- Name: postingsessionentries_u_am_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_am_fkey FOREIGN KEY (u_am) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2387 (class 2606 OID 19510)
-- Name: postingsessionentries_u_ap_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ap_fkey FOREIGN KEY (u_ap) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2388 (class 2606 OID 19515)
-- Name: postingsessionentries_u_ars_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ars_fkey FOREIGN KEY (u_ars) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2351 (class 2606 OID 19330)
-- Name: postingsessionentries_u_bb_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bb_fkey FOREIGN KEY (u_bb) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2350 (class 2606 OID 19325)
-- Name: postingsessionentries_u_bdm_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bdm_fkey FOREIGN KEY (u_bdm) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2352 (class 2606 OID 19335)
-- Name: postingsessionentries_u_bf_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bf_fkey FOREIGN KEY (u_bf) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2323 (class 2606 OID 19190)
-- Name: postingsessionentries_u_bl_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bl_fkey FOREIGN KEY (u_bl) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2390 (class 2606 OID 19525)
-- Name: postingsessionentries_u_bls_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bls_fkey FOREIGN KEY (u_bls) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2348 (class 2606 OID 19315)
-- Name: postingsessionentries_u_bmr_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bmr_fkey FOREIGN KEY (u_bmr) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2322 (class 2606 OID 19185)
-- Name: postingsessionentries_u_bnm_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bnm_fkey FOREIGN KEY (u_bnm) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2373 (class 2606 OID 19440)
-- Name: postingsessionentries_u_bpe_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bpe_fkey FOREIGN KEY (u_bpe) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2394 (class 2606 OID 19545)
-- Name: postingsessionentries_u_bps_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bps_fkey FOREIGN KEY (u_bps) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2369 (class 2606 OID 19420)
-- Name: postingsessionentries_u_bsm_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bsm_fkey FOREIGN KEY (u_bsm) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2321 (class 2606 OID 19180)
-- Name: postingsessionentries_u_bt_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bt_fkey FOREIGN KEY (u_bt) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2386 (class 2606 OID 19505)
-- Name: postingsessionentries_u_btl_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_btl_fkey FOREIGN KEY (u_btl) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2345 (class 2606 OID 19300)
-- Name: postingsessionentries_u_bur_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_bur_fkey FOREIGN KEY (u_bur) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2317 (class 2606 OID 19160)
-- Name: postingsessionentries_u_cap_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cap_fkey FOREIGN KEY (u_cap) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2333 (class 2606 OID 19240)
-- Name: postingsessionentries_u_cbs_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cbs_fkey FOREIGN KEY (u_cbs) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2371 (class 2606 OID 19430)
-- Name: postingsessionentries_u_cca_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cca_fkey FOREIGN KEY (u_cca) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2370 (class 2606 OID 19425)
-- Name: postingsessionentries_u_ccc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ccc_fkey FOREIGN KEY (u_ccc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2339 (class 2606 OID 19270)
-- Name: postingsessionentries_u_ccs_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ccs_fkey FOREIGN KEY (u_ccs) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2382 (class 2606 OID 19485)
-- Name: postingsessionentries_u_cdv_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cdv_fkey FOREIGN KEY (u_cdv) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2376 (class 2606 OID 19455)
-- Name: postingsessionentries_u_ce_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ce_fkey FOREIGN KEY (u_ce) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2389 (class 2606 OID 19520)
-- Name: postingsessionentries_u_cfm_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cfm_fkey FOREIGN KEY (u_cfm) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2380 (class 2606 OID 19475)
-- Name: postingsessionentries_u_cgy_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cgy_fkey FOREIGN KEY (u_cgy) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2363 (class 2606 OID 19390)
-- Name: postingsessionentries_u_cl_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cl_fkey FOREIGN KEY (u_cl) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2328 (class 2606 OID 19215)
-- Name: postingsessionentries_u_clr_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_clr_fkey FOREIGN KEY (u_clr) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2374 (class 2606 OID 19445)
-- Name: postingsessionentries_u_cm_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cm_fkey FOREIGN KEY (u_cm) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2384 (class 2606 OID 19495)
-- Name: postingsessionentries_u_coh_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_coh_fkey FOREIGN KEY (u_coh) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2343 (class 2606 OID 19290)
-- Name: postingsessionentries_u_cs_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cs_fkey FOREIGN KEY (u_cs) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2396 (class 2606 OID 19555)
-- Name: postingsessionentries_u_ctk_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ctk_fkey FOREIGN KEY (u_ctk) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2395 (class 2606 OID 19550)
-- Name: postingsessionentries_u_ctn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ctn_fkey FOREIGN KEY (u_ctn) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2379 (class 2606 OID 19470)
-- Name: postingsessionentries_u_cwt_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_cwt_fkey FOREIGN KEY (u_cwt) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2346 (class 2606 OID 19305)
-- Name: postingsessionentries_u_dc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_dc_fkey FOREIGN KEY (u_dc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2365 (class 2606 OID 19400)
-- Name: postingsessionentries_u_ent_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ent_fkey FOREIGN KEY (u_ent) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2337 (class 2606 OID 19260)
-- Name: postingsessionentries_u_eoc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_eoc_fkey FOREIGN KEY (u_eoc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2336 (class 2606 OID 19255)
-- Name: postingsessionentries_u_eod_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_eod_fkey FOREIGN KEY (u_eod) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2344 (class 2606 OID 19295)
-- Name: postingsessionentries_u_eoj_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_eoj_fkey FOREIGN KEY (u_eoj) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2340 (class 2606 OID 19275)
-- Name: postingsessionentries_u_fh_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_fh_fkey FOREIGN KEY (u_fh) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2366 (class 2606 OID 19405)
-- Name: postingsessionentries_u_fp_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_fp_fkey FOREIGN KEY (u_fp) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2342 (class 2606 OID 19285)
-- Name: postingsessionentries_u_gac_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gac_fkey FOREIGN KEY (u_gac) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2360 (class 2606 OID 19375)
-- Name: postingsessionentries_u_gbr_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gbr_fkey FOREIGN KEY (u_gbr) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2361 (class 2606 OID 19380)
-- Name: postingsessionentries_u_giz_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_giz_fkey FOREIGN KEY (u_giz) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2341 (class 2606 OID 19280)
-- Name: postingsessionentries_u_gmi_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gmi_fkey FOREIGN KEY (u_gmi) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2332 (class 2606 OID 19235)
-- Name: postingsessionentries_u_gmx_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gmx_fkey FOREIGN KEY (u_gmx) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2364 (class 2606 OID 19395)
-- Name: postingsessionentries_u_gnx_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gnx_fkey FOREIGN KEY (u_gnx) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2334 (class 2606 OID 19245)
-- Name: postingsessionentries_u_gtn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_gtn_fkey FOREIGN KEY (u_gtn) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2392 (class 2606 OID 19535)
-- Name: postingsessionentries_u_het_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_het_fkey FOREIGN KEY (u_het) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2385 (class 2606 OID 19500)
-- Name: postingsessionentries_u_hex_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_hex_fkey FOREIGN KEY (u_hex) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2381 (class 2606 OID 19480)
-- Name: postingsessionentries_u_hk_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_hk_fkey FOREIGN KEY (u_hk) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2378 (class 2606 OID 19465)
-- Name: postingsessionentries_u_htk_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_htk_fkey FOREIGN KEY (u_htk) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2398 (class 2606 OID 19565)
-- Name: postingsessionentries_u_hy_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_hy_fkey FOREIGN KEY (u_hy) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2397 (class 2606 OID 19560)
-- Name: postingsessionentries_u_ie_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ie_fkey FOREIGN KEY (u_ie) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2399 (class 2606 OID 19570)
-- Name: postingsessionentries_u_ih_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ih_fkey FOREIGN KEY (u_ih) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2325 (class 2606 OID 19200)
-- Name: postingsessionentries_u_ip_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ip_fkey FOREIGN KEY (u_ip) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2358 (class 2606 OID 19365)
-- Name: postingsessionentries_u_it_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_it_fkey FOREIGN KEY (u_it) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2314 (class 2606 OID 19145)
-- Name: postingsessionentries_u_ld_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ld_fkey FOREIGN KEY (u_ld) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2331 (class 2606 OID 19230)
-- Name: postingsessionentries_u_le_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_le_fkey FOREIGN KEY (u_le) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2319 (class 2606 OID 19170)
-- Name: postingsessionentries_u_liv_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_liv_fkey FOREIGN KEY (u_liv) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2327 (class 2606 OID 19210)
-- Name: postingsessionentries_u_mc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_mc_fkey FOREIGN KEY (u_mc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2356 (class 2606 OID 19355)
-- Name: postingsessionentries_u_ml_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ml_fkey FOREIGN KEY (u_ml) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2349 (class 2606 OID 19320)
-- Name: postingsessionentries_u_mmx_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_mmx_fkey FOREIGN KEY (u_mmx) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2347 (class 2606 OID 19310)
-- Name: postingsessionentries_u_mtc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_mtc_fkey FOREIGN KEY (u_mtc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2312 (class 2606 OID 19135)
-- Name: postingsessionentries_u_ne_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ne_fkey FOREIGN KEY (u_ne) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2326 (class 2606 OID 19205)
-- Name: postingsessionentries_u_ol_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ol_fkey FOREIGN KEY (u_ol) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2354 (class 2606 OID 19345)
-- Name: postingsessionentries_u_om_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_om_fkey FOREIGN KEY (u_om) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2372 (class 2606 OID 19435)
-- Name: postingsessionentries_u_pl_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_pl_fkey FOREIGN KEY (u_pl) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2362 (class 2606 OID 19385)
-- Name: postingsessionentries_u_pnu_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_pnu_fkey FOREIGN KEY (u_pnu) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2316 (class 2606 OID 19155)
-- Name: postingsessionentries_u_pr_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_pr_fkey FOREIGN KEY (u_pr) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2377 (class 2606 OID 19460)
-- Name: postingsessionentries_u_prv_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_prv_fkey FOREIGN KEY (u_prv) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2324 (class 2606 OID 19195)
-- Name: postingsessionentries_u_rkt_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_rkt_fkey FOREIGN KEY (u_rkt) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2318 (class 2606 OID 19165)
-- Name: postingsessionentries_u_rw_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_rw_fkey FOREIGN KEY (u_rw) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2383 (class 2606 OID 19490)
-- Name: postingsessionentries_u_ry_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_ry_fkey FOREIGN KEY (u_ry) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2320 (class 2606 OID 19175)
-- Name: postingsessionentries_u_sc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_sc_fkey FOREIGN KEY (u_sc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2368 (class 2606 OID 19415)
-- Name: postingsessionentries_u_sh_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_sh_fkey FOREIGN KEY (u_sh) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2357 (class 2606 OID 19360)
-- Name: postingsessionentries_u_sns_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_sns_fkey FOREIGN KEY (u_sns) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2375 (class 2606 OID 19450)
-- Name: postingsessionentries_u_sx_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_sx_fkey FOREIGN KEY (u_sx) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2329 (class 2606 OID 19220)
-- Name: postingsessionentries_u_tds_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_tds_fkey FOREIGN KEY (u_tds) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2313 (class 2606 OID 19140)
-- Name: postingsessionentries_u_th_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_th_fkey FOREIGN KEY (u_th) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2359 (class 2606 OID 19370)
-- Name: postingsessionentries_u_thy_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_thy_fkey FOREIGN KEY (u_thy) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2355 (class 2606 OID 19350)
-- Name: postingsessionentries_u_tk_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_tk_fkey FOREIGN KEY (u_tk) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2338 (class 2606 OID 19265)
-- Name: postingsessionentries_u_tn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_tn_fkey FOREIGN KEY (u_tn) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2393 (class 2606 OID 19540)
-- Name: postingsessionentries_u_tra_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_tra_fkey FOREIGN KEY (u_tra) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2315 (class 2606 OID 19150)
-- Name: postingsessionentries_u_trc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_trc_fkey FOREIGN KEY (u_trc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2367 (class 2606 OID 19410)
-- Name: postingsessionentries_u_tw_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_tw_fkey FOREIGN KEY (u_tw) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2335 (class 2606 OID 19250)
-- Name: postingsessionentries_u_wc_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessionentries
    ADD CONSTRAINT postingsessionentries_u_wc_fkey FOREIGN KEY (u_wc) REFERENCES lesionscores(irn) MATCH FULL;


--
-- TOC entry 2301 (class 2606 OID 18947)
-- Name: postingsessions_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2294 (class 2606 OID 18982)
-- Name: postingsessions_customerlocationsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_customerlocationsirn_fkey FOREIGN KEY (customerlocationsirn) REFERENCES customerlocations(irn) MATCH FULL;


--
-- TOC entry 2295 (class 2606 OID 18977)
-- Name: postingsessions_customersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_customersirn_fkey FOREIGN KEY (customersirn) REFERENCES customers(irn) MATCH FULL;


--
-- TOC entry 2298 (class 2606 OID 18962)
-- Name: postingsessions_feedprogramirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_feedprogramirn_fkey FOREIGN KEY (feedprogramirn) REFERENCES healthprograms(irn) MATCH FULL;


--
-- TOC entry 2300 (class 2606 OID 18952)
-- Name: postingsessions_markettypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_markettypeirn_fkey FOREIGN KEY (markettypeirn) REFERENCES markettype(irn) MATCH FULL;


--
-- TOC entry 2299 (class 2606 OID 18957)
-- Name: postingsessions_targetweightrangeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_targetweightrangeirn_fkey FOREIGN KEY (targetweightrangeirn) REFERENCES targetweightrange(irn) MATCH FULL;


--
-- TOC entry 2302 (class 2606 OID 18942)
-- Name: postingsessions_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2296 (class 2606 OID 18972)
-- Name: postingsessions_vaccineprogramirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_vaccineprogramirn_fkey FOREIGN KEY (vaccineprogramirn) REFERENCES healthprograms(irn) MATCH FULL;


--
-- TOC entry 2297 (class 2606 OID 18967)
-- Name: postingsessions_waterprogramirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY postingsessions
    ADD CONSTRAINT postingsessions_waterprogramirn_fkey FOREIGN KEY (waterprogramirn) REFERENCES healthprograms(irn) MATCH FULL;


--
-- TOC entry 2290 (class 2606 OID 18870)
-- Name: proteinfarms_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY proteinfarms
    ADD CONSTRAINT proteinfarms_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2291 (class 2606 OID 18865)
-- Name: proteinfarms_customerlocationsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY proteinfarms
    ADD CONSTRAINT proteinfarms_customerlocationsirn_fkey FOREIGN KEY (customerlocationsirn) REFERENCES customerlocations(irn) MATCH FULL;


--
-- TOC entry 2292 (class 2606 OID 18885)
-- Name: proteinhouses_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY proteinhouses
    ADD CONSTRAINT proteinhouses_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2293 (class 2606 OID 18880)
-- Name: proteinhouses_proteinfarmsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY proteinhouses
    ADD CONSTRAINT proteinhouses_proteinfarmsirn_fkey FOREIGN KEY (proteinfarmsirn) REFERENCES proteinfarms(irn) MATCH FULL;


--
-- TOC entry 2305 (class 2606 OID 19102)
-- Name: protienentities_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2308 (class 2606 OID 19087)
-- Name: protienentities_breedsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_breedsirn_fkey FOREIGN KEY (breedsirn) REFERENCES breeds(irn) MATCH FULL;


--
-- TOC entry 2304 (class 2606 OID 19107)
-- Name: protienentities_diagnostician_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_diagnostician_fkey FOREIGN KEY (diagnostician) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2307 (class 2606 OID 19092)
-- Name: protienentities_healthprogramsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_healthprogramsirn_fkey FOREIGN KEY (healthprogramsirn) REFERENCES healthprograms(irn) MATCH FULL;


--
-- TOC entry 2303 (class 2606 OID 19112)
-- Name: protienentities_postingsessionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_postingsessionsirn_fkey FOREIGN KEY (postingsessionsirn) REFERENCES postingsessions(irn) MATCH FULL;


--
-- TOC entry 2310 (class 2606 OID 19077)
-- Name: protienentities_proteinfarmsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_proteinfarmsirn_fkey FOREIGN KEY (proteinfarmsirn) REFERENCES proteinfarms(irn) MATCH FULL;


--
-- TOC entry 2309 (class 2606 OID 19082)
-- Name: protienentities_proteinhousesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_proteinhousesirn_fkey FOREIGN KEY (proteinhousesirn) REFERENCES proteinhouses(irn) MATCH FULL;


--
-- TOC entry 2306 (class 2606 OID 19097)
-- Name: protienentities_specietypesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY protienentities
    ADD CONSTRAINT protienentities_specietypesirn_fkey FOREIGN KEY (specietypesirn) REFERENCES specietypes(irn) MATCH FULL;


--
-- TOC entry 2401 (class 2606 OID 19590)
-- Name: reportprofile_lesiongroupsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY reportprofile
    ADD CONSTRAINT reportprofile_lesiongroupsirn_fkey FOREIGN KEY (lesiongroupsirn) REFERENCES lesiongroups(irn) MATCH FULL;


--
-- TOC entry 2400 (class 2606 OID 19595)
-- Name: reportprofile_lesionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY reportprofile
    ADD CONSTRAINT reportprofile_lesionsirn_fkey FOREIGN KEY (lesionsirn) REFERENCES lesions(irn) MATCH FULL;


--
-- TOC entry 2402 (class 2606 OID 19585)
-- Name: reportprofile_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY reportprofile
    ADD CONSTRAINT reportprofile_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2261 (class 2606 OID 18624)
-- Name: roleassignbyaffliateregion_affiliatesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY roleassignbyaffliateregion
    ADD CONSTRAINT roleassignbyaffliateregion_affiliatesirn_fkey FOREIGN KEY (affiliatesirn) REFERENCES affiliates(irn) MATCH FULL;


--
-- TOC entry 2260 (class 2606 OID 18629)
-- Name: roleassignbyaffliateregion_regionsirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY roleassignbyaffliateregion
    ADD CONSTRAINT roleassignbyaffliateregion_regionsirn_fkey FOREIGN KEY (regionsirn) REFERENCES regions(irn) MATCH FULL;


--
-- TOC entry 2262 (class 2606 OID 18619)
-- Name: roleassignbyaffliateregion_rolesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY roleassignbyaffliateregion
    ADD CONSTRAINT roleassignbyaffliateregion_rolesirn_fkey FOREIGN KEY (rolesirn) REFERENCES roles(irn) MATCH FULL;


--
-- TOC entry 2242 (class 2606 OID 18410)
-- Name: specietypes_speciesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY specietypes
    ADD CONSTRAINT specietypes_speciesirn_fkey FOREIGN KEY (speciesirn) REFERENCES species(irn);


--
-- TOC entry 2407 (class 2606 OID 19675)
-- Name: synchronization_errortypeirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY synchronization
    ADD CONSTRAINT synchronization_errortypeirn_fkey FOREIGN KEY (errortypeirn) REFERENCES errortype(irn) MATCH FULL;


--
-- TOC entry 2408 (class 2606 OID 19670)
-- Name: synchronization_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY synchronization
    ADD CONSTRAINT synchronization_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2259 (class 2606 OID 18604)
-- Name: userroles_rolesirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_rolesirn_fkey FOREIGN KEY (rolesirn) REFERENCES roles(irn) MATCH FULL;


--
-- TOC entry 2258 (class 2606 OID 18609)
-- Name: userroles_usersirn_fkey; Type: FK CONSTRAINT; Schema: HTSi_Owner; Owner: postgres
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_usersirn_fkey FOREIGN KEY (usersirn) REFERENCES users(irn) MATCH FULL;


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-09-05 16:56:20

--
-- PostgreSQL database dump complete
--

