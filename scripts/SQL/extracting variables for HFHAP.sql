DROP TABLE IF EXISTS data;

CREATE TABLE data AS
SELECT 
    i.pidp, i.jkl_hidp, i.j_hidp, i.k_hidp, i.l_hidp, i.jkl_pno, i.jkl_mnpno, i.jkl_fnpno, 
    i.jkl_mnpid, i.jkl_fnpid, i.jkl_mnspno, i.jkl_fnspno, i.jkl_mnspid, i.jkl_fnspid, 
    i.jkl_grmpno, i.jkl_grfpno, i.jkl_childpno, i.jkl_ppid, i.jkl_ppno, i.jkl_sppid, 
    i.jkl_sppno, i.jkl_country, i.jkl_gor_dv, i.jkl_urban_dv, i.jkl_sex_dv, i.jkl_doby_dv, 
    i.jkl_age_dv, i.jkl_mastat_dv, i.jkl_nchild_dv, i.jkl_jbstat, i.jkl_ethn_dv, i.bornuk_dv, 
    i.jkl_hiqual_dv, i.jkl_jbsoc00_cc, i.jkl_jbnssec8_dv, i.jkl_jbnssec5_dv, i.jkl_jbnssec3_dv, 
    i.jkl_fimnnet_dv, i.jkl_fimnlabnet_dv, i.jkl_sf12mcs_dv, i.jkl_sf12pcs_dv, i.jkl_health, 
    i.jkl_scghq1_dv, i.jkl_scghq2_dv, i.jkl_hhsize, i.jkl_nkids_dv, i.jkl_hhtype_dv, 
    h.jkl_tenure_dv, h.jkl_fihhmnnet1_dv, h.jkl_ieqmoecd_dv
FROM 
    jkl_indresp i
INNER JOIN 
    jkl_hhresp h ON i.jkl_hidp = h.jkl_hidp;
