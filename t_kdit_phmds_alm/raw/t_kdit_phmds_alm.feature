@kdit
Feature: Tests for t_kdit_phmds_alm in kdit

  @execute
  Scenario: t_kdit_phmds_alm-raw-punctual
    Given an ingestion config file ${repository.endpoint}/${repository.repo}/kirby/mx/kdit/raw/t_kdit_phmds_alm/${version}/t_kdit_phmds_alm.conf
    When I read input as dataframe
    And I read output as dataframe
    Then output dataframe is not empty
    And output dataframe has the same records than input dataframe
    And the number of columns for output dataframe is greather to the number of columns for input dataframe
    And output partitions have less than 100 files per directory
    And I want to show file size measures for output dataframe in MB
    And output dataframe does not have null values for columns:
      | column name           |
      | business_day_id       |
      | hk_gl_desc            |
      | load_dt_date          |
      | srce_sys_desc         |
      | srce_sbsys_desc       |
      | proc_id               |
      | load_process_id       |
      | audit_date            |
    And records for output dataframe have the format ^\d+(\.)?$ for columns:
      | column name           |
      | proc_id               |
    And records for output dataframe have the format \d{4}-\d{2}-\d{2} for columns:
      | column name           |
      | load_dt_date          |
    And records for output dataframe have the format ^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{3}$ for columns:
      | column name           |
      | audit_date            |
