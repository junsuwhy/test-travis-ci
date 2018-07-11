CREATE TABLE civicrm_financial_trxn_a (
       id int unsigned NOT NULL AUTO_INCREMENT  COMMENT 'Gift ID',
       from_account_id int unsigned    COMMENT 'FK to financial_account table.',
       to_account_id int unsigned    COMMENT 'FK to financial_account table.',
       trxn_date datetime NOT NULL   ,
       trxn_type enum('Debit', 'Credit') NOT NULL   ,
       total_amount decimal(20,2) NOT NULL   COMMENT 'amount of transaction',
       fee_amount decimal(20,2)    COMMENT 'actual processor fee if known - may be 0.',
       net_amount decimal(20,2)    COMMENT 'actual funds transfer amount. total less fees. if processor does not report actual fee during transaction, this is set to total_amount.',
       currency varchar(3)   DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
       payment_processor varchar(64) NOT NULL   COMMENT 'derived from Processor setting in civicrm.settings.php.',
       trxn_id varchar(255) NOT NULL   COMMENT 'unique processor transaction id, bank id + trans id,... depending on payment_method',
       trxn_result_code varchar(255)    COMMENT 'processor result code' 
  ,PRIMARY KEY ( id ),     UNIQUE INDEX UI_ft_trxn_id(trxn_id)
  )  ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC  ;