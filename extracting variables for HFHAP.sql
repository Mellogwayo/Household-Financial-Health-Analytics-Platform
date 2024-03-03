SELECT pidp, jkl_hidp, j_hidp, k_hidp, l_hidp, jkl_pno, jkl_mnpno, jkl_fnpno, jkl_mnpid, jkl_fnpid,
       jkl_mnspno, jkl_fnspno, jkl_mnspid, jkl_fnspid, jkl_grmpno, jkl_grfpno, jkl_childpno, jkl_ppid,
       jkl_ppno, jkl_sppid, jkl_sppno, jkl_country, jkl_gor_dv, jkl_urban_dv, jkl_sex_dv, jkl_doby_dv,
       jkl_age_dv, jkl_mastat_dv, jkl_nchild_dv, jkl_jbstat, jkl_ethn_dv, bornuk_dv, jkl_nmpsp_dv,
       jkl_jbsoc00_cc, jkl_jbnssec8_dv, jkl_jbnssec5_dv, jkl_jbnssec3_dv, jkl_fimnnet_dv, jkl_fimnlabnet_dv,
       jkl_sf12mcs_dv, jkl_sf12pcs_dv, jkl_health, jkl_scghq1_dv, jkl_scghq2_dv, jkl_hhsize, jkl_nkids_dv,
       jkl_hhtype_dv
FROM jkl_indresp;

SELECT jkl_hidp, jkl_tenure_dv, jkl_fihhmnnet1_dv, jkl_ieqmoecd_dv
FROM jkl_hhresp;

 SELECT 
    i.pidp, i.jkl_hidp, i.j_hidp, i.k_hidp, i.l_hidp, i.jkl_pno, i.jkl_mnpno, i.jkl_fnpno, i.jkl_mnpid, 
    i.jkl_fnpid, i.jkl_mnspno, i.jkl_fnspno, i.jkl_mnspid, i.jkl_fnspid, i.jkl_grmpno, i.jkl_grfpno, 
    i.jkl_childpno, i.jkl_ppid, i.jkl_ppno, i.jkl_sppid, i.jkl_sppno, i.jkl_country, i.jkl_gor_dv, 
    i.jkl_urban_dv, i.jkl_sex_dv, i.jkl_doby_dv, i.jkl_age_dv, i.jkl_mastat_dv, i.jkl_nchild_dv, 
    i.jkl_jbstat, i.jkl_ethn_dv, i.bornuk_dv, i.jkl_nmpsp_dv, i.jkl_jbsoc00_cc, i.jkl_jbnssec8_dv, 
    i.jkl_jbnssec5_dv, i.jkl_jbnssec3_dv, i.jkl_fimnnet_dv, i.jkl_fimnlabnet_dv, i.jkl_sf12mcs_dv, 
    i.jkl_sf12pcs_dv, i.jkl_health, i.jkl_scghq1_dv, i.jkl_scghq2_dv, i.jkl_hhsize, i.jkl_nkids_dv, 
    i.jkl_hhtype_dv, h.jkl_tenure_dv, h.jkl_fihhmnnet1_dv, h.jkl_ieqmoecd_dv
FROM 
    jkl_indresp i
INNER JOIN 
    jkl_hhresp h ON i.jkl_hidp = h.jkl_hidp;
	
CREATE TABLE combined_table AS
SELECT jkl_indresp.*, jkl_hhresp.jkl_tenure_dv, jkl_hhresp.jkl_fihhmnnet1_dv, jkl_hhresp.jkl_ieqmoecd_dv
FROM jkl_indresp
JOIN jkl_hhresp ON jkl_indresp.jkl_hidp = jkl_hhresp.jkl_hidp;





